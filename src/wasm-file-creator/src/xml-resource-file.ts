import fs from 'fs';

export class XmlResourceFile {
    public readonly name: string;
    public readonly data: string;

    constructor(dir: string, name: string) {
        this.name = name;
        this.data = fs.readFileSync(`${dir}/Resources/xml/${name}.xml`).toString();
    }
}