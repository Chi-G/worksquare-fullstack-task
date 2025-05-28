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

    <!-- Search Section -->
    <section class="py-10">
      <div class="container mx-auto">
        <h2 class="text-2xl font-bold text-center mb-6">List View Layout</h2>
        <div class="bg-white p-4 rounded shadow-md">
          <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
            <input type="text" placeholder="Search your Keywords" class="p-2 border rounded">
            <select class="p-2 border rounded">
              <option>Select Categories</option>
            </select>
            <select class="p-2 border rounded">
              <option>Min Price</option>
            </select>
            <select class="p-2 border rounded">
              <option>Max Price</option>
            </select>
          </div>
          <button class="bg-green-600 text-white px-4 py-2 rounded mt-4 hover:bg-green-700">Search</button>
        </div>
      </div>
    </section>

    <!-- Property Listings -->
    <section class="py-10">
      <div class="container mx-auto">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div class="border rounded-lg p-4 shadow-md">
            <img src="/assets/images/property/1.jpg" alt="Property" class="w-full h-48 object-cover rounded">
            <h3 class="text-lg font-semibold mt-2">10765 Hillside Ave, Baton Rouge, LA 70810, USA</h3>
            <p class="text-green-600">🔲 800sqft 🛏 4 Beds 🛁 4 Baths</p>
            <p class="text-green-600">$5000 <span class="text-yellow-500">★★★★☆ (5/5)</span></p>
          </div>
          <!-- Repeat for 5 more properties -->
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
        <div class="flex justify-center mt-4 space-x-2">
          <button class="px-2 py-1">1</button>
          <button class="px-2 py-1">2</button>
          <button class="px-2 py-1 bg-green-600 text-white">3</button>
          <button class="px-2 py-1">4</button>
          <button class="px-2 py-1">></button>
        </div>
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
  name: 'PropertyPage',
};
</script>