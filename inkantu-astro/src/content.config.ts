import { z, defineCollection } from 'astro:content';
import { glob } from 'astro/loaders';

const toursCollection = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/tours' }),
  schema: z.object({
    title: z.string(),
    short_description: z.string(),
    main_image: z.string(),
    duration: z.string().optional(),
    altitude: z.string().optional(),
    level: z.string().optional(),
    price: z.string().optional(),
  }),
});

const pagesCollection = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/pages' }),
  schema: z.object({
    title: z.string(),
  }),
});

export const collections = {
  'tours': toursCollection,
  'pages': pagesCollection,
};
