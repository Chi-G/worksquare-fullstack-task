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

    <!-- Map Section -->
    <section class="relative h-96">
      <img src="/assets/images/map.jpg" alt="Map" class="w-full h-full object-cover">
    </section>

    <!-- Contact Form -->
    <section class="py-10">
      <div class="container mx-auto flex flex-col md:flex-row gap-8">
        <div class="w-full md:w-1/2">
          <img src="/assets/images/contact-illustration.png" alt="Contact Illustration" class="w-full h-64 object-cover">
        </div>
        <div class="w-full md:w-1/2">
          <h2 class="text-2xl font-bold mb-4">Get in touch!</h2>
          <form class="space-y-4">
            <div>
              <label>Your Name:</label>
              <input type="text" placeholder="Name" class="w-full p-2 border rounded">
            </div>
            <div>
              <label>Your Email:</label>
              <input type="email" placeholder="Email" class="w-full p-2 border rounded">
            </div>
            <div>
              <label>Your Question:</label>
              <input type="text" placeholder="Subject" class="w-full p-2 border rounded">
            </div>
            <div>
              <label>Your Comment:</label>
              <textarea placeholder="Message" class="w-full p-2 border rounded h-24"></textarea>
            </div>
            <button type="submit" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">Send Message</button>
          </form>
        </div>
      </div>
    </section>

    <!-- Contact Details -->
    <section class="py-10 bg-gray-100 dark:bg-gray-800">
      <div class="container mx-auto grid grid-cols-1 md:grid-cols-3 gap-8 text-center">
        <div>
          <div class="text-green-600 text-4xl mb-4">📞</div>
          <h3 class="text-lg font-semibold">Phone</h3>
          <p class="text-gray-600">+152 534-468-854</p>
        </div>
        <div>
          <div class="text-green-600 text-4xl mb-4">📧</div>
          <h3 class="text-lg font-semibold">Email</h3>
          <p class="text-gray-600">contact@example.com</p>
        </div>
        <div>
          <div class="text-green-600 text-4xl mb-4">📍</div>
          <h3 class="text-lg font-semibold">Location</h3>
          <p class="text-gray-600">C/54 Northwest Freeway, Suite 558, Houston, USA 485</p>
          <a href="#" class="text-green-600">View on Google map</a>
        </div>
      </div>
    </section>

    <!-- Newsletter -->
    <section class="py-10">
      <div class="container mx-auto text-center bg-white p-6 rounded-lg shadow-md">
        <h2 class="text-2xl font-bold mb-4">Subscribe to Newsletter!</h2>
        <p class="text-gray-600 mb-4">Subscribe to get latest updates and information.</p>
        <div class="flex justify-center space-x-2">
          <input type="email" placeholder="Enter your email!" class="p-2 border rounded">
          <button class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">Subscribe</button>
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
  name: 'ContactPage',
};
</script>