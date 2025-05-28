<template>
  <footer class="relative bg-slate-900 dark:bg-slate-800">
    <div class="container relative">
      <div class="grid grid-cols-1">
        <div class="relative py-12">
          <div class="grid md:grid-cols-12 grid-cols-1 gap-[30px]">
            <div class="md:col-span-3">
              <a href="#" class="text-[22px] focus:outline-none">
                <span class="text-green-600 font-bold">Hously</span>
              </a>
              <p class="mt-6 text-gray-300">A great platform to buy, sell and rent your properties without any agent or commissions.</p>
            </div>

            <div class="md:col-span-3">
              <h5 class="tracking-[1.5px] font-semibold">Company</h5>
              <ul class="list-none footer-list mt-6">
                <li class="mt-[10px]">
                  <router-link to="/" class="text-gray-300 hover:text-green-600">Home</router-link>
                </li>
                <li class="mt-[10px]">
                  <router-link to="/property" class="text-gray-300 hover:text-green-600">Property</router-link>
                </li>
                <li class="mt-[10px]">
                  <router-link to="/contact" class="text-gray-300 hover:text-green-600">Contact</router-link>
                </li>
              </ul>
            </div>

            <div class="md:col-span-3">
              <h5 class="tracking-[1.5px] font-semibold">Contact</h5>
              <ul class="list-none footer-list mt-6">
                <li class="mt-[10px]">
                  <a href="tel:+152534-468-854" class="text-gray-300 hover:text-green-600">+152 534-468-854</a>
                </li>
                <li class="mt-[10px]">
                  <a href="mailto:contact@example.com" class="text-gray-300 hover:text-green-600">contact@example.com</a>
                </li>
                <li class="mt-[10px]">
                  <a href="https://maps.google.com" class="text-gray-300 hover:text-green-600">C/54 Northwest Freeway, Suite 558, Houston, USA 485</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  name: 'AppFooter'
}
</script>