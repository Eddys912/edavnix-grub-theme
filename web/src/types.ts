import type { CollectionEntry } from 'astro:content';

export type ThemeData = CollectionEntry<'distros'>['data'];

export type Canvas = Pick<ThemeData, 'name' | 'suffix' | 'color' | 'icon'>;

export type ThemeInfo = Pick<ThemeData, 'name' | 'suffix' | 'color' | 'tag' | 'image' | 'imageAlt'>;

export type ThemeCard = ThemeInfo;

export type ThemeModal = ThemeInfo & Pick<ThemeData, 'family'> & { slug: string };

export type ThemeDetail = Omit<ThemeData, 'icon'> & { slug: string };
