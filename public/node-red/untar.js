const tar = require("tar");
const path = require("path");
const fs = require("fs");

if (process.argv.length <= 2) {
    console.error("Please provide the path to the .tgz file");
    process.exit(1);
}

const tgzPath = path.resolve(process.argv[2]);
const outputDir = path.join(process.cwd(), path.basename(tgzPath, ".tgz"));

if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir);
}

tar.x({
    file: tgzPath,
    cwd: outputDir,
}).catch((err) => {
    console.error(err);
    process.exit(1);
});
