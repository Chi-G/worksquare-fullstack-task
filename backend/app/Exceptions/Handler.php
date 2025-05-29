<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Illuminate\Http\JsonResponse;

class Handler extends ExceptionHandler
{
    public function render($request, Throwable $exception)
    {
        if ($request->expectsJson()) {
            $status = method_exists($exception, 'getStatusCode') ? $exception->getStatusCode() : 500;
            return new JsonResponse([
                'error' => $exception->getMessage() ?: 'An unexpected error occurred',
            ], $status);
        }

        return parent::render($request, $exception);
    }
}