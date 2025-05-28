<template>
  <nav class="navbar navbar-expand-lg fixed-top sticky" :class="{ 'navbar-light bg-white': !isDarkMode, 'navbar-dark bg-dark': isDarkMode }">
    <div class="container">
      <router-link class="navbar-brand" to="/">
        <span class="inline-block dark:hidden">
          <img src="/assets/images/logo-dark.png" class="l-dark" height="24" alt="">
          <img src="/assets/images/logo-light.png" class="l-light" height="24" alt="">
        </span>
        <img src="/assets/images/logo-light.png" height="24" class="hidden dark:inline-block" alt="">
      </router-link>

      <!-- Mobile Toggle -->
      <div class="menu-extras">
        <div class="menu-item">
          <a class="navbar-toggle" id="isToggle" @click="toggleMenu">
            <div class="lines">
              <span></span>
              <span></span>
              <span></span>
            </div>
          </a>
        </div>
      </div>

      <!-- Login button -->
      <ul class="buy-button list-none mb-0">
        <li class="inline mb-0">
          <router-link to="/login" class="btn btn-icon bg-green-600 hover:bg-green-700 border-green-600 dark:border-green-600 text-white rounded-full">
            <i data-feather="user" class="size-4 stroke-[3]"></i>
          </router-link>
        </li>
        <li class="sm:inline ps-1 mb-0 hidden">
          <router-link to="/register" class="btn bg-green-600 hover:bg-green-700 border-green-600 dark:border-green-600 text-white rounded-full">Signup</router-link>
        </li>
      </ul>

      <div id="navigation">
        <!-- Navigation Menu -->
        <ul class="navigation-menu justify-end nav-light">
          <li><router-link to="/" class="sub-menu-item">Home</router-link></li>
          <li><router-link to="/property" class="sub-menu-item">Property</router-link></li>
          <li><router-link to="/contact" class="sub-menu-item">Contact</router-link></li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
import { ref, onMounted } from 'vue'

export default {
  name: 'NavBarLight',
  setup() {
    const isDarkMode = ref(false)
    const isMenuOpen = ref(false)

    onMounted(() => {
      isDarkMode.value = localStorage.getItem('darkMode') === 'true'
    })

    const toggleMenu = () => {
      isMenuOpen.value = !isMenuOpen.value
    }

    return {
      isDarkMode,
      isMenuOpen,
      toggleMenu
    }
  }
}
</script>

<style scoped>
.defaultscroll {
  @apply fixed top-0 start-0 w-full z-50 transition-all duration-500;
}

.is-sticky {
  @apply bg-white dark:bg-slate-900 shadow dark:shadow-gray-700;
}

.navbar-toggle {
  @apply relative inline-flex items-center justify-center size-10 text-slate-400 hover:text-green-600;
}

.lines {
  @apply relative w-6 h-4;
}

.lines span {
  @apply absolute w-6 h-0.5 bg-current transition-all duration-300;
}

.lines span:nth-child(1) {
  @apply top-0;
}

.lines span:nth-child(2) {
  @apply top-2;
}

.lines span:nth-child(3) {
  @apply top-4;
}

.navbar-toggle.active .lines span:nth-child(1) {
  @apply top-2 rotate-45;
}

.navbar-toggle.active .lines span:nth-child(2) {
  @apply opacity-0;
}

.navbar-toggle.active .lines span:nth-child(3) {
  @apply top-2 -rotate-45;
}

.navigation-menu {
  @apply flex items-center;
}

.navigation-menu li {
  @apply relative;
}

.navigation-menu li a {
  @apply px-4 py-2 text-slate-400 hover:text-green-600 transition duration-300;
}

.navigation-menu li a.active {
  @apply text-green-600;
}

@media (max-width: 1024px) {
  #navigation {
    @apply fixed top-0 start-0 w-full h-full bg-white dark:bg-slate-900 shadow dark:shadow-gray-700 hidden;
  }

  #navigation.active {
    @apply block;
  }

  .navigation-menu {
    @apply flex-col items-start p-4;
  }

  .navigation-menu li {
    @apply w-full;
  }

  .navigation-menu li a {
    @apply block py-2;
  }
}
</style> 