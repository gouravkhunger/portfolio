const months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
] as const;

export function formatDate(
  input: string | Date,
  style: "full" | "short" | "monthYear" = "full",
): string {
  const d = typeof input === "string" ? new Date(input) : input;
  if (Number.isNaN(d.getTime())) return String(input);

  const month = months[d.getUTCMonth()];
  const day = d.getUTCDate().toString().padStart(2, "0");
  const year = d.getUTCFullYear();

  if (style === "monthYear") return `${month} ${year}`;
  if (style === "short") return `${month} ${day}`;
  return `${month} ${day}, ${year}`;
}

export function formatDateRange(
  from: string | Date,
  to?: string | Date | null,
): string {
  const start = formatDate(from, "monthYear");
  const end = to ? formatDate(to, "monthYear") : "Present";
  return `${start} – ${end}`;
}

export function slugify(text: string): string {
  return text
    .toLowerCase()
    .trim()
    .replace(/[^\w\s-]/g, "")
    .replace(/[\s_]+/g, "-")
    .replace(/-+/g, "-")
    .replace(/^-|-$/g, "");
}
