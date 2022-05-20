// dark mode functions
const isDark = () => {
    const theme = localStorage.getItem('theme');
    return theme === 'dark';
};

const saveTheme = (theme) => {
  localStorage.setItem('theme', theme);
  setTheme();
};

const setTheme = () => {
  if (isDark()) {
    document.documentElement.classList.add('dark');
    document.getElementById('sun').style.display = 'block';
    document.getElementById('moon').style.display = 'none';
  } else {
    document.documentElement.classList.remove('dark');
    document.getElementById('sun').style.display = 'none';
    document.getElementById('moon').style.display = 'block';
  }
};

// set theme on load
setTheme();

const toggleButton = document.getElementsByClassName('theme-toggle')[0];
toggleButton.addEventListener('click', () => {
  saveTheme(isDark() ? 'light' : 'dark');
});

// handle nav
const burgers = document.getElementsByClassName('burgers')[0];
const nav = document.getElementsByClassName('mobile-nav')[0];
burgers.addEventListener('click', () => {
  burgers.classList.toggle("closed");
  nav.classList.toggle("hidden");
  nav.classList.toggle("flex");
});