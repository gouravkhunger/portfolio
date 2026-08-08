export const site = {
  title: "Gourav Khunger",
  email: "hi@gourav.sh",
  description:
    "Software engineer. Builds products and open-source tools; writes short notes.",
  url: "https://gourav.sh",
  googleAnalytics: "G-GSRER1MM23",
  twitter: "@gourav_khunger",
  role: "Software engineer",
  bio: "I build software for people and teams. With over half a decade of experience, I've built open-source tools, products for AI audio publishing and the public sector.",
  contact: "Want to work together or just say hi? Reach out.",
  links: [
    { label: "GitHub", href: "https://github.com/gouravkhunger" },
    { label: "X", href: "https://x.com/gourav_khunger" },
    { label: "LinkedIn", href: "https://www.linkedin.com/in/gouravkhunger" },
    { label: "Email", href: "mailto:hi@gourav.sh" },
  ],
} as const;

export const extlinksConfig = {
  attributes: {
    rel: "nofollow noopener noreferrer",
    target: "_blank",
  },
  relInclude: ["l.gourav.sh"],
  relExclude: ["gourav.sh", "github.com", "genicsblog.com", "jekyllex.xyz"],
} as const;
