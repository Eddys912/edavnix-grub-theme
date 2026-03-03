import { defineConfig, envField, sharpImageService } from 'astro/config';

import svelte from '@astrojs/svelte';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  integrations: [svelte()],
  site: import.meta.env.SITE,
  env: {
    schema: {
      SITE: envField.string({
        context: 'server',
        access: 'public',
      }),
      SITE_TITLE: envField.string({
        context: 'server',
        access: 'public',
        default: 'Edavnix - Custom themes for GRUB inspired by Linux distributions',
      }),
      SITE_DESC: envField.string({
        context: 'server',
        access: 'public',
        default:
          'Customize your PC startup with the best themes for GRUB and Ventoy. Download exclusive skins inspired by your favorite Linux distributions and give your startup menu a professional and aesthetic look.',
      }),
      SITE_KEYWORDS: envField.string({
        context: 'server',
        access: 'public',
        default: 'edavnix, linux, themes, grub, ventoy',
      }),
      SITE_OG_IMAGE: envField.string({
        context: 'server',
        access: 'public',
        default: '/og.png',
      }),
      SITE_AUTHOR: envField.string({
        context: 'server',
        access: 'public',
        default: 'edavnix',
      }),
      SITE_THEME_COLOR: envField.string({
        context: 'server',
        access: 'public',
        default: '#0f0f0f',
      }),
      SITE_NAME: envField.string({
        context: 'server',
        access: 'public',
        default: 'Edavnix',
      }),
      SITE_LOCALE: envField.string({
        context: 'server',
        access: 'public',
        default: 'en_US',
      }),
    },
  },
  image: {
    service: sharpImageService(),
    experimentalLayout: 'responsive',
  },
  vite: {
    plugins: [tailwindcss()],
  },
  server: {
    allowedHosts: true,
  },
});
