import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:8000/api', // Laravel API
});

export const getListings = (page = 1) => api.get(`/listings?page=${page}`);
export const getListing = (id) => api.get(`/listings/${id}`);
export const filterListings = (params) => api.get('/listings/filter', { params });