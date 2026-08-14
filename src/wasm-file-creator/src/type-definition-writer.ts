import fs from 'fs';
import util from 'util';
import { Method } from './code-parser';

const writeFile = util.promisify(fs.writeFile);

export class TypeDefinitionWriter {

    constructor(private methods: Method[]) { }

    async write(fileName: string) {
        let data = `export type quantum = number;
export type quantumArray = Uint8Array;
export type pointer = number;

/** @internal */
export interface FileStream {}

/** @internal */
export interface PathInfo {
    exists: boolean;
}

/** @internal */
export interface VirtualFileSystem {
    analyzePath(path: string): PathInfo;
    close(stream: FileStream): void;
    mkdir(path: string): void;
    open(path: string, mode: string): FileStream;
    write(stream: FileStream, buffer: Uint8Array, offset: number, length: number): void;
}

/** @internal */
export interface ImageMagickApi {
    _malloc(size: number): pointer;
    _free(instance: pointer): void;
    HEAPU8: Uint8Array;
    FS: VirtualFileSystem;
    addFunction(method: (...args: any[]) => void, signature: string): pointer;
    getValue(instance: pointer, type: string): pointer;
    lengthBytesUTF8(str: string): number;
    setValue(instance: pointer, value: pointer, type: string): void;
    stringToUTF8(str: string, outPtr: pointer, maxBytesToWrite: number): void;
    UTF8ToString(ptr: pointer): string;
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

/** @internal */
export interface IWasmLocator {
    wasmBinary?: Int8Array | Uint8Array | Uint8ClampedArray;
    locateFile?: (path: string, scriptDirectory: string) => string;
    instantiateWasm?: (importObject: WebAssembly.Imports, successCallback: (module: WebAssembly.Instance) => void) => void;
}

declare const MagickNative: (wasmLocator: IWasmLocator) => Promise<ImageMagickApi>;
export default MagickNative;`

        await writeFile(fileName, data);
    }
}