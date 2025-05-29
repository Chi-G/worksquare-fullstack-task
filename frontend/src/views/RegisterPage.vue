<template>
  <div class="min-h-screen bg-cover bg-center" style="background-image: url('/assets/images/login-bg.jpg')">
    <div class="min-h-screen flex items-center justify-center bg-black bg-opacity-50">
      <div class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md">
        <div class="text-center mb-6">
          <span class="text-4xl text-green-600">🏠</span>
          <h2 class="text-2xl font-bold mt-2">Sign Up</h2>
        </div>
        <div v-if="error" class="text-red-600 text-center mb-4">{{ error }}</div>
        <form class="space-y-4" @submit.prevent="handleRegister">
          <div>
            <label class="block text-gray-700">Your Name</label>
            <input
              v-model="form.name"
              type="text"
              placeholder="Your Name"
              class="w-full p-2 border rounded mt-1"
              required
            />
            <p v-if="errors.name" class="text-red-500 text-sm mt-1">{{ errors.name }}</p>
          </div>
          <div>
            <label class="block text-gray-700">Email Address</label>
            <input
              v-model="form.email"
              type="email"
              placeholder="name@example.com"
              class="w-full p-2 border rounded mt-1"
              required
            />
            <p v-if="errors.email" class="text-red-500 text-sm mt-1">{{ errors.email }}</p>
          </div>
          <div class="relative">
            <label class="block text-gray-700">Password</label>
            <input
              v-model="form.password"
              :type="showPassword ? 'text' : 'password'"
              placeholder="Password"
              class="w-full p-2 border rounded mt-1 pr-10"
              required
            />
            <button
              type="button"
              class="absolute right-2 top-9 text-gray-600"
              @click="showPassword = !showPassword"
            >
              <svg v-if="showPassword" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
              </svg>
              <svg v-else class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
              </svg>
            </button>
            <p v-if="errors.password" class="text-red-500 text-sm mt-1">{{ errors.password }}</p>
          </div>
          <div class="flex items-center">
            <input v-model="form.terms" type="checkbox" id="terms" class="mr-2" required />
            <label for="terms" class="text-gray-700">I Accept Terms And Conditions</label>
          </div>
          <button
            type="submit"
            class="w-full bg-green-600 text-white p-2 rounded-lg hover:bg-green-700"
            :disabled="loading"
          >
            {{ loading ? 'Registering...' : 'Register' }}
          </button>
          <p class="text-center text-gray-600">
            Already have an account? <router-link to="/login" class="text-green-600 hover:underline">Sign In</router-link>
          </p>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { register } from '../services/api';

export default {
  name: 'RegisterPage',
  data() {
    return {
      form: {
        name: '',
        email: '',
        password: '',
        terms: false,
      },
      errors: {
        name: '',
        email: '',
        password: '',
      },
      showPassword: false,
      loading: false,
      error: '',
    };
  },
  methods: {
    validateForm() {
      this.errors = { name: '', email: '', password: '' };
      let isValid = true;

      if (!this.form.name.trim()) {
        this.errors.name = 'Name is required';
        isValid = false;
      }

      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(this.form.email)) {
        this.errors.email = 'Invalid email format';
        isValid = false;
      }

      if (this.form.password.length < 6) {
        this.errors.password = 'Password must be at least 6 characters';
        isValid = false;
      }

      return isValid;
    },
    async handleRegister() {
      this.error = '';
      if (!this.validateForm()) return;

      this.loading = true;
      try {
        await register({
          name: this.form.name,
          email: this.form.email,
          password: this.form.password,
        });
        this.$router.push('/login');
      } catch (error) {
        this.error = error.response?.data?.error || 'Registration failed';
        if (error.response?.data?.errors) {
          const serverErrors = error.response.data.errors;
          this.errors.name = serverErrors.name?.[0] || '';
          this.errors.email = serverErrors.email?.[0] || '';
          this.errors.password = serverErrors.password?.[0] || '';
        }
      } finally {
        this.loading = false;
      }
    },
  },
};
</script>