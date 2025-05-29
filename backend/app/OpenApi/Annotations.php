<?php

namespace App\OpenApi;

/**
 * @OA\Info(
 *     version="1.0.0",
 *     title="DreamDrealEstates API",
 *     description="API for managing property listings and user authentication",
 *     @OA\Contact(
 *         email="admin@example.com"
 *     )
 * )
 * @OA\Server(
 *     url="http://127.0.0.1:8000",
 *     description="Local API Server"
 * )
 * @OA\SecurityScheme(
 *     securityScheme="bearerAuth",
 *     type="http",
 *     scheme="bearer",
 *     bearerFormat="JWT"
 * )
 */
class Annotations
{
}