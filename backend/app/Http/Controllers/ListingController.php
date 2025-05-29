<?php

namespace App\Http\Controllers;

use App\Models\Listing;
use Illuminate\Http\Request;
use Illuminate\Http\Response;


class ListingController extends Controller
{

    public function index(Request $request)
    {
        $listings = Listing::paginate(10);
        return response()->json($listings, Response::HTTP_OK);
    }

    public function show($id)
    {
        $listing = Listing::find($id);

        if (!$listing) {
            return response()->json(['message' => 'Listing not found'], Response::HTTP_NOT_FOUND);
        }

        return response()->json($listing, Response::HTTP_OK);
    }

    public function filter(Request $request)
    {
        $query = Listing::query();

        if ($request->filled('location')) {
            $query->where('location', 'like', '%' . $request->location . '%');
        }

        if ($request->filled('title')) {
            $query->where('title', 'like', '%' . $request->title . '%');
        }

        if ($request->filled('status')) {
            $query->whereJsonContains('status', $request->status);
        }

        if ($request->filled('type')) {
            $query->whereJsonContains('status', $request->type);
        }

        if ($request->filled('min_price') && $request->filled('max_price')) {
            $query->whereBetween('price', [$request->min_price, $request->max_price]);
        } elseif ($request->filled('min_price')) {
            $query->where('price', '>=', $request->min_price);
        } elseif ($request->filled('max_price')) {
            $query->where('price', '<=', $request->max_price);
        }

        if ($request->filled('bedrooms')) {
            $query->where('bedrooms', $request->bedrooms);
        }

        $listings = $query->paginate(10);
        return response()->json($listings, Response::HTTP_OK);
    }
}