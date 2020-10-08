<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\User;
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

Route::middleware('auth:api')->get('users', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => ['jwt.auth', 'api-header']], function () {
    // all routes to protected resources are registered here
    Route::post('posts', 'PostController@createPost');
    Route::get('posts/{id}/edit', 'PostController@editPost');
    Route::put('posts/{id}', 'PostController@updatePost');
    Route::delete('posts/{id}', 'PostController@deletePost');
    // Comment
    Route::post('comments/{id}', 'CommentController@createComment');
    Route::post('comments/reply/{id}', 'CommentController@createReplyComment');
});

Route::group(['middleware' => 'api-header'], function () {
    // The registration and login requests doesn't come with tokens
    // as users at that point have not been authenticated yet
    // Therefore the jwtMiddleware will be exclusive of them
    Route::post('users/login', 'AuthController@login');
    Route::post('users/register', 'AuthController@register');
    // Posts
    Route::get('posts', 'PostController@fetchPost');
    Route::get('posts/{id}', 'PostController@detailPost');
    // Tags
    Route::get('tags', 'TagController@fetchTag');
    // Categories
    Route::get('categories', 'CategoryController@fetchCategory');
    // Comments
    Route::get('comments/{id}', 'CommentController@fetchComment');
    // Users
    Route::get('users', 'AuthController@fetchUser');
    Route::get('users/{id}/{user_name}', 'AuthController@singleUser');
});
