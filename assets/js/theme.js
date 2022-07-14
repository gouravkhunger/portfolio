const THEME = "theme";
const DARK = "dark";
const LIGHT = "light";

// dark mode functions
const isSomeThemeSaved = () => {
  const theme = localStorage.getItem(THEME);
  return theme !== null && theme !== undefined;
};

const isDark = () => {
  return (
    localStorage.getItem(THEME) === DARK ||
    (!isSomeThemeSaved() &&
      window.matchMedia &&
      window.matchMedia("(prefers-color-scheme: dark)").matches)
  );
};

const saveTheme = (theme) => {
  localStorage.setItem(THEME, theme);
  setTheme();
};

const setTheme = () => {
  if (isDark()) {
    document.documentElement.classList.add(DARK);
    document.getElementById("sun").style.display = "block";
    document.getElementById("moon").style.display = "none";
  } else {
    document.documentElement.classList.remove(DARK);
    document.getElementById("sun").style.display = "none";
    document.getElementById("moon").style.display = "block";
  }
};

document.addEventListener("keydown", function (e) {
  if ((e.ctrlKey || e.metaKey) && e.shiftKey && e.keyCode === 76) {
    saveTheme(isDark() ? LIGHT : DARK);
  }
});
