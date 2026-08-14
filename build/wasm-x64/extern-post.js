export function CreateNativePointer(instance) {
    return BigInt(instance);
}

export const NativePointerSize = 8;
export const NativePointerType = 'i64';
export const NativeZero = 0n;
