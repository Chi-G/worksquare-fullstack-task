<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class ListingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $listings = json_decode(File::get(storage_path('app/listings.json')), true);

        foreach ($listings as $listing) {
            // Convert price from string to decimal (remove currency symbol and commas)
            $price = str_replace(['₦', ','], '', $listing['price']);

            DB::table('listings')->insert([
                'title' => $listing['title'],
                'location' => $listing['location'],
                'price' => (float) $price,
                'bedrooms' => $listing['bedrooms'],
                'bathrooms' => $listing['bathrooms'],
                'status' => json_encode($listing['status']),
                'image' => $listing['image'],
                'description' => $listing['description'] ?? null,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
