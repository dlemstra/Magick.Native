import fs from 'fs';
import util from 'util';
import { Method } from './code-parser';

const writeFile = util.promisify(fs.writeFile);

export class TypeDefinitionWriter {

    constructor(private methods: Method[]) { }

    async write(fileName: string) {
        let data = `/** @internal */
type quantum = number;

/** @internal */
export interface MagickNative {
    _malloc(size: number) : number;
    _free(instance: number): void;
    getValue(instance: number, type: string): number;
    setValue(instance: number, value: number, type: string): void;
    UTF8ToString(ptr: number): string;
    lengthBytesUTF8(str: string): number;
    stringToUTF8(str: string, outPtr: number, maxBytesToWrite: number): void;
    addFunction(func: any, signature: string): number;
`;

    for (const method of this.methods) {
        data += `    _${method.name}(`
        method.parameters.forEach((parameter, index) => {
            if (index > 0)
                data += ', ';
            data += `${parameter.name}: ${parameter.type}`;
        });
        data += `): ${method.returnType};
`
    }
data += `}

declare const MagickNative : () => Promise<MagickNative>;
export default MagickNative;`

        await writeFile(fileName, data);
    }
}