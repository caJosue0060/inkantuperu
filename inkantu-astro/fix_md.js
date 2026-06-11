import fs from 'fs';
import path from 'path';

const dirs = ['./src/content/tours', './src/content/pages'];

dirs.forEach(dir => {
    if (!fs.existsSync(dir)) return;
    fs.readdirSync(dir).forEach(file => {
        if (!file.endsWith('.md')) return;
        let content = fs.readFileSync(path.join(dir, file), 'utf8');
        
        let parts = content.split('---');
        if (parts.length >= 3) {
            let frontmatter = parts[1];
            let body = parts.slice(2).join('---');
            
            // Remove leading tabs/spaces from all lines in the body
            body = body.split('\n').map(line => line.replace(/^[ \t]+/, '')).join('\n');
            
            fs.writeFileSync(path.join(dir, file), `---${frontmatter}---${body}`);
            console.log(`Unindented body in ${file}`);
        }
    });
});
