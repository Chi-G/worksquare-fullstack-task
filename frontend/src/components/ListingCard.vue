<template>
  <div class="listing-card">
    <img :src="listing.image" alt="Listing Image" />
    <h3>{{ listing.title }}</h3>
    <p>{{ listing.location }} - {{ listing.type }}</p>
    <p>${{ listing.price }}</p>
  </div>
</template>

<script>
export default {
  props: {
    listing: Object,
  },
};
</script>

<style scoped>
/* Copy CSS from template or use Tailwind */
.listing-card {
  border: 1px solid #ddd;
  padding: 1rem;
  margin: 1rem;
}
</style>