import { defineConfig } from "tinacms";

export default defineConfig({
  branch: process.env.GITHUB_BRANCH || "main",
  clientId: process.env.NEXT_PUBLIC_TINA_CLIENT_ID!,
  token: process.env.TINA_TOKEN!,
  build: {
    outputFolder: "admin",
    publicFolder: "public",
  },
  media: {
    tina: {
      mediaRoot: "imagenes",
      publicFolder: "public",
    },
  },
  schema: {
    collections: [
      {
        name: "tours",
        label: "Tours",
        path: "src/content/tours",
        format: "md",
        fields: [
          {
            type: "string",
            name: "title",
            label: "Título",
            isTitle: true,
            required: true,
          },
          {
            type: "string",
            name: "short_description",
            label: "Descripción Corta",
            required: true,
          },
          {
            type: "image",
            name: "main_image",
            label: "Imagen Principal",
            required: true,
          },
          {
            type: "string",
            name: "duration",
            label: "Duración",
            required: true,
          },
          {
            type: "string",
            name: "altitude",
            label: "Altitud Máxima",
            required: true,
          },
          {
            type: "string",
            name: "level",
            label: "Nivel de Dificultad",
            required: true,
          },
          {
            type: "string",
            name: "price",
            label: "Precio Promedio",
            required: true,
          },
          {
            type: "object",
            name: "itinerary",
            label: "Itinerario",
            list: true,
            required: false,
            ui: {
              itemProps: (item) => {
                return { label: item?.title || "Nuevo Día" };
              },
            },
            fields: [
              {
                type: "string",
                name: "day",
                label: "Día (Ej: Día 1)",
              },
              {
                type: "string",
                name: "title",
                label: "Título del Día",
              },
              {
                type: "rich-text",
                name: "description",
                label: "Descripción",
              },
            ]
          },
          {
            type: "rich-text",
            name: "body",
            label: "Contenido General / Incluye / No incluye",
            isBody: true,
          },
        ],
      },
      {
        name: "pages",
        label: "Páginas (Inicio, Nosotros)",
        path: "src/content/pages",
        format: "md",
        fields: [
          {
            type: "string",
            name: "title",
            label: "Título",
            isTitle: true,
            required: true,
          },
          {
            type: "rich-text",
            name: "body",
            label: "Contenido Principal",
            isBody: true,
          },
        ],
      },
    ],
  },
});
