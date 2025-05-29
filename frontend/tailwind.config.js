/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{vue,js,ts,jsx,tsx}'],
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
  plugins: [],
};