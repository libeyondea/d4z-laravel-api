<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Symfony\Component\HttpKernel\Exception\UnauthorizedHttpException;
use Throwable;
use Exception;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    public function render($request, Throwable $exception)
    {
        if ($exception instanceof UnauthorizedHttpException) {
            $case = $exception->getPrevious() ? get_class($exception->getPrevious()) : null;
            switch ($case) {
                case \Tymon\JWTAuth\Exceptions\TokenExpiredException::class:
                    return response()->json([
                        'success' => false,
                        'code'    => $exception->getStatusCode(),
                        'errorMessage' => trans('token_expried'),
                    ], 200);
                case \Tymon\JWTAuth\Exceptions\TokenInvalidException::class:
                    return response()->json([
                        'success' => false,
                        'code'    => $exception->getStatusCode(),
                        'errorMessage' => trans('token_invalid'),
                    ], 200);
                case \Tymon\JWTAuth\Exceptions\TokenBlacklistedException::class:
                    return response()->json([
                        'success' => false,
                        'code'    => $exception->getStatusCode(),
                        'errorMessage' => trans('token_black_listed'),
                    ], 200);
                default:
                    return response()->json([
                        'success' => false,
                        'token' => $request->token,
                        'code'    => $exception->getStatusCode(),
                        'errorMessage' => trans('token_not_found'),
                    ], 200);
            }
        }
        return parent::render($request, $exception);
    }
}
