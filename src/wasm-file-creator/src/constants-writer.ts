import fs from 'fs';
import util from 'util';
import { XmlResourceFile } from './xml-resource-file';

const writeFile = util.promisify(fs.writeFile);

export class ConstantsWriter {

    constructor(private xmlResourceFiles: XmlResourceFile[]) { }

    async write(fileName: string) {
        let data = `/** @internal */
export const MagickConstants = {
    XmlResourceFiles: {
`;

        for (const xmlResourceFile of this.xmlResourceFiles) {
            data += `        ${xmlResourceFile.name}: \`${xmlResourceFile.data}\`,`
        }

        data += `
    }
}
`;

        await writeFile(fileName, data);
    }
}