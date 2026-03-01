import svelte from '@astrojs/svelte';
import tailwindcss from '@tailwindcss/vite';
import { defineConfig, sharpImageService } from 'astro/config';

export default defineConfig({
  integrations: [svelte()],
  image: {
    service: sharpImageService(),
    experimentalLayout: 'responsive',
  },
  vite: {
    plugins: [tailwindcss()],
  },
});
