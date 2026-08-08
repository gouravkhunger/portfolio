export type Project = {
  name: string;
  summary: string;
  href: string;
};

export const selectedProjects: Project[] = [
  {
    name: "JekyllEx",
    summary:
      "Android IDE for managing Jekyll sites on-device, including a native Ruby toolchain.",
    href: "https://jekyllex.xyz",
  },
  {
    name: "dependents.info",
    summary:
      "Generate an image of a GitHub repo's network dependents to showcase in a README.",
    href: "https://dependents.info",
  },
  {
    name: "jekyll-auto-authors",
    summary:
      "Jekyll plugin for true multi-author pagination — a problem the ecosystem left open for years.",
    href: "https://github.com/gouravkhunger/jekyll-auto-authors",
  },
];
