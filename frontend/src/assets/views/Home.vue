<script>
import { getListings } from '@/services/api';

export default {
  data() {
    return {
      listings: [],
      loading: false,
    };
  },
  async mounted() {
    this.loading = true;
    try {
      const response = await getListings();
      this.listings = response.data.data;
    } catch (error) {
      console.error('Error fetching listings:', error);
    } finally {
      this.loading = false;
    }
  },
};
</script>