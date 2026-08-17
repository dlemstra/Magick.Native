if (!globalThis.crypto || !globalThis.crypto.getRandomValues) {
    globalThis.crypto = { getRandomValues: (array) => { for (let i = 0; i < array.length; i++) array[i] = (Math.random() * 256) | 0 } };
}
Module["_CastToSize"] = (value) => BigInt(value);
Module["_NullPointer"] = 0n;
Module["_PointerSize"] = 8;
