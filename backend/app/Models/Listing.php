<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Listing extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'title',
        'type',
        'location',
        'price',
        'bedrooms',
        'bathrooms',
        'status',
        'image',
        'description',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'price' => 'decimal:2',
        'bedrooms' => 'integer',
        'bathrooms' => 'integer',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Scope a query to filter by location.
     */
    public function scopeLocation($query, $location)
    {
        return $query->where('location', 'like', '%' . $location . '%');
    }

    /**
     * Scope a query to filter by property type.
     */
    public function scopeType($query, $type)
    {
        return $query->where('type', $type);
    }

    /**
     * Scope a query to filter by listing status.
     */
    public function scopeListingStatus($query, $status)
    {
        return $query->where('status', $status);
    }

    /**
     * Scope a query to filter by price range.
     */
    public function scopePriceRange($query, $min, $max)
    {
        return $query->whereBetween('price', [$min, $max]);
    }

    /**
     * Scope a query to filter by number of bedrooms.
     */
    public function scopeBedrooms($query, $bedrooms)
    {
        return $query->where('bedrooms', $bedrooms);
    }
}