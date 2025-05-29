<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class AuthenticateWithCookie
{
    public function handle(Request $request, Closure $next)
    {
        // Check if token is in Authorization header
        if ($request->bearerToken()) {
            try {
                JWTAuth::parseToken()->authenticate();
                return $next($request);
            } catch (JWTException $e) {
            }
        }

        // Check for jwt cookie
        $token = $request->cookie('jwt');
        if ($token) {
            try {
                // Set token in JWTAuth for authentication
                JWTAuth::setToken($token);
                if ($user = JWTAuth::authenticate()) {
                    // Add user to request
                    $request->setUserResolver(function () use ($user) {
                        return $user;
                    });
                    return $next($request);
                }
            } catch (JWTException $e) {
                // Invalid token
                return response()->json(['error' => 'Unauthorized'], 401);
            }
        }

        return response()->json(['error' => 'Unauthorized'], 401);
    }
}