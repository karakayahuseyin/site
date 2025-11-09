import { svelte } from '@sveltejs/vite-plugin-svelte';

/** @type {import('vite').UserConfig} */
export default {
  plugins: [svelte()],
  server: {
    host: true,
    port: 5173
  },
};
