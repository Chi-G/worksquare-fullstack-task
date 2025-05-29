<template>
  <div class="bg-white text-gray-900">
    <NavBar />

    <section class="py-10">
      <div class="container mx-auto flex justify-center">
        <div class="w-full md:w-1/2">
          <h2 class="text-2xl font-bold mb-4 text-center">Get in touch!</h2>
          <form class="space-y-4" @submit.prevent="submitContactForm">
            <!-- Name -->
            <div>
              <label class="block mb-1 font-semibold" for="name">Name</label>
              <input
                v-model="contact.name"
                type="text"
                id="name"
                placeholder="Your Name"
                class="w-full border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring focus:border-blue-400"
                required
              />
            </div>

            <!-- Email -->
            <div>
              <label class="block mb-1 font-semibold" for="email">Email</label>
              <input
                v-model="contact.email"
                type="email"
                id="email"
                placeholder="Your Email"
                class="w-full border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring focus:border-blue-400"
                required
              />
            </div>

            <!-- Subject -->
            <div>
              <label class="block mb-1 font-semibold" for="subject">Subject</label>
              <input
                v-model="contact.subject"
                type="text"
                id="subject"
                placeholder="Subject"
                class="w-full border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring focus:border-blue-400"
                required
              />
            </div>

            <!-- Message -->
            <div>
              <label class="block mb-1 font-semibold" for="message">Message</label>
              <textarea
                v-model="contact.message"
                id="message"
                rows="5"
                placeholder="Your Message"
                class="w-full border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring focus:border-blue-400"
                required
              ></textarea>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
              <button
                type="submit"
                class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition duration-200"
              >
                Send Message
              </button>
            </div>
          </form>
        </div>
      </div>
    </section>

    <AppFooter />
  </div>
</template>

<script>
import NavBar from '../components/NavBar.vue';
import AppFooter from '../components/AppFooter.vue';

export default {
  name: 'ContactPage',
  components: { NavBar, AppFooter },
  data() {
    return {
      contact: {
        name: '',
        email: '',
        subject: '',
        message: '',
      },
      newsletterEmail: '',
    };
  },
  methods: {
    submitContactForm() {
      alert(
        `Thanks for reaching out, ${this.contact.name}! We'll get in touch soon.`
      );
      // reset form
      this.contact.name = '';
      this.contact.email = '';
      this.contact.subject = '';
      this.contact.message = '';
    },
    subscribeNewsletter() {
      if (!this.newsletterEmail) {
        alert('Please enter your email to subscribe.');
        return;
      }
      alert(`Thanks for subscribing with ${this.newsletterEmail}!`);
      this.newsletterEmail = '';
    },
  },
};
</script>
