<template>
  <div>
    <nav :class="['bg-white p-4 transition-all duration-300', isScrolled ? 'fixed top-0 left-0 right-0 shadow-lg z-50' : '']">
      <div class="container mx-auto px-4">
        <!-- Desktop Menu -->
        <div class="flex justify-between items-center">
          <div class="flex items-center space-x-4">
            <span class="text-2xl font-bold text-green-600">🏠 DreamWell Estate</span>
            <span v-if="user" class="text-gray-700">Welcome, {{ user.name }}!</span>
          </div>
          
          <!-- Mobile Menu Button -->
          <div class="block md:hidden">
            <button @click="toggleMenu" class="text-gray-600 hover:text-green-600">
              <svg v-if="!isMenuOpen" class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
              </svg>
              <svg v-else class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
              </svg>
            </button>
          </div>

          <!-- Desktop Navigation -->
          <div class="hidden md:flex items-center space-x-4">
            <router-link 
              to="/" 
              class="hover:text-green-600 px-4 py-2 rounded-lg transition-colors"
              active-class="bg-green-600 text-white hover:text-white"
            >Home</router-link>
            <router-link 
              v-if="user"
              to="/property" 
              class="hover:text-green-600 px-4 py-2 rounded-lg transition-colors"
              active-class="bg-green-600 text-white hover:text-white"
            >Property</router-link>
            <router-link 
              to="/contact" 
              class="hover:text-green-600 px-4 py-2 rounded-lg transition-colors"
              active-class="bg-green-600 text-white hover:text-white"
            >Contact</router-link>
            <div v-if="!user" class="flex space-x-6">
              <router-link to="/login">
                <button class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700">Become an Agent</button>
              </router-link>
              <router-link to="/login">
                <button class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700">Login</button>
              </router-link>
            </div>
            <div v-else class="flex space-x-6">
              <button @click="logout" class="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700">Logout</button>
            </div>
          </div>
        </div>

        <!-- Mobile Navigation -->
        <div v-show="isMenuOpen" class="md:hidden mt-4 space-y-2">
          <router-link 
            to="/" 
            class="block hover:text-green-600 px-4 py-2 rounded-lg transition-colors"
            active-class="bg-green-600 text-white"
          >Home</router-link>
          <router-link 
            v-if="user"
            to="/property" 
            class="block hover:text-green-600 px-4 py-2 rounded-lg transition-colors"
            active-class="bg-green-600 text-white hover:text-white"
          >Property</router-link>
          <router-link 
            to="/contact"  
            class="block hover:text-green-600 px-4 py-2 rounded-lg transition-colors"
            active-class="bg-green-600 text-white"
          >Contact</router-link>
          <div v-if="!user" class="flex flex-col space-y-4 pt-2">
            <router-link to="/login">
              <button class="w-full bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700">Become an Agent</button>
            </router-link>
            <router-link to="/login">
              <button class="w-full bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700">Login</button>
            </router-link>
          </div>
          <div v-else class="flex flex-col space-y-4 pt-2">
            <button @click="logout" class="w-full bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700">Logout</button>
          </div>
        </div>
      </div>
    </nav>
    <div v-if="isScrolled" class="h-16"></div>
  </div>
</template>

<script>
import { logout } from '../services/api';

export default {
  name: 'NavBar',
  data() {
    return {
      isMenuOpen: false,
      isScrolled: false,
      user: null,
    };
  },
  methods: {
    toggleMenu() {
      this.isMenuOpen = !this.isMenuOpen;
    },
    handleScroll() {
      this.isScrolled = window.scrollY > 0;
    },
    async logout() {
      try {
        await logout();
        localStorage.removeItem('auth');
        localStorage.removeItem('user');
        this.user = null;
        this.$router.push('/login');
      } catch (error) {
        console.error('Logout error:', error);
      }
    },
    checkUser() {
      const user = localStorage.getItem('user');
      if (user) {
        this.user = JSON.parse(user);
      }
    },
    refreshUser() {
      this.checkUser();
    },
  },
  mounted() {
    window.addEventListener('scroll', this.handleScroll);
    this.checkUser();
    // Listen for storage changes (e.g., login/logout from other tabs)
    window.addEventListener('storage', this.refreshUser);
  },
  beforeUnmount() {
    window.removeEventListener('scroll', this.handleScroll);
    window.removeEventListener('storage', this.refreshUser);
  },
};
</script>

<style scoped> 
.router-link-active {
  background-color: #059669;
  color: white;
}
</style>