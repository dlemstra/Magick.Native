import fs from 'fs';
import util from 'util';

const readFile = util.promisify(fs.readFile);

export interface Parameter {
    name: string
    type: string
}

export interface Method {
    name: string
    returnType: string
    parameters: Parameter[]
}

export class CodeParser {

    constructor(private files: string[]) { }

    async getMethods() {
        let result = new Array<Method>();
        for (const file of this.files) {
            const methods = await this.parseFile(file);
            result = result.concat(methods);
        }

        return result;
    }

    private async parseFile(fileName: string) {
        let methods = new Array<Method>();

        var data = await readFile(fileName);
        var lines = data.toString().split('\n');

        for (const line of lines) {
            if (!line.startsWith('MAGICK_NATIVE_EXPORT'))
                continue;

            const method = this.getMethod(line.substring(21));
            methods.push(method);
        }

        return methods;
    }

    private getMethod(line: string): Method {
        line = this.removeStartKeywords(line);

        const info = line.split(' ');

        return {
            name: this.getName(info[1]),
            returnType: this.getReturnType(info[0], info[1]),
            parameters: this.getParameters(line)
        };
    }

    private getName(methodName: string) {
        const startIndex = methodName[0] === '*' ? methodName[1] === '*' ? 2 : 1 : 0;
        const length = methodName.indexOf('(') - startIndex;

        return methodName.substring(startIndex, startIndex + length);
    }

    private getReturnType(returnType: string, methodName: string) {
        if (methodName[0] === '*')
            return 'number'

        return this.getType(returnType);
    }

    private getParameters(line: string) {
        const parameters = new Array<Parameter>();

        const startIndex = line.indexOf('(') + 1;
        const length = line.indexOf(')') - startIndex;

        if (length == 0)
            return parameters;

        for (const type of line.substring(startIndex, startIndex + length).split(', ')) {
            if (type === 'void')
                continue;

            const info = type.split(' ');
            let name = info[info.length - 1];
            const typeName = type.substring(0, type.length - name.length - 1);

            if (name.startsWith('*')) {
                while (name.startsWith('*'))
                    name = name.substring(1);

                parameters.push({ name, type: 'number' });
            } else {
                parameters.push({ name, type: this.getType(typeName) });
            }
        }

        return parameters;
    }

    private getType(typeName: string) {
        typeName = this.removeStartKeywords(typeName);

        if (typeName.endsWith('*'))
            return 'number';

        switch (typeName) {
            case 'void':
                return 'void';
            case 'char':
            case 'double':
            case 'AlignType':
            case 'AutoThresholdMethod':
            case 'ClipPathUnits':
            case 'ColorspaceType':
            case 'ComplexOperator':
            case 'CompositeOperator':
            case 'CompressionType':
            case 'CustomStreamHandler':
            case 'CustomStreamSeeker':
            case 'CustomStreamTeller':
            case 'DecorationType':
            case 'DirectionType':
            case 'DitherMethod':
            case 'ExceptionType':
            case 'EndianType':
            case 'FillRule':
            case 'FilterType':
            case 'GravityType':
            case 'ImageType':
            case 'InterlaceType':
            case 'LineCap':
            case 'LineJoin':
            case 'long':
            case 'MagickBooleanType':
            case 'MagickCLDevice':
            case 'MagickCLDeviceType':
            case 'KernelProfileRecord':
            case 'MagickLogMethod':
            case 'MagickProgressMonitor':
            case 'MagickSizeType':
            case 'MagickStatusType':
            case 'PaintMethod':
            case 'size_t':
            case 'ssize_t':
            case 'StretchType':
            case 'StyleType':
                return 'number';
            case 'Quantum':
                return 'quantum';
            default:
                throw new Error(`Unknown type name: "${typeName}"`);
        }
    }

    private removeStartKeywords(value: string) {
        if (value.startsWith('const '))
            value = value.substring(6);

        if (value.startsWith('unsigned '))
            value = value.substring(9);

        return value;
    }
}