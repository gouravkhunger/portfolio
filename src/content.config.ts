import { defineCollection } from "astro:content";
import { glob } from "astro/loaders";
import { z } from "astro/zod";

const posts = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./src/content/posts" }),
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    description: z.string().optional(),
    image: z.string().optional(),
    imageAlt: z.string().optional(),
    canonical: z.string().url().optional(),
    notice: z.string().optional(),
    category: z.string().optional(),
    tags: z.array(z.string()).optional(),
    series: z.string().optional(),
    draft: z.boolean().optional(),
  }),
});

const work = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./src/content/work" }),
  schema: z.object({
    company: z.string(),
    url: z.string().url().optional(),
    logo: z.string().optional(),
    summary: z.string(),
    roles: z.array(
      z.object({
        title: z.string(),
        from: z.coerce.date(),
        to: z.coerce.date().optional(),
        meta: z.string().optional(),
      }),
    ),
  }),
});

export const collections = { posts, work };
