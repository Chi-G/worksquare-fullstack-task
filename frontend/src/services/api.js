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

// Add response interceptor for unauthorized errors
api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response && error.response.status === 401) {
      localStorage.removeItem('token');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

export const getListings = (page = 1) => api.get(`/listings?page=${page}`);
export const getListing = (id) => api.get(`/listings/${id}`);
export const filterListings = (params) => api.get('/listings/filter', { params });
export const login = (data) => api.post('/login', data);
export const register = (data) => api.post('/register', data);

export default api;