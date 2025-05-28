<template>
  <div>
    <div class="fixed bottom-3 end-3 z-10">
      <router-link to="/" class="back-button btn btn-icon bg-green-600 hover:bg-green-700 text-white rounded-full">
        <i data-feather="arrow-left" class="size-4"></i>
      </router-link>
    </div>
    
    <!-- Dark Mode Switcher -->
    <div class="fixed top-1/4 -left-2 z-3">
      <span class="relative inline-block rotate-90">
        <input type="checkbox" class="checkbox opacity-0 absolute" id="chk" v-model="isDarkMode" @change="toggleDarkMode" />
        <label class="label bg-slate-900 dark:bg-white shadow dark:shadow-gray-700 cursor-pointer rounded-full flex justify-between items-center p-1 w-14 h-8" for="chk">
          <i class="uil uil-moon text-[20px] text-yellow-500 mt-1"></i>
          <i class="uil uil-sun text-[20px] text-yellow-500 mt-1"></i>
          <span class="ball bg-white dark:bg-slate-900 rounded-full absolute top-[2px] left-[2px] size-7"></span>
        </label>
      </span>
    </div>

    <!-- LTR & RTL Mode Toggle -->
    <div class="fixed top-[40%] -left-3 z-50">
      <a href="#" @click.prevent="toggleRtl">
        <span class="py-1 px-3 relative inline-block rounded-b-md -rotate-90 bg-white dark:bg-slate-900 shadow-md dark:shadow dark:shadow-gray-800 font-semibold rtl:block ltr:hidden">LTR</span>
        <span class="py-1 px-3 relative inline-block rounded-b-md -rotate-90 bg-white dark:bg-slate-900 shadow-md dark:shadow dark:shadow-gray-800 font-semibold ltr:block rtl:hidden">RTL</span>
      </a>
    </div>

    <!-- Main Content -->
    <slot></slot>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue'
import feather from 'feather-icons'

export default {
  name: 'NoHeader',
  setup() {
    const isDarkMode = ref(document.documentElement.classList.contains('dark'))
    const isRtl = ref(document.documentElement.dir === 'rtl')

    const toggleDarkMode = () => {
      document.documentElement.classList.toggle('dark')
      localStorage.setItem('darkMode', isDarkMode.value ? 'true' : 'false')
    }

    const toggleRtl = () => {
      const newDir = isRtl.value ? 'ltr' : 'rtl'
      document.documentElement.dir = newDir
      isRtl.value = !isRtl.value
      localStorage.setItem('rtl', newDir)
    }

    onMounted(() => {
      // Initialize Feather Icons
      feather.replace()

      // Check for saved preferences
      const savedDarkMode = localStorage.getItem('darkMode')
      const savedRtl = localStorage.getItem('rtl')

      if (savedDarkMode) {
        isDarkMode.value = savedDarkMode === 'true'
        document.documentElement.classList.toggle('dark', isDarkMode.value)
      }

      if (savedRtl) {
        isRtl.value = savedRtl === 'rtl'
        document.documentElement.dir = savedRtl
      }
    })

    return {
      isDarkMode,
      toggleDarkMode,
      toggleRtl
    }
  }
}
</script>

<style scoped>
.checkbox:checked + .label .ball {
  transform: translateX(24px);
}

.ball {
  transition: transform 0.2s linear;
}

.btn-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 2.5rem;
  height: 2.5rem;
}
</style> 