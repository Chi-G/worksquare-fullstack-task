<template>
  <div class="bg-white text-gray-900">
    <NavBar />

    <!-- User Check -->
    <div v-if="!user" class="container mx-auto py-8 text-center">
      <p>Please <router-link to="/login" class="text-green-600 hover:underline">login</router-link> to view properties.</p>
    </div>
    <div v-else>
      <!-- Search Section -->
      <section class="py-10">
        <div class="container mx-auto">
          <h2 class="text-2xl font-bold text-center mb-6">List View</h2>
          <div class="bg-white p-4 rounded shadow-md">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
              <input v-model="title" type="text" placeholder="Search by title (e.g., 4 Bedroom)" class="p-2 border rounded" />
              <input v-model="location" type="text" placeholder="Search by location (e.g., Lekki, Abuja)" class="p-2 border rounded" />
              <select v-model="status" class="p-2 border rounded">
                <option value="">All Statuses</option>
                <option value="rent">For Rent</option>
                <option value="lease">For Lease</option>
                <option value="shortlet">Shortlet</option>
              </select>
              <select v-model="type" class="p-2 border rounded">
                <option value="">All Categories</option>
                <option value="house">House</option>
                <option value="flat">Flat</option>
                <option value="duplex">Duplex</option>
                <option value="penthouse">Penthouse</option>
                <option value="terrace">Terrace</option>
                <option value="apartment">Apartment</option>
                <option value="mansion">Mansion</option>
                <option value="shortlet">Shortlet</option>
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
          <div v-else-if="error" class="text-center text-red-500 font-semibold">{{ error }}</div>
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
                    v-if="parsedStatus(item.status)"
                    class="bg-yellow-100 text-yellow-800 text-xs font-semibold px-2 py-1 rounded"
                  >
                    {{ parsedStatus(item.status) }}
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
              {{ page }}
            </button>
          </div>
        </div>
      </section>
    </div>

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
      error: '',
      title: '',
      location: '',
      status: '',
      type: '',
      minPrice: '',
      maxPrice: '',
      bedrooms: '',
      currentPage: 1,
      totalPages: 1,
      user: JSON.parse(localStorage.getItem('user')),
    };
  },
  methods: {
    async fetchListings() {
      if (!this.user) return;
      this.loading = true;
      this.error = '';
      try {
        let response;
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

        console.log('API response:', JSON.stringify(response.data, null, 2));

        // Handle Laravel paginated response
        if (response.data.data && 'last_page' in response.data) {
          this.listings = response.data.data.map(item => ({
            ...item,
            status: this.parseStatus(item.status),
          }));
          this.totalPages = response.data.last_page || 1;
        } else if (Array.isArray(response.data)) {
          this.listings = response.data.map(item => ({
            ...item,
            status: this.parseStatus(item.status),
          }));
          this.totalPages = 1;
        } else if (response.data.error) {
          throw new Error(response.data.error);
        } else {
          throw new Error('Unexpected response structure');
        }
      } catch (error) {
        console.error('Error fetching listings:', error);
        this.error = error.message || 'Failed to load listings';
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
      return Number(price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    },
    listingImage(listing) {
      return listing.image ? listing.image : '/assets/images/property/default.jpg';
    },
    parseStatus(status) {
      try {
        if (typeof status === 'string') {
          const parsed = JSON.parse(status);
          return parsed.status || 'Unknown';
        }
        return status || 'Unknown';
      } catch (e) {
        return 'Unknown';
      }
    },
    parsedStatus(status) {
      return this.parseStatus(status);
    },
  },
  mounted() {
    if (this.user) {
      this.fetchListings();
    }
  },
};
</script>