import fs from 'fs';
import util from 'util';
import { Method } from './code-parser';

const writeFile = util.promisify(fs.writeFile);

export class TypeDefinitionWriter {

    constructor(private methods: Method[]) { }

    async write(fileName: string) {
        let data = `export type NativePointer = number;
export type NativeQuantum = number;
export type NativeQuantumArray = Uint8Array;
export type NativeSizeT = number;

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
export interface HEAPU8 {
    set(array: ByteArray, offset: NativeSizeT): void;
    subarray(instance: NativePointer, length: NativeSizeT): Uint8Array;
}

/** @internal */
export interface ImageMagickApi {
    _malloc(size: number): NativePointer;
    _free(instance: NativePointer): void;
    HEAPU8: HEAPU8;
    FS: VirtualFileSystem;
    addFunction(method: (...args: any[]) => void, signature: string): NativePointer;
    getValue(instance: NativePointer, type: string): NativePointer;
    lengthBytesUTF8(str: string): number;
    setValue(instance: NativePointer, value: NativePointer, type: string): void;
    stringToUTF8(str: string, outPtr: NativePointer, maxBytesToWrite: number): void;
    UTF8ToString(ptr: NativePointer): string;
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