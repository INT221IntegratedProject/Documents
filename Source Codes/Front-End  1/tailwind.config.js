const colors = require('tailwindcss/colors')

module.exports = {
  purge: { content: ['./public/**/*.html', './src/**/*.vue'] },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        caseCol: {
          blue: '#3d84b8',
          green: '#5aa897',
          pink: '#ff9292',
          purple: '#c67ace',
          red: '#91091e',
          yellow: '#f9f871',
        }
      },
      zIndex: {
        '-99': '-99'
      },
      maxHeight: {
        '4.5/6': '80%'
      },
      backgroundImage: {
        'background-banner': "url('https://www.chloeting.com/about/background-banner.jpg')"}
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
