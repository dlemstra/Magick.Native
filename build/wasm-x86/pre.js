if (!globalThis.crypto || !globalThis.crypto.getRandomValues) {
    globalThis.crypto = { getRandomValues: (array) => { for (let i = 0; i < array.length; i++) array[i] = (Math.random() * 256) | 0 } };
}

export function CreateNativePointer(instance) {
    return instance;
}

export const NativePointerSize = 4;
export const NativePointerType = 'i32';
export const NativeZero = 0;
