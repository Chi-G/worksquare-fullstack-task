<template>
  <div class="grid lg:grid-cols-2 grid-cols-1 gap-[30px]">
    <div v-for="(property, index) in properties" :key="index" class="group relative overflow-hidden bg-white dark:bg-slate-900 rounded-md shadow dark:shadow-gray-700">
      <div class="relative overflow-hidden">
        <img :src="property.image" class="group-hover:scale-110 transition duration-500" alt="">
        <div class="absolute top-4 end-4">
          <span class="bg-green-600 text-white text-[12px] font-bold px-2.5 py-1 rounded-full h-5">{{ property.type }}</span>
        </div>
      </div>

      <div class="p-6">
        <div class="pb-6">
          <a href="#" class="text-lg hover:text-green-600 font-medium transition duration-500">{{ property.title }}</a>
          <p class="text-slate-400 mt-2">{{ property.location }}</p>
        </div>

        <ul class="py-6 border-y border-gray-100 dark:border-gray-700 flex items-center list-none">
          <li class="flex items-center me-4">
            <i class="uil uil-bed text-2xl me-2 text-green-600"></i>
            <span>{{ property.bedrooms }} Beds</span>
          </li>
          <li class="flex items-center me-4">
            <i class="uil uil-bath text-2xl me-2 text-green-600"></i>
            <span>{{ property.bathrooms }} Baths</span>
          </li>
          <li class="flex items-center">
            <i class="uil uil-ruler-combined text-2xl me-2 text-green-600"></i>
            <span>{{ property.area }} sqft</span>
          </li>
        </ul>

        <div class="pt-6 flex justify-between items-center">
          <span class="text-slate-400"><i class="uil uil-map-marker text-green-600 me-1"></i>{{ property.address }}</span>
          <span class="text-green-600 text-lg font-semibold">${{ property.price }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ListingList',
  data() {
    return {
      properties: [
        {
          image: '@/assets/images/property/1.jpg',
          type: 'For Sale',
          title: 'Luxury Apartment',
          location: 'New York, USA',
          bedrooms: 3,
          bathrooms: 2,
          area: 1200,
          address: '123 Main St',
          price: '250,000'
        },
        {
          image: '@/assets/images/property/2.jpg',
          type: 'For Rent',
          title: 'Modern House',
          location: 'Los Angeles, USA',
          bedrooms: 4,
          bathrooms: 3,
          area: 1800,
          address: '456 Oak Ave',
          price: '3,500'
        }
        // Add more properties as needed
      ]
    }
  }
}
</script>

<style scoped>
.group:hover img {
  transform: scale(1.1);
}
</style> 