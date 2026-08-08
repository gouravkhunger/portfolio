import { AnimatePresence, motion, useReducedMotion } from "motion/react";
import {
  useEffect,
  useRef,
  useState,
  type FocusEvent,
  type PointerEvent,
} from "react";
import type { WorkCircleItem } from "../../lib/work";

type Props = {
  items: WorkCircleItem[];
};

const spring = { type: "spring" as const, stiffness: 420, damping: 22 };

export default function WorkCircles({ items }: Props) {
  const reduce = useReducedMotion();
  const rootRef = useRef<HTMLDivElement>(null);
  const stackRef = useRef<HTMLDivElement>(null);
  const cardRef = useRef<HTMLDivElement>(null);
  const [entered, setEntered] = useState(false);
  const [activeSlug, setActiveSlug] = useState<string | null>(null);
  const [cardX, setCardX] = useState(0);

  useEffect(() => {
    if (reduce) {
      setEntered(true);
      return;
    }
    const id = requestAnimationFrame(() => setEntered(true));
    return () => cancelAnimationFrame(id);
  }, [reduce]);

  function isHoverTarget(node: EventTarget | null) {
    if (!(node instanceof Node)) return false;
    return (
      !!stackRef.current?.contains(node) || !!cardRef.current?.contains(node)
    );
  }

  function dismissIfOutside(target: EventTarget | null) {
    if (!isHoverTarget(target)) setActiveSlug(null);
  }

  function activate(slug: string, el: HTMLElement) {
    const root = rootRef.current;
    if (!root) return;
    const rr = root.getBoundingClientRect();
    const er = el.getBoundingClientRect();
    setCardX(er.left + er.width / 2 - rr.left);
    setActiveSlug(slug);
  }

  const active = items.find((item) => item.slug === activeSlug);

  return (
    <div ref={rootRef} className="work-circles">
      <div
        ref={stackRef}
        className="work-circles__stack"
        onPointerLeave={(e) => dismissIfOutside(e.relatedTarget)}
        onBlur={(e) => dismissIfOutside(e.relatedTarget)}
      >
        {items.map((item, index) => (
          <Avatar
            key={item.slug}
            item={item}
            index={index}
            count={items.length}
            entered={entered}
            reduce={!!reduce}
            onActivate={activate}
          />
        ))}
      </div>

      <AnimatePresence>
        {active && (
          <motion.div
            key="work-card"
            ref={cardRef}
            className="work-circles__card-wrap"
            role="tooltip"
            style={{ left: cardX }}
            initial={reduce ? false : { opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={reduce ? undefined : { opacity: 0 }}
            transition={{ duration: 0.16 }}
            onPointerLeave={(e) => dismissIfOutside(e.relatedTarget)}
            onBlur={(e) => dismissIfOutside(e.relatedTarget)}
          >
            <div className="work-circles__card">
              <p className="work-circles__card-title">{active.company}</p>
              {active.roleLine && (
                <p className="work-circles__card-role">{active.roleLine}</p>
              )}
              <p className="work-circles__card-meta">{active.dateLine}</p>
              <p className="work-circles__card-summary">{active.summary}</p>
              {active.href && (
                <p className="work-circles__card-cta">
                  <a href={active.href} className="link-quiet icon-link">
                    View
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 16 16"
                      fill="none"
                      aria-hidden="true"
                    >
                      <path
                        stroke="currentColor"
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        strokeWidth="1.5"
                        d="M6.15 4.15 10.65 8l-4.5 3.85"
                      />
                    </svg>
                  </a>
                </p>
              )}
            </div>
            <span className="work-circles__arrow" aria-hidden="true" />
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}

type AvatarProps = {
  item: WorkCircleItem;
  index: number;
  count: number;
  entered: boolean;
  reduce: boolean;
  onActivate: (slug: string, el: HTMLElement) => void;
};

function Avatar({
  item,
  index,
  count,
  entered,
  reduce,
  onActivate,
}: AvatarProps) {
  function onPointerEnter(e: PointerEvent<HTMLElement>) {
    onActivate(item.slug, e.currentTarget);
  }

  function onFocus(e: FocusEvent<HTMLElement>) {
    onActivate(item.slug, e.currentTarget);
  }

  const motionProps = {
    className: "work-circles__avatar",
    initial: reduce ? false : { opacity: 0, scale: 0.85, x: -6 },
    animate: {
      opacity: entered ? 1 : 0,
      scale: entered ? 1 : 0.85,
      x: entered ? 0 : -6,
      zIndex: count - index,
    },
    transition: {
      ...spring,
      delay: entered || reduce ? 0 : index * 0.06,
    },
    whileHover: reduce ? undefined : { scale: 1.12, zIndex: 50 },
    whileTap: reduce ? undefined : { scale: 0.96 },
    onPointerEnter,
    onFocus,
    "aria-label": item.company,
  };

  const logo = (
    <span className="work-circles__logo">
      <img src={item.logo} alt="" width={24} height={24} />
    </span>
  );

  if (item.href) {
    return (
      <motion.a href={item.href} {...motionProps}>
        {logo}
      </motion.a>
    );
  }

  return (
    <motion.button type="button" {...motionProps}>
      {logo}
    </motion.button>
  );
}
