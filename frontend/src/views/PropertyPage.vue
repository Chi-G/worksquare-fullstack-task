<template>
  <div class="bg-white text-gray-900">
    <NavBar />

    <!-- Search Section -->
    <section class="py-10">
      <div class="container mx-auto">
        <h2 class="text-2xl font-bold text-center mb-6">List View Layout</h2>
        <div class="bg-white p-4 rounded shadow-md">
          <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <input v-model="title" type="text" placeholder="Search by title (e.g., 4 Bedroom)" class="p-2 border rounded" />
            <input v-model="location" type="text" placeholder="Search by location (e.g., Lekki, Abuja)" class="p-2 border rounded" />
            <select v-model="status" class="p-2 border rounded">
              <option value="">All Statuses</option>
              <option value="For Rent">For Rent</option>
              <option value="For Lease">For Lease</option>
              <option value="Shortlet">Shortlet</option>
            </select>
            <select v-model="type" class="p-2 border rounded">
              <option value="">All Categories</option>
              <option value="House">House</option>
              <option value="Flat">Flat</option>
              <option value="Duplex">Duplex</option>
              <option value="Penthouse">Penthouse</option>
              <option value="Terrace">Terrace</option>
              <option value="Apartment">Apartment</option>
              <option value="Mansion">Mansion</option>
              <option value="Shortlet">Shortlet</option>
            </select>
            <input v-model.number="minPrice" type="number" placeholder="Min Price (₦)" class="p-2 border rounded" />
            <input v-model.number="maxPrice" type="number" placeholder="Max Price (₦)" class="p-2 border rounded" />
            <select v-model.number="bedrooms" class="p-2 border rounded">
              <option value="">All Bedrooms</option>
              <option v-for="n in 6" :key="n" :value="n">{{ n }} Bedrooms</option>
            </select>
          </div>
          <button @click="fetchListings" class="bg-green-600 text-white px-4 py-2 rounded mt-4 w-full md:w-auto hover:bg-green-700">
            Search
          </button>
        </div>
      </div>
    </section>

    <!-- Listings Section -->
    <section class="py-4">
      <div class="container mx-auto">
        <div v-if="loading" class="text-center text-green-600 font-semibold">Loading listings...</div>
        <div v-else-if="listings.length === 0" class="text-center text-red-500 font-semibold">No listings found.</div>
        <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div v-for="item in listings" :key="item.id" class="border rounded-lg p-4 shadow-md">
            <img :src="listingImage(item)" alt="Property" class="w-full h-48 object-cover rounded" />
            <div class="mt-2">
            <h3 class="text-lg font-semibold">{{ item.title }}</h3>
            <p class="text-gray-600">{{ item.location }}</p>
            <p class="text-green-600">🔲 {{ item.bedrooms }} Beds 🛁 {{ item.bathrooms }} Baths</p>
            <p class="text-green-600">₦{{ formatPrice(item.price) }}</p>
            <div class="flex flex-wrap gap-1 mt-2">
              <span
                v-for="tag in item.status"
                :key="tag"
                class="bg-yellow-100 text-yellow-800 text-xs font-semibold px-2 py-1 rounded"
              >
                {{ tag }}
              </span>
            </div>
            </div>
          </div>
        </div>

        <!-- Pagination Controls -->
        <div v-if="totalPages > 1" class="flex justify-center mt-4 space-x-2">
          <button
            v-for="page in totalPages"
            :key="page"
            @click="() => changePage(page)" 
            :class="['px-3 py-2 rounded', currentPage === page ? 'bg-green-600 text-white' : 'bg-gray-200']"
          >
            {{ page }}</button>
        </div>
      </div>
    </section>

    <AppFooter />
  </div>
</template>

<script>
import NavBar from '@/components/NavBar.vue';
import AppFooter from '@/components/AppFooter.vue';
import { getListings, filterListings } from '../services/api';

export default {
  name: 'PropertyPage',
  components: { NavBar, AppFooter },
  data() {
    return {
      listings: [],
      loading: false,
      title: '',
      location: '',
      status: '',
      type: '',
      minPrice: '',
      maxPrice: '',
      bedrooms: '',
      currentPage: 1,
      totalPages: 1,
    };
  },
  methods: {
    async fetchListings() {
      this.loading = true;
      try {
        let response;
        // Use filterListings if any filters are applied, otherwise use getListings
        if (this.title || this.location || this.status || this.type || this.minPrice || this.maxPrice || this.bedrooms) {
          response = await filterListings({
            title: this.title || undefined,
            location: this.location || undefined,
            status: this.status || undefined,
            type: this.type || undefined,
            min_price: this.minPrice || undefined,
            max_price: this.maxPrice || undefined,
            bedrooms: this.bedrooms || undefined,
            page: this.currentPage,
          });
        } else {
          response = await getListings(this.currentPage);
        }

        this.listings = response.data.data;
        this.totalPages = response.data.meta.last_page;
      } catch (error) {
        console.error('Error fetching listings:', error);
        this.listings = [];
        this.totalPages = 1;
      } finally {
        this.loading = false;
      }
    },
    changePage(page) {
      this.currentPage = page;
      this.fetchListings();
    },
    formatPrice(price) {
      // Format price as ₦X,XXX,XXX
      return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    },
    listingImage(listing) {
      return `/assets/images/property/${listing.image}`;
    },
  },
  mounted() {
    this.fetchListings();
  },
};
</script>