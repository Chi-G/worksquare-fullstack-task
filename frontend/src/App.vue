<template>
  <div class="container">
    <SearchBar />
    <div v-if="loading">Loading...</div>
    <div v-else-if="!listings.length">No listings found.</div>
    <div v-else class="listings-grid">
      <ListingCard v-for="listing in listings" :key="listing.id" :listing="listing" />
    </div>
  </div>
</template>