import fs from 'fs';
import path from 'path';

const toursDir = '../tours';
const outDir = './src/content/tours';

const tours = [
    { title: "Machu Picchu", description: "Visita la Ciudadela Inca, una de las maravillas del mundo.", image: "/imagenes/machu-picchu.jpg", slug: "machu-picchu" },
    { title: "Montaña 7 Colores", description: "Un paisaje surrealista en la cordillera de los Andes.", image: "/imagenes/7-colores.jpg", slug: "montana-7-colores" },
    { title: "Laguna Humantay", description: "Aguas turquesas al pie del nevado Salkantay.", image: "/imagenes/huamantay.jpg", slug: "humantay" },
    { title: "City Tour Cusco", description: "Templos y fortalezas de la capital imperial.", image: "/imagenes/tours/city-tour.jpg", slug: "city-tour-cusco" },
    { title: "Valle Sur", description: "Tipón, Pikillaqta y Andahuaylillas.", image: "/imagenes/tours/valle-sur.jpg", slug: "valle-sur" },
    { title: "7 Lagunas Ausangate", description: "Espectacular trekking al pie del Ausangate.", image: "/imagenes/tours/7-lagunas.png", slug: "7-lagunas-ausangate" },
    { title: "Wanakawri", description: "Descubre el origen del Imperio Inca.", image: "/imagenes/tours/wanakawri.jpg", slug: "wanakawri" },
    { title: "Ñaupa Iglesia", description: "Portal dimensional y Catarata Perolniyoq.", image: "/imagenes/tours/naupa-iglesia.jfif", slug: "naupa-iglesia" },
    { title: "Valle Sagrado", description: "Pisac, Ollantaytambo y Chinchero en un día.", image: "/imagenes/tours/pisac_afiche.jpg", slug: "valle-sagrado" },
    { title: "Maras y Moray", description: "Laboratorio agrícola y pozas de sal milenarias.", image: "/imagenes/tours/moray_afiche.jpg", slug: "maras-moray" },
    { title: "Chinchero", description: "Tradición textil y arqueología viva.", image: "/imagenes/tours/chinchero_afiche.jpg", slug: "chinchero" },
    { title: "Pisac", description: "Mercado artesanal y sitio arqueológico.", image: "/imagenes/pisac.jpg", slug: "pisac" },
    { title: "Ollantaytambo", description: "El pueblo inca viviente y su gran fortaleza.", image: "/imagenes/ollantaytambo.jpg", slug: "ollantaytambo" },
    { title: "Moray y Salineras", description: "Laboratorio agrícola y pozas de sal.", image: "/imagenes/moray.jpg", slug: "moray" }
];

if (!fs.existsSync(outDir)) {
    fs.mkdirSync(outDir, { recursive: true });
}

tours.forEach(tour => {
    let html = '';
    try {
        html = fs.readFileSync(path.join(toursDir, `${tour.slug}.htm`), 'utf-8');
    } catch(e) {
        console.log(`No se encontró ${tour.slug}.htm`);
        return;
    }
    
    // Extract tour-detail-content
    let bodyMatch = html.match(/<div class="tour-detail-content">([\s\S]*?)<!-- Sidebar -->/);
    let body = bodyMatch ? bodyMatch[1].trim() : '';

    // Remove wrapping div closure if exists
    body = body.replace(/<\/div>[\s]*$/, '').trim();

    // extract details
    let durationMatch = html.match(/⏱️ Duración:<\/strong> <span>(.*?)<\/span>/);
    let altitudeMatch = html.match(/⛰️ Altitud Máx:<\/strong> <span>(.*?)<\/span>/);
    let levelMatch = html.match(/👟 Nivel:<\/strong> <span>(.*?)<\/span>/);

    let md = `---
title: "${tour.title}"
short_description: "${tour.description}"
main_image: "${tour.image}"
duration: "${durationMatch ? durationMatch[1] : 'Full Day'}"
altitude: "${altitudeMatch ? altitudeMatch[1] : 'Variada'}"
level: "${levelMatch ? levelMatch[1] : 'Moderado'}"
price: "Consultar"
---

${body}
`;
    fs.writeFileSync(path.join(outDir, `${tour.slug}.md`), md);
    console.log(`Migrado: ${tour.slug}.md`);
});

// Also migrate pages
const pagesDir = './src/content/pages';
if (!fs.existsSync(pagesDir)) {
    fs.mkdirSync(pagesDir, { recursive: true });
}

const pages = [
    { title: "Términos y Condiciones", slug: "terminos-condiciones" },
    { title: "Protección de Datos", slug: "politica-proteccion-datos" },
    { title: "Misión y Visión", slug: "afiche-digital" }
];

pages.forEach(page => {
    let html = '';
    try {
        html = fs.readFileSync(path.join(toursDir, `${page.slug}.htm`), 'utf-8');
    } catch(e) {
        return;
    }
    
    // For simple pages, the content is in section section-bg -> wrapper
    let bodyMatch = html.match(/<div class="wrapper">([\s\S]*?)<\/div>\s*<\/section>/);
    let body = bodyMatch ? bodyMatch[1].trim() : '';
    // if body has section-title, remove it
    body = body.replace(/<h2 class="section-title">.*?<\/h2>/, '');

    let md = `---
title: "${page.title}"
---

${body}
`;
    let outSlug = page.slug === 'afiche-digital' ? 'mision-vision' : page.slug;
    fs.writeFileSync(path.join(pagesDir, `${outSlug}.md`), md);
    console.log(`Migrado página: ${outSlug}.md`);
});

console.log('Migración completada.');
