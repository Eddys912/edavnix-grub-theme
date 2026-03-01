import type { CollectionEntry } from 'astro:content';

export type ThemeData = CollectionEntry<'distros'>['data'];
export type ThemeSlug = CollectionEntry<'distros'>['slug'];

export type AllData = ThemeData & { slug?: ThemeSlug };

export type Paint = Pick<AllData, 'slug' | 'name' | 'suffix' | 'color' | 'icon'>;

export type Card = Pick<
  AllData,
  'slug' | 'name' | 'suffix' | 'color' | 'tag' | 'family' | 'image' | 'imageAlt'
>;

export type Detail = Omit<AllData, 'icon'>;
