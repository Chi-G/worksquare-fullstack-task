import axios from 'axios';
import config from '../config/app';

const api = axios.create({
  baseURL: config.apiUrl,
});

// Add Axios interceptor to include JWT token in requests
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => Promise.reject(error)
);

// Add response interceptor for unauthorized errors and network issues
api.interceptors.response.use(
  (response) => {
    const token = response.data?.token;
    if (token) {
      localStorage.setItem('token', token);
    }
    return response;
  },
  (error) => {
    if (!error.response) {
      console.error('Network error:', error.message);
    } else if (error.response.status === 401) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

export const getListings = (page = 1) => api.get(`/listings?page=${page}`);
export const getListing = (id) => api.get(`/listings/${id}`);
export const filterListings = (params) => api.get('/listings/filter', { params });
export const login = (data) => api.post('/login', data);
export const logout = () => api.post('/logout');

export default api;