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
      console.log('Sending request with token:', auth.token.substring(0, 20) + '...');
    } else {
      console.log('No token found in localStorage');
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
    } else if (error.response.status === 401) {
      console.error('401 Unauthorized:', error.response.data);
      localStorage.removeItem('auth');
      localStorage.removeItem('user');
      if (window.location.pathname !== '/login') {
        window.location.href = '/login';
      }
    }
    return Promise.reject(error);
  }
);

export const getListings = (page = 1) => api.get(`/listings?page=${page}`);
export const getListing = (id) => api.get(`/listings/${id}`);
export const filterListings = (params) => api.get('/listings/filter', { params });
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