const THEME = 'theme';
const DARK = 'dark';
const LIGHT = 'light';

// dark mode functions
const isSomethingSaved = () => {
  return localStorage.getItem(THEME) !== null && localStorage.getItem(THEME) !== undefined;
}

const isDark = () => {
    const theme = localStorage.getItem(THEME);
    return theme === DARK;
};

const saveTheme = (theme) => {
  localStorage.setItem(THEME, theme);
  setTheme();
};

const setTheme = () => {
  if (isDark()) {
    document.documentElement.classList.add(DARK);
    document.getElementById('sun').style.display = 'block';
    document.getElementById('moon').style.display = 'none';
  } else {
    document.documentElement.classList.remove(DARK);
    document.getElementById('sun').style.display = 'none';
    document.getElementById('moon').style.display = 'block';
  }
};

// set default value based on OS level theme
if (!isSomethingSaved()) {
  saveTheme(
    (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) ? DARK : LIGHT
  );
}