const config = {
  development: {
    apiUrl: 'http://localhost:8000/api'
  },
  production: {
    apiUrl: '/api'
  }
};

export default config[process.env.NODE_ENV || 'development'];  