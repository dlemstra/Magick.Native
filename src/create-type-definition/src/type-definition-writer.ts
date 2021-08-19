import fs from 'fs';
import util from 'util';
import { Method } from './code-parser';

const writeFile = util.promisify(fs.writeFile);

export class TypeDefinitionWriter {

    constructor(private methods: Method[]) { }

    async write(fileName: string) {
        let data = `export type quantum = number;
export type quantumArray = Uint8Array;

/** @internal */
export type stream = {};

/** @internal */
export interface PathInfo {
    exists: boolean;
}

/** @internal */
export interface VirtualFileSystem {
    analyzePath(path: string): PathInfo;
    close(stream: stream): void;
    mkdir(path: string): void;
    open(path: string, mode: string): stream;
    write(stream: stream, buffer: Uint8Array, offset: number, length: number): void;
}

/** @internal */
export interface ImageMagickApi {
    _malloc(size: number) : number;
    _free(instance: number): void;
    HEAPU8: quantumArray;
    FS: VirtualFileSystem;
    getValue(instance: number, type: string): number;
    setValue(instance: number, value: number, type: string): void;
    UTF8ToString(ptr: number): string;
    lengthBytesUTF8(str: string): number;
    stringToUTF8(str: string, outPtr: number, maxBytesToWrite: number): void;
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

declare const MagickNative: () => Promise<ImageMagickApi>;
export default MagickNative;`

        await writeFile(fileName, data);
    }
}