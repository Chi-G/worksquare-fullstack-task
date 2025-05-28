<template>
  <div class="bg-white dark:bg-gray-900 text-gray-900 dark:text-white">
    <!-- Navbar -->
    <nav class="bg-white dark:bg-gray-800 shadow-md p-4 flex justify-between items-center">
      <div class="flex items-center">
        <span class="text-2xl font-bold text-green-600">🏠 Hously</span>
      </div>
      <div class="space-x-4">
        <a href="#" class="hover:text-green-600">Home</a>
        <a href="#" class="hover:text-green-600">Buy</a>
        <a href="#" class="hover:text-green-600">Sell</a>
        <a href="#" class="hover:text-green-600">Listing</a>
        <a href="#" class="hover:text-green-600">Pages</a>
        <a href="#" class="hover:text-green-600">Contact</a>
        <button class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">Sign up</button>
      </div>
    </nav>

    <!-- Hero Section -->
    <section class="relative bg-cover bg-center h-64" style="background-image: url('/assets/images/hero-bg.jpg')">
      <div class="absolute inset-0 bg-black opacity-50"></div>
      <div class="relative text-center pt-16">
        <h1 class="text-4xl font-bold text-white">Find Your Dream Home</h1>
        <div class="mt-4 flex justify-center space-x-2">
          <input type="text" placeholder="City, Zip..." class="p-2 border rounded">
          <button class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">Search</button>
        </div>
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
    <section class="py-10 bg-gray-100 dark:bg-gray-800">
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

    <!-- Footer -->
    <footer class="bg-gray-900 text-white py-10">
      <div class="container mx-auto grid grid-cols-1 md:grid-cols-3 gap-8">
        <div>
          <h3 class="text-xl font-bold mb-4">🏠 Hously</h3>
          <p>A great platform to buy, sell and rent your properties without any agent or commissions.</p>
        </div>
        <div>
          <h3 class="text-xl font-bold mb-4">Company</h3>
          <ul class="space-y-2">
            <li><a href="#" class="hover:text-green-600">About us</a></li>
            <li><a href="#" class="hover:text-green-600">Services</a></li>
            <li><a href="#" class="hover:text-green-600">Pricing</a></li>
            <li><a href="#" class="hover:text-green-600">Blog</a></li>
            <li><a href="#" class="hover:text-green-600">Login</a></li>
          </ul>
        </div>
        <div>
          <h3 class="text-xl font-bold mb-4">Contact Details</h3>
          <p>📍 C/54 Northwest Freeway, Suite 558, Houston, USA 485</p>
          <p>📧 contact@example.com</p>
          <p>📞 +152 534-468-854</p>
        </div>
      </div>
      <div class="container mx-auto mt-8 text-center">
        <p>&copy; 2025 Hously, Design & Develop with ♥ by Shreethemes.</p>
      </div>
    </footer>
  </div>
</template>

<script>
export default {
  name: 'HomePage',
};
</script>