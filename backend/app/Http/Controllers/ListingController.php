<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Listing;

/**
 * @OA\Info(
 *     version="1.0.0",
 *     title="Listing API Documentation",
 *     description="API documentation for the Listing endpoints"
 * )
 */
class ListingController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/listings",
     *     summary="Get all listings",
     *     tags={"Listings"},
     *     security={{"bearerAuth":{}}},
     *     @OA\Response(
     *         response=200,
     *         description="List of listings retrieved successfully",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(
     *                 type="object",
     *                 @OA\Property(property="id", type="integer"),
     *                 @OA\Property(property="title", type="string"),
     *                 @OA\Property(property="description", type="string")
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Unauthenticated"
     *     )
     * )
     */
    public function index(Request $request)
    {
        return Listing::paginate(10);
    }

    /**
     * @OA\Get(
     *     path="/api/listings/{id}",
     *     summary="Get a specific listing",
     *     tags={"Listings"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="Listing ID",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Listing retrieved successfully",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="id", type="integer"),
     *             @OA\Property(property="title", type="string"),
     *             @OA\Property(property="description", type="string")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Listing not found"
     *     )
     * )
     */
    public function show($id)
    {
        $listing = Listing::findOrFail($id);
        return response()->json($listing);
    }

    /**
     * @OA\Get(
     *     path="/api/listings/filter",
     *     summary="Filter listings",
     *     tags={"Listings"},
     *     @OA\Parameter(
     *         name="search",
     *         in="query",
     *         required=false,
     *         description="Search term",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Filtered listings retrieved successfully",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(
     *                 type="object",
     *                 @OA\Property(property="id", type="integer"),
     *                 @OA\Property(property="title", type="string"),
     *                 @OA\Property(property="description", type="string")
     *             )
     *         )
     *     )
     * )
     */
    public function filter(Request $request)
    {
        $query = Listing::query();

        if ($request->has('location')) {
            $query->where('location', $request->location);
        }

        if ($request->has('type')) {
            $query->where('type', $request->type);
        }

        return $query->paginate(10);
    }
}
