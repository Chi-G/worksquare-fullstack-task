<template>
  <nav class="relative lg:py-4 py-3">
    <div class="container">
      <div class="flex justify-between items-center">
        <!-- Logo -->
        <div class="flex items-center">
          <router-link to="/" class="text-2xl font-bold text-green-600">Hously</router-link>
        </div>

        <!-- Navigation Links -->
        <div class="hidden lg:flex items-center">
          <router-link to="/" class="text-slate-400 hover:text-green-600 mx-4">Home</router-link>
          <router-link to="/property" class="text-slate-400 hover:text-green-600 mx-4">Property</router-link>
          <router-link to="/contact" class="text-slate-400 hover:text-green-600 mx-4">Contact</router-link>
        </div>

        <!-- Mobile Menu Button -->
        <div class="lg:hidden">
          <button @click="toggleMenu" class="text-slate-400 hover:text-green-600">
            <i class="uil uil-bars text-2xl"></i>
          </button>
        </div>
      </div>

      <!-- Mobile Menu -->
      <div v-if="isMenuOpen" class="lg:hidden mt-4">
        <router-link to="/" class="block text-slate-400 hover:text-green-600 py-2">Home</router-link>
        <router-link to="/property" class="block text-slate-400 hover:text-green-600 py-2">Property</router-link>
        <router-link to="/contact" class="block text-slate-400 hover:text-green-600 py-2">Contact</router-link>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'NavBar',
  data() {
    return {
      isMenuOpen: false
    }
  },
  methods: {
    toggleMenu() {
      this.isMenuOpen = !this.isMenuOpen
    }
  }
}
</script>