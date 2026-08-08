import { getCollection } from "astro:content";

export async function listPosts(opts?: { limit?: number }) {
  const posts = (await getCollection("posts", ({ data }) => !data.draft))
    .sort((a, b) => b.data.date.getTime() - a.data.date.getTime())
    .map((p) => ({
      title: p.data.title,
      date: p.data.date,
      href: `/posts/${p.id}`,
    }));

  return opts?.limit ? posts.slice(0, opts.limit) : posts;
}
