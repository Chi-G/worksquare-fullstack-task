<template>
    <div class="min-h-screen dark:bg-slate-900">
      <!-- Dark Mode Switcher -->
      <div class="fixed top-1/4 -left-2 z-3">
        <span class="relative inline-block rotate-90">
          <input 
            type="checkbox" 
            class="checkbox opacity-0 absolute" 
            id="chk" 
            v-model="isDarkMode"
            @change="toggleDarkMode"
          />
          <label 
            class="label bg-slate-900 dark:bg-white shadow dark:shadow-gray-700 cursor-pointer rounded-full flex justify-between items-center p-1 w-14 h-8" 
            for="chk"
          >
            <i class="uil uil-moon text-[20px] text-yellow-500 mt-1"></i>
            <i class="uil uil-sun text-[20px] text-yellow-500 mt-1"></i>
            <span 
              class="ball bg-white dark:bg-slate-900 rounded-full absolute top-[2px] left-[2px] size-7 transition-transform duration-300"
              :class="{ 'translate-x-6': isDarkMode }"
            ></span>
          </label>
        </span>
      </div>
  
      <!-- RTL Toggle -->
      <div class="fixed top-[40%] -left-3 z-50">
        <a href="#" @click.prevent="toggleRTL" id="switchRtl">
          <span 
            class="py-1 px-3 relative inline-block rounded-b-md -rotate-90 bg-white dark:bg-slate-900 shadow-md dark:shadow dark:shadow-gray-800 font-semibold rtl:block ltr:hidden"
          >LTR</span>
          <span 
            class="py-1 px-3 relative inline-block rounded-b-md -rotate-90 bg-white dark:bg-slate-900 shadow-md dark:shadow dark:shadow-gray-800 font-semibold ltr:block rtl:hidden"
          >RTL</span>
        </a>
      </div>
  
      <!-- Back to Top Button -->
      <a 
        href="#" 
        @click.prevent="scrollToTop" 
        id="back-to-top" 
        class="back-to-top fixed hidden text-lg rounded-full z-10 bottom-5 end-5 size-9 text-center bg-green-600 text-white justify-center items-center"
        :class="{ '!flex': showBackToTop }"
      >
        <i class="uil uil-arrow-up"></i>
      </a>
  
      <!-- Main Content -->
      <slot></slot>
    </div>
  </template>
  
  <script>
  import { ref, onMounted, onUnmounted } from 'vue'
  
  export default {
    name: 'BaseVue',
    setup() {
      const isDarkMode = ref(false)
      const isRTL = ref(false)
      const showBackToTop = ref(false)
  
      // Dark Mode Toggle
      const toggleDarkMode = () => {
        document.documentElement.classList.toggle('dark')
        localStorage.setItem('darkMode', isDarkMode.value)
      }
  
      // RTL Toggle
      const toggleRTL = () => {
        isRTL.value = !isRTL.value
        document.documentElement.dir = isRTL.value ? 'rtl' : 'ltr'
        localStorage.setItem('rtl', isRTL.value)
      }
  
      // Back to Top
      const handleScroll = () => {
        showBackToTop.value = window.scrollY > 300
      }
  
      const scrollToTop = () => {
        window.scrollTo({
          top: 0,
          behavior: 'smooth'
        })
      }
  
      onMounted(() => {
        // Initialize dark mode
        const savedDarkMode = localStorage.getItem('darkMode')
        if (savedDarkMode !== null) {
          isDarkMode.value = savedDarkMode === 'true'
          if (isDarkMode.value) {
            document.documentElement.classList.add('dark')
          }
        }
  
        // Initialize RTL
        const savedRTL = localStorage.getItem('rtl')
        if (savedRTL !== null) {
          isRTL.value = savedRTL === 'true'
          document.documentElement.dir = isRTL.value ? 'rtl' : 'ltr'
        }
  
        // Add scroll event listener
        window.addEventListener('scroll', handleScroll)
      })
  
      onUnmounted(() => {
        window.removeEventListener('scroll', handleScroll)
      })
  
      return {
        isDarkMode,
        isRTL,
        showBackToTop,
        toggleDarkMode,
        toggleRTL,
        scrollToTop
      }
    }
  }
  </script>
  
  <style scoped>
  .checkbox {
    @apply hidden;
  }
  
  .label {
    @apply relative inline-flex items-center justify-between cursor-pointer;
  }
  
  .ball {
    @apply transition-transform duration-300;
  }
  
  .back-to-top {
    @apply opacity-0 transition-all duration-300;
  }
  
  .back-to-top:hover {
    @apply bg-green-700;
  }
  
  /* RTL Specific Styles */
  [dir="rtl"] .back-to-top {
    @apply end-auto start-5;
  }
  
  [dir="rtl"] .label {
    @apply flex-row-reverse;
  }
  
  [dir="rtl"] .ball {
    @apply left-auto right-[2px];
  }
  
  [dir="rtl"] .ball.translate-x-6 {
    @apply -translate-x-6;
  }
  </style>