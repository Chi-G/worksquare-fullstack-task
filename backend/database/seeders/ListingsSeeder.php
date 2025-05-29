<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use App\Models\Listing;

class ListingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Load JSON data
        $jsonPath = storage_path('app/listings.json');
        if (!File::exists($jsonPath)) {
            throw new \Exception('listings.json not found in storage/app');
        }

        $listings = json_decode(File::get($jsonPath), true);

        foreach ($listings as $listing) {
            // Clean price: remove ₦, commas, and units (e.g., / week)
            $price = str_replace(['₦', ',', ' / week', ' / night'], '', $listing['price']);
            $price = floatval($price);

            // Extract type and status from status array
            $type = isset($listing['status'][0]) ? strtolower($listing['status'][0]) : 'unknown';
            $status = isset($listing['status'][1]) ? strtolower(str_replace('For ', '', $listing['status'][1])) : 'rent';

            Listing::create([
                'title' => $listing['title'],
                'type' => $type,
                'location' => $listing['location'],
                'price' => $price,
                'bedrooms' => $listing['bedrooms'],
                'bathrooms' => $listing['bathrooms'],
                'status' => json_encode([
                    'type' => $type,
                    'status' => $status
                ]),
                'image' => '/assets/images/' . $listing['image'],
                'description' => $listing['description'] ?? 'A beautiful property located in ' . $listing['location'],
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
