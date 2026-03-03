import { defineConfig, envField, sharpImageService } from 'astro/config';

import svelte from '@astrojs/svelte';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  site: import.meta.env.SITE,
  env: {
    schema: {
      SITE: envField.string({ context: 'server', access: 'public', optional: true }),
    },
  },
  integrations: [svelte()],
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
