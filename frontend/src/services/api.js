import axios from 'axios';

const api = axios.create({
  baseURL: import.meta.env.VITE_APIBACKEND,
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
});

api.interceptors.request.use(
  (config) => {
    const auth = JSON.parse(localStorage.getItem('auth'));
    if (auth && auth.token) {
      config.headers.Authorization = `Bearer ${auth.token}`;
      console.log('Request with token:', auth.token.substring(0, 20) + '...', config.url);
    } else {
      console.log('No token for request:', config.url);
    }
    return config;
  },
  (error) => Promise.reject(error)
);

api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (!error.response) {
      console.error('Network error:', error.message);
    } else {
      console.error(`Error ${error.response.status} on ${error.config.url}:`, error.response.data);
    }
    if (error.response?.status === 401 && window.location.pathname !== '/login') {
      localStorage.removeItem('auth');
      localStorage.removeItem('user');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

export const getListings = async (page = 1) => {
  const response = await api.get(`/listings?page=${page}`);
  console.log('getListings response:', JSON.stringify(response.data, null, 2));
  return response;
};

export const filterListings = async (params) => {
  const response = await api.get('/listings/filter', { params });
  console.log('filterListings response:', JSON.stringify(response.data, null, 2));
  return response;
};

export const login = async (data) => {
  const response = await api.post('/login', data);
  const { user } = response.data;
  localStorage.setItem('auth', JSON.stringify({ token: user.token }));
  localStorage.setItem('user', JSON.stringify({
    id: user.id,
    name: user.name,
    email: user.email,
    created_at: user.created_at,
    updated_at: user.updated_at,
  }));
  return response;
};

export const register = async (data) => {
  const response = await api.post('/register', data);
  const { user } = response.data;
  localStorage.setItem('auth', JSON.stringify({ token: user.token }));
  localStorage.setItem('user', JSON.stringify({
    id: user.id,
    name: user.name,
    email: user.email,
    created_at: user.created_at,
    updated_at: user.updated_at,
  }));
  return response;
};

export const logout = async () => {
  await api.post('/logout');
  localStorage.removeItem('auth');
  localStorage.removeItem('user');
};

export const getMe = () => api.get('/user');

export default api;