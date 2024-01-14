import fs from 'fs';
import util from 'util';
import { CodeParser } from './code-parser';
import { TypeDefinitionWriter } from './type-definition-writer';

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);

async function getCodeFiles(dir: string) {
    let result = new Array<string>();
    const content = await readdir(dir);
    for (const item of content) {
        const path = dir + '/' + item;
        if ((await stat(path)).isDirectory()) {
            const children = await getCodeFiles(path);
            result = result.concat(children);
        } else if (path.endsWith('.c')) {
            result.push(path);
        }
    }

    return result;
}

async function main(dir: string, outputDir: string) {
    const codeFiles = await getCodeFiles(dir);

    const codeParser = new CodeParser(codeFiles);
    const methods = await codeParser.getMethods();

    const writer = new TypeDefinitionWriter(methods);
    await writer.write(`${outputDir}/magick.d.ts`);
}

const dir = process.argv[2];
const outputDir = process.argv[3];
main(dir, outputDir).catch(err => {
    console.error(err);
    process.exit(1);
});