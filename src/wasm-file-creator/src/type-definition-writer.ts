import fs from 'fs/promises';
import { Method } from './code-parser';

async function writeFile(directory: string, fileName: string, data: string) {
    await fs.mkdir(directory, { recursive: true });
    await fs.writeFile(`${directory}/${fileName}`, data);
}


export class TypeDefinitionWriter {

    constructor(private outputDir: string, private methods: Method[]) { }

    async writeTypesAndInterfaces() {
        let data = `export type quantum = number;
export type quantumArray = Uint8Array;

/** @internal */
export type size = number | bigint;

/** @internal */
export type NativePointer = size;

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
    _malloc(size: number): number;
    _free(instance: number): void;
    HEAPU8: Uint8Array;
    FS: VirtualFileSystem;
    addFunction(method: (...args: any[]) => void, signature: string): number;
    getValue(instance: number, type: string): number;
    lengthBytesUTF8(str: string): number;
    setValue(instance: number, value: number, type: string): void;
    stringToUTF8(str: string, outPtr: number, maxBytesToWrite: number): void;
    UTF8ToString(ptr: number): string;
    _NullPointer: NativePointer;
    _PointerSize: number;
    _CastToSize(value: number): size;
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

/** @internal */
export type MagickNativeApi = (wasmLocator: IWasmLocator) => Promise<ImageMagickApi>;`

        await writeFile(this.outputDir, 'magick.d.ts', data);
    }

    async writeWasmExport(architecture: string) {
        let data = `import type { MagickNativeApi } from '../magick';

/** @internal */
declare const MagickNative${architecture}: MagickNativeApi;

/** @internal */
export default MagickNative${architecture};`

        await writeFile(`${this.outputDir}/${architecture}`, 'magick.d.ts', data);
    }
}
