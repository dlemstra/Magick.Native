if (!globalThis.crypto || !globalThis.crypto.getRandomValues) {
    globalThis.crypto = { getRandomValues: (array) => { for (let i = 0; i < array.length; i++) array[i] = (Math.random() * 256) | 0 } };
}

export function CreateNativePointer(instance) {
    return BigInt(instance);
}

export const NativePointerSize = 8;
export const NativePointerType = 'i64';
export const NativeZero = 0n;
