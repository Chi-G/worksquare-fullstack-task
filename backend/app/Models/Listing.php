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
        'status' => 'array',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Scope a query to filter by location.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  string  $location
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeLocation($query, $location)
    {
        return $query->where('location', $location);
    }

    /**
     * Scope a query to filter by property type.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  string  $type
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeType($query, $type)
    {
        return $query->whereJsonContains('status', $type);
    }

    /**
     * Scope a query to filter by listing status (For Rent, For Lease, etc).
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  string  $status
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeListingStatus($query, $status)
    {
        return $query->whereJsonContains('status', $status);
    }

    /**
     * Scope a query to filter by price range.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  float  $min
     * @param  float  $max
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopePriceRange($query, $min, $max)
    {
        return $query->whereBetween('price', [$min, $max]);
    }

    /**
     * Scope a query to filter by number of bedrooms.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  int  $bedrooms
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeBedrooms($query, $bedrooms)
    {
        return $query->where('bedrooms', $bedrooms);
    }
}
