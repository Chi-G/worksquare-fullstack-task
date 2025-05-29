import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import './assets/main.css';
import '@iconscout/unicons/css/line.css';
import feather from 'feather-icons';

// Initialize Feather Icons
document.addEventListener('DOMContentLoaded', () => {
  feather.replace();
});

const app = createApp(App);
app.use(router);
app.mount('#app');