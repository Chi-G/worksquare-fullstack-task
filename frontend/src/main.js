import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import './assets/main.css';
import '@iconscout/unicons/css/line.css';
import feather from 'feather-icons';

// Initialize Tailwind config
window.tailwind.config = {
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        green: {
          600: '#0ab39c',
          700: '#099885',
        },
      },
    },
  },
};

// Initialize Feather Icons
document.addEventListener('DOMContentLoaded', () => {
  feather.replace();
});

const app = createApp(App);
app.use(router);
app.mount('#app');