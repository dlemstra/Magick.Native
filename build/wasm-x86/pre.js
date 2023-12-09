(function checkCryptoPolyfill() {
    let globalObject = typeof window != 'undefined' ? window : global;
    if (typeof globalObject.crypto == 'undefined' || typeof crypto['getRandomValues'] != 'function') {
        globalObject.crypto = { getRandomValues: (array) => { for (let i = 0; i < array.length; i++) array[i] = (Math.random() * 256) | 0 } };
    }
})();