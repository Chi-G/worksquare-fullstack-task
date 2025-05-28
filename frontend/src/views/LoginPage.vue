<template>
  <div class="min-h-screen bg-cover bg-center" style="background-image: url('/assets/images/login-bg.jpg')">
    <div class="min-h-screen flex items-center justify-center bg-black bg-opacity-50">
      <div class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md">
        <div class="text-center mb-6">
          <span class="text-4xl text-green-600">🏠</span>
          <h2 class="text-2xl font-bold mt-2">Login</h2>
        </div>
        <form class="space-y-4">
          <div>
            <label class="block text-gray-700">Email Address:</label>
            <input type="email" placeholder="name@example.com" class="w-full p-2 border rounded mt-1">
          </div>
          <div>
            <label class="block text-gray-700">Password:</label>
            <input type="password" placeholder="Password" class="w-full p-2 border rounded mt-1">
          </div>
          <div class="flex justify-between items-center">
            <div class="flex items-center">
              <input type="checkbox" id="remember" class="mr-2">
              <label for="remember" class="text-gray-700">Remember me</label>
            </div>
            <a href="#" class="text-green-600 hover:underline">Forgot password?</a>
          </div>
          <button type="submit" class="w-full bg-green-600 text-white p-2 rounded hover:bg-green-700">Login / Sign in</button>
          <p class="text-center text-gray-600">Don't have an account? <a href="/register" class="text-green-600 hover:underline">Sign Up</a></p>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'LoginPage',
};
</script>