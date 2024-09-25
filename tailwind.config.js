/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
      './app/**/**/*.css',
      './app/**/*.html.erb',
      './app/helpers/**/*.rb',
      './app/javascript/**/*.js',
      './app/views/**/*.html.erb',
    ],
    theme: {
      extend: {
        screens: {
          lg: '1400px',
          rg: '1000px',
        },
        width: {
          'dscreen': '100vdw',
        },
        height: {
          'dscreen': '100vdh',
        },
      },
    },
    plugins: [],
  };
  