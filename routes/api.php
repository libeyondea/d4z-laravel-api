<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\TagController;
use App\Http\Controllers\Api\CommentController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => ['jwt.auth', 'api-header']], function () {
    // all routes to protected resources are registered here
    Route::post('posts', [PostController::class, 'createPost']);
    Route::get('posts/{id}/edit', [PostController::class, 'editPost']);
    Route::put('posts/{id}', [PostController::class, 'updatePost']);
    Route::delete('posts/{id}', [PostController::class, 'deletePost']);
    // Comment
    Route::post('comments/{id}', [CommentController::class, 'createComment']);
    Route::post('comments/reply/{id}', [CommentController::class, 'createReplyComment']);
});

Route::group(['middleware' => 'api-header'], function () {
    // The registration and login requests doesn't come with tokens
    // as users at that point have not been authenticated yet
    // Therefore the jwtMiddleware will be exclusive of them
    Route::post('users/login', [AuthController::class, 'login']);
    Route::post('users/register', [AuthController::class, 'register']);
    // Posts
    Route::get('posts', [PostController::class, 'fetchPost']);
    Route::get('posts/{id}', [PostController::class, 'detailPost']);
    // Tags
    Route::get('tags', [TagController::class, 'fetchTag']);
    Route::get('tags/{id}', [TagController::class, 'singleTag']);
    // Categories
    Route::get('categories', [CategoryController::class, 'fetchCategory']);
    Route::get('recursive-categories', [CategoryController::class, 'fetchRecursiveCategory']);
    Route::get('categories/{id}', [CategoryController::class, 'singleCategory']);
    // Comments
    Route::get('comments/{id}', [CommentController::class, 'fetchComment']);
    // Users
    Route::get('users', [AuthController::class, 'fetchUser']);
    Route::get('users/{id}/{user_name}', [AuthController::class, 'singleUser']);
});
