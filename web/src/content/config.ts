import { defineCollection, z } from 'astro:content';

const distros = defineCollection({
  type: 'content',
  schema: ({ image }) =>
    z.object({
      name: z.string(),
      suffix: z.string().optional(),
      color: z.string().regex(/^#[0-9a-f]{6}$/),
      tag: z.enum(['base', 'derivative', 'design']),
      family: z.enum([
        'Arch',
        'Debian',
        'Fedora',
        'RHEL',
        'Gentoo',
        'SUSE',
        'Slackware',
        'Independent',
        'BSD',
        'Windows',
        'macOS',
        'Special',
      ]),
      icon: z.string(),
      image: image(),
      imageAlt: z.string(),
      packageManager: z.string().optional(),
      license: z.string().optional(),
      releaseDate: z.date(),
      website: z.string().url(),
    }),
});

export const collections = { distros };
