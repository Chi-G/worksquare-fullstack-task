<template>
  <div class="min-h-screen bg-cover bg-center" style="background-image: url('/assets/images/login-bg.jpg')">
    <div class="min-h-screen flex items-center justify-center bg-black bg-opacity-50">
      <div class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md">
        <div class="text-center mb-6">
          <span class="text-4xl text-green-600">🏠</span>
          <h2 class="text-2xl font-bold mt-2">Login</h2>
        </div>
        <div v-if="error" class="text-red-600 text-center mb-4">{{ error }}</div>
        <form class="space-y-4" @submit.prevent="handleLogin">
          <div>
            <label class="block text-gray-700">Email Address:</label>
            <input v-model="email" type="email" placeholder="name@example.com" class="w-full p-2 border rounded mt-1" required>
          </div>
          <div>
            <label class="block text-gray-700">Password:</label>
            <input v-model="password" type="password" placeholder="Password" class="w-full p-2 border rounded mt-1" required>
          </div>
          <div class="flex justify-between items-center">
            <div class="flex items-center">
              <input v-model="rememberMe" type="checkbox" id="remember" class="mr-2">
              <label for="remember" class="text-gray-700">Remember me</label>
            </div>
            <a href="#" class="text-green-600 hover:underline">Forgot password?</a>
          </div>
          <button type="submit" class="w-full bg-green-600 text-white p-2 rounded hover:bg-green-700" :disabled="loading">
            {{ loading ? 'Logging in...' : 'Login / Sign in' }}
          </button>
          <p class="text-center text-gray-600">Test Credentials: <span class="text-green-600">test@example.com | password123</span></p>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { login } from '../services/api';

export default {
  name: 'LoginPage',
  data() {
    return {
      email: '',
      password: '',
      rememberMe: false,
      loading: false,
      error: '',
    };
  },
  methods: {
    async handleLogin() {
      console.log('Form submitted with email:', this.email, 'and password:', this.password);
      this.loading = true;
      this.error = '';

      try {
        const response = await login({
          email: this.email,
          password: this.password,
        });
        console.log('Login response:', response);

        // Store the token (already handled by api.js interceptor)
        // Store user data in localStorage
        localStorage.setItem('user', JSON.stringify(response.data.user));

        // Redirect to the previous page or home
        const redirect = this.$route.query.redirect || '/';
        this.$router.push(redirect);
      } catch (error) {
        console.error('Login error:', error);
        if (error.response && error.response.status === 401) {
          this.error = 'Invalid email or password.';
        } else {
          this.error = 'An error occurred. Please try again.';
        }
      } finally {
        this.loading = false;
      }
    },
  },
};
</script>