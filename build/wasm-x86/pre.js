if (!globalThis.crypto?.getRandomValues) {
    globalThis.crypto = { getRandomValues: (array) => { for (let i = 0; i < array.length; i++) array[i] = (Math.random() * 256) | 0 } };
}
