<template>
    <form @submit.prevent="search">
      <input v-model="filters.location" placeholder="Location" />
      <input v-model="filters.type" placeholder="Type" />
      <button type="submit">Search</button>
    </form>
  </template>
  
  <script>
  import { filterListings } from '@/services/api';
  
  export default {
    data() {
      return {
        filters: { location: '', type: '' },
      };
    },
    methods: {
      async search() {
        const response = await filterListings(this.filters);
        this.$emit('update-listings', response.data.data);
      },
    },
  };
  </script>