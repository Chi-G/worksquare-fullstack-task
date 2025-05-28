<template>
  <div class="group relative bg-white dark:bg-slate-900 rounded-md shadow dark:shadow-gray-800 overflow-hidden">
    <div class="relative overflow-hidden">
      <img :src="listing.image || '/assets/images/property/default.jpg'" class="group-hover:scale-110 transition duration-500" alt="">
      <div class="absolute top-4 start-4">
        <span class="bg-green-600 text-white text-[12px] font-bold px-2.5 py-1 rounded-full h-5">{{ listing.type }}</span>
      </div>
    </div>

    <div class="p-6">
      <div class="pb-6">
        <a href="#" class="text-lg hover:text-green-600 font-medium transition duration-500 ease-in-out">{{ listing.title }}</a>
        <p class="text-slate-400 mt-2">{{ listing.location }}</p>
      </div>

      <div class="py-6 border-t border-gray-100 dark:border-gray-700 flex items-center justify-between">
        <span class="text-slate-400"><i class="uil uil-bed-double text-2xl me-2 text-green-600 align-middle"></i>{{ listing.bedrooms }} Beds</span>
        <span class="text-slate-400"><i class="uil uil-bath text-2xl me-2 text-green-600 align-middle"></i>{{ listing.bathrooms }} Baths</span>
        <span class="text-slate-400"><i class="uil uil-ruler-combined text-2xl me-2 text-green-600 align-middle"></i>{{ listing.area }} sqm</span>
      </div>

      <div class="pt-6 border-t border-gray-100 dark:border-gray-700 flex items-center justify-between">
        <span class="text-slate-400"><i class="uil uil-map-marker text-2xl me-2 text-green-600 align-middle"></i>{{ listing.address }}</span>
        <span class="text-green-600 text-lg font-medium">${{ listing.price }}</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ListingCard',
  props: {
    listing: {
      type: Object,
      required: true,
    },
  },
};
</script>