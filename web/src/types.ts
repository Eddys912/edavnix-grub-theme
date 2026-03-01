import type { GetImageResult } from 'astro';
import type { CollectionEntry } from 'astro:content';

export type ThemeData = CollectionEntry<'distros'>['data'];

export type ThemeBg = Pick<ThemeData, 'name' | 'suffix' | 'color' | 'icon'>;

export type ThemeModal = Pick<
  ThemeData,
  'name' | 'suffix' | 'color' | 'tag' | 'family' | 'image' | 'imageAlt'
> & { slug: string };

export type ThemeCard = Pick<ThemeData, 'name' | 'suffix' | 'color' | 'tag' | 'image' | 'imageAlt'>;

export type ThemeDetail = Omit<ThemeData, 'image'> & { image: GetImageResult };

export interface CatalogItem {
  slug: string;
  name: string;
  suffix?: string;
  color: string;
  tag: ThemeData['tag'];
  family: ThemeData['family'];
  imageSrc: string;
  imageAlt: string;
}
