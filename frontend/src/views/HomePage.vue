<template>
  <div class="bg-white text-gray-900">
    <NavBar />
    <!-- Hero Section -->
    <section class="relative bg-cover bg-center h-64" style="background-image: url('/assets/images/hero-bg.jpg')">
      <div class="absolute inset-0 bg-black opacity-50"></div>
      <div class="relative text-center pt-16">
        <h1 class="text-4xl font-bold text-white">Find Your Dream Home</h1>
      </div>
    </section>

    <!-- Featured Properties -->
    <section class="py-10">
      <div class="container mx-auto">
        <h2 class="text-2xl font-bold text-center mb-6">Featured Properties</h2>
        <p class="text-center text-gray-600 mb-8">A great platform to buy, sell and rent your properties without any agent or commissions.</p>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div class="border rounded-lg p-4 shadow-md">
            <img src="/assets/images/property/1.jpg" alt="Property" class="w-full h-48 object-cover rounded">
            <h3 class="text-lg font-semibold mt-2">10765 Hillside Ave, Baton Rouge, LA 70810, USA</h3>
            <p class="text-green-600">🔲 800sqft 🛏 4 Beds 🛁 4 Baths</p>
            <p class="text-green-600">$5000 <span class="text-yellow-500">★★★★☆ (5/5)</span></p>
          </div>
          <!-- Repeat for 5 more properties with different images and same data -->
          <div class="border rounded-lg p-4 shadow-md">
            <img src="/assets/images/property/2.jpg" alt="Property" class="w-full h-48 object-cover rounded">
            <h3 class="text-lg font-semibold mt-2">10765 Hillside Ave, Baton Rouge, LA 70810, USA</h3>
            <p class="text-green-600">🔲 800sqft 🛏 4 Beds 🛁 4 Baths</p>
            <p class="text-green-600">$5000 <span class="text-yellow-500">★★★★☆ (5/5)</span></p>
          </div>
          <div class="border rounded-lg p-4 shadow-md">
            <img src="/assets/images/property/3.jpg" alt="Property" class="w-full h-48 object-cover rounded">
            <h3 class="text-lg font-semibold mt-2">10765 Hillside Ave, Baton Rouge, LA 70810, USA</h3>
            <p class="text-green-600">🔲 800sqft 🛏 4 Beds 🛁 4 Baths</p>
            <p class="text-green-600">$5000 <span class="text-yellow-500">★★★★☆ (5/5)</span></p>
          </div>
        </div>
      </div>
    </section>

    <!-- How It Works -->
    <section class="py-10 bg-gray-100">
      <div class="container mx-auto text-center">
        <h2 class="text-2xl font-bold mb-6">How It Works</h2>
        <p class="text-center text-gray-600 mb-8">A great platform to buy, sell and rent your properties without any agent or commissions.</p>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div class="p-4">
            <div class="text-green-600 text-4xl mb-4">📋</div>
            <h3 class="text-lg font-semibold">Pre-Approval Letter</h3>
            <p class="text-gray-600">If the distribution of letters and words is randomly made...</p>
          </div>
          <div class="p-4">
            <div class="text-green-600 text-4xl mb-4">🤝</div>
            <h3 class="text-lg font-semibold">Meeting with Agent</h3>
            <p class="text-gray-600">If the distribution of letters and words is randomly made...</p>
          </div>
          <div class="p-4">
            <div class="text-green-600 text-4xl mb-4">🏠</div>
            <h3 class="text-lg font-semibold">Closing Deal</h3>
            <p class="text-gray-600">If the distribution of letters and words is randomly made...</p>
          </div>
        </div>
        <p class="mt-8 text-gray-600">Before buying think first step is finding dream house is the finding is the most important part of pre-approval letter.</p>
      </div>
    </section>

    <!-- Contact Section -->
    <section class="py-10">
      <div class="container mx-auto text-center">
        <h2 class="text-2xl font-bold mb-6">Have Question ? Get in touch!</h2>
        <p class="text-center text-gray-600 mb-8">A great platform to buy, sell and rent your properties without any agent or commissions.</p>
        <button class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">Contact us</button>
      </div>
    </section>

    <AppFooter />
  </div>
</template>

<script>
import NavBar from '../components/NavBar.vue';
import AppFooter from '../components/AppFooter.vue';

export default {
  name: 'HomePage',
  components: { NavBar, AppFooter },
  mounted() {
    console.log('HomePage.vue mounted');
  },
};
</script>