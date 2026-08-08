// @ts-check
import { defineConfig } from "astro/config";
import sitemap from "@astrojs/sitemap";
import tailwindcss from "@tailwindcss/vite";
import { addCopyButton } from "shiki-transformer-copy-button";

import react from "@astrojs/react";

export default defineConfig({
  site: "https://gourav.sh",
  integrations: [sitemap(), react()],
  vite: {
    plugins: [tailwindcss()],
  },
  markdown: {
    shikiConfig: {
      theme: "github-dark",
      transformers: [
        addCopyButton({
          toggle: 2000,
          button: {
            class: "copy",
            title: "Copy code",
            "aria-label": "Copy code",
          },
        }),
      ],
    },
  },
});
