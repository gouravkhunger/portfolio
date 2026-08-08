import { getCollection, type CollectionEntry } from "astro:content";
import { formatDateRange } from "./dates";

export type WorkRole = {
  title: string;
  from: Date;
  to?: Date | null;
  meta?: string;
};

export type WorkItem = {
  slug: string;
  company: string;
  url?: string;
  logo?: string;
  summary: string;
  roles: WorkRole[];
  href?: string;
};

export type WorkCircleItem = {
  slug: string;
  company: string;
  logo: string;
  summary: string;
  roleLine: string;
  dateLine: string;
  href?: string;
};

const fallbackLogo = "/assets/images/logos/building.svg";

function hasWriteup(entry: CollectionEntry<"work">) {
  return Boolean(entry.body?.trim());
}

function recency(item: WorkItem) {
  if (item.roles.some((role) => !role.to)) return Number.POSITIVE_INFINITY;
  return Math.max(...item.roles.map((role) => role.to!.getTime()));
}

function toItem(entry: CollectionEntry<"work">): WorkItem {
  return {
    slug: entry.id,
    company: entry.data.company,
    url: entry.data.url,
    logo: entry.data.logo,
    summary: entry.data.summary,
    roles: entry.data.roles,
    href: hasWriteup(entry) ? `/work/${entry.id}` : undefined,
  };
}

export async function listWork(): Promise<WorkItem[]> {
  const entries = await getCollection("work");
  return entries.map(toItem).sort((a, b) => recency(b) - recency(a));
}

export async function getWorkWriteups() {
  const entries = await getCollection("work");
  return entries.filter(hasWriteup);
}

export function toWorkCircleItem(item: WorkItem): WorkCircleItem {
  const latest = item.roles[0];
  const oldest = item.roles[item.roles.length - 1];
  const from = oldest?.from ?? latest?.from ?? new Date();

  return {
    slug: item.slug,
    company: item.company,
    logo: item.logo ?? fallbackLogo,
    summary: item.summary,
    roleLine: latest
      ? `${latest.title}${latest.meta ? ` · ${latest.meta}` : ""}`
      : "",
    dateLine: formatDateRange(from, latest?.to),
    href: item.href,
  };
}
