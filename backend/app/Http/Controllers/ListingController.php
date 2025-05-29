<?php

namespace App\Http\Controllers;

use App\Models\Listing;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Validation\ValidationException;

/**
 * @OA\Tag(
 *     name="listings",
 *     description="API endpoints for managing property listings"
 * )
 */
class ListingController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/listings",
     *     operationId="getListings",
     *     tags={"listings"},
     *     summary="Get paginated listings",
     *     description="Returns a paginated list of listings",
     *     security={{"bearerAuth":{}}},
     *     @OA\Parameter(
     *         name="page",
     *         in="query",
     *         description="Page number",
     *         @OA\Schema(type="integer"),
     *         example=1
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Paginated listings",
     *         @OA\JsonContent(
     *             @OA\Property(
     *                 property="data",
     *                 type="array",
     *                 @OA\Items(
     *                     type="object",
     *                     @OA\Property(property="id", type="integer"),
     *                     @OA\Property(property="title", type="string"),
     *                     @OA\Property(property="type", type="string"),
     *                     @OA\Property(property="location", type="string"),
     *                     @OA\Property(property="price", type="number"),
     *                     @OA\Property(property="bedrooms", type="integer"),
     *                     @OA\Property(property="bathrooms", type="integer"),
     *                     @OA\Property(property="status", type="string"),
     *                     @OA\Property(property="image", type="string"),
     *                     @OA\Property(property="description", type="string")
     *                 )
     *             ),
     *             @OA\Property(property="current_page", type="integer"),
     *             @OA\Property(property="per_page", type="integer"),
     *             @OA\Property(property="total", type="integer")
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Unauthorized",
     *         @OA\JsonContent(
     *             @OA\Property(property="error", type="string")
     *         )
     *     )
     * )
     */
    public function index(Request $request)
    {
        try {
            $listings = Listing::paginate(10);
            return response()->json($listings, Response::HTTP_OK);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Failed to fetch listings',
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * @OA\Get(
     *     path="/api/listings/{id}",
     *     operationId="getListing",
     *     tags={"listings"},
     *     summary="Get a single listing",
     *     description="Returns a listing by ID",
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="Listing ID",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Listing details",
     *         @OA\JsonContent(
     *             @OA\Property(property="id", type="integer"),
     *             @OA\Property(property="title", type="string"),
     *             @OA\Property(property="type", type="string"),
     *             @OA\Property(property="location", type="string"),
     *             @OA\Property(property="price", type="number"),
     *             @OA\Property(property="bedrooms", type="integer"),
     *             @OA\Property(property="bathrooms", type="integer"),
     *             @OA\Property(property="status", type="string"),
     *             @OA\Property(property="image", type="string"),
     *             @OA\Property(property="description", type="string")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Listing not found",
     *         @OA\JsonContent(
     *             @OA\Property(property="error", type="string")
     *         )
     *     )
     * )
     */
    public function show($id)
    {
        try {
            $listing = Listing::findOrFail($id);
            return response()->json($listing, Response::HTTP_OK);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json([
                'error' => 'Listing not found',
            ], Response::HTTP_NOT_FOUND);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Failed to fetch listing',
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * @OA\Get(
     *     path="/api/listings/filter",
     *     operationId="filterListings",
     *     tags={"listings"},
     *     summary="Filter listings",
     *     description="Filters listings by location, type, status, price, and bedrooms",
     *     @OA\Parameter(
     *         name="location",
     *         in="query",
     *         description="Location filter",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="type",
     *         in="query",
     *         description="Property type (e.g., house, flat, terrace, penthouse, mansion, apartment, short let, duplex)",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="status",
     *         in="query",
     *         description="Listing status (e.g., rent, lease, shortlet)",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="min_price",
     *         in="query",
     *         description="Minimum price",
     *         @OA\Schema(type="number")
     *     ),
     *     @OA\Parameter(
     *         name="max_price",
     *         in="query",
     *         description="Maximum price",
     *         @OA\Schema(type="number")
     *     ),
     *     @OA\Parameter(
     *         name="bedrooms",
     *         in="query",
     *         description="Number of bedrooms",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Filtered listings",
     *         @OA\JsonContent(
     *             @OA\Property(
     *                 property="data",
     *                 type="array",
     *                 @OA\Items(
     *                     type="object",
     *                     @OA\Property(property="id", type="integer"),
     *                     @OA\Property(property="title", type="string"),
     *                     @OA\Property(property="type", type="string"),
     *                     @OA\Property(property="location", type="string"),
     *                     @OA\Property(property="price", type="number"),
     *                     @OA\Property(property="bedrooms", type="integer"),
     *                     @OA\Property(property="bathrooms", type="integer"),
     *                     @OA\Property(property="status", type="string"),
     *                     @OA\Property(property="image", type="string"),
     *                     @OA\Property(property="description", type="string")
     *                 )
     *             ),
     *             @OA\Property(property="current_page", type="integer"),
     *             @OA\Property(property="per_page", type="integer"),
     *             @OA\Property(property="total", type="integer")
     *         )
     *     ),
     *     @OA\Response(
     *         response=422,
     *         description="Validation error",
     *         @OA\JsonContent(
     *             @OA\Property(property="error", type="object")
     *         )
     *     )
     * )
     */
    public function filter(Request $request)
    {
        try {
            $validated = $request->validate([
                'location' => 'nullable|string|max:255',
                'type' => 'nullable|string|in:house,flat,terrace,penthouse,mansion,apartment,short let,duplex',
                'status' => 'nullable|string|in:rent,lease,shortlet',
                'min_price' => 'nullable|numeric|min:0',
                'max_price' => 'nullable|numeric|min:0',
                'bedrooms' => 'nullable|integer|min:0',
            ]);

            $query = Listing::query();

            if ($request->filled('location')) {
                $query->location($validated['location']);
            }

            if ($request->filled('type')) {
                $query->type($validated['type']);
            }

            if ($request->filled('status')) {
                $query->listingStatus($validated['status']);
            }

            if ($request->filled('min_price') && $request->filled('max_price')) {
                $query->priceRange($validated['min_price'], $validated['max_price']);
            } elseif ($request->filled('min_price')) {
                $query->where('price', '>=', $validated['min_price']);
            } elseif ($request->filled('max_price')) {
                $query->where('price', '<=', $validated['max_price']);
            }

            if ($request->filled('bedrooms')) {
                $query->bedrooms($validated['bedrooms']);
            }

            $listings = $query->paginate(10);
            return response()->json($listings, Response::HTTP_OK);
        } catch (ValidationException $e) {
            return response()->json([
                'error' => $e->errors(),
            ], Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Failed to filter listings',
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}