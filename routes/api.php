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
    Route::get('posts/{slug}/edit', 'PostController@editPost');
    Route::put('posts/{slug}', 'PostController@updatePost');
    Route::delete('posts/{slug}', 'PostController@deletePost');


    Route::get('me', function(Request $request){
        $user = JWTAuth::toUser($request->token);
        return response()->json(['user' => $user]);
    });
});

Route::group(['middleware' => 'api-header'], function () {
    // The registration and login requests doesn't come with tokens
    // as users at that point have not been authenticated yet
    // Therefore the jwtMiddleware will be exclusive of them
    Route::post('users/login', 'AuthController@login');
    Route::post('users/register', 'AuthController@register');
    // Posts
    Route::get('posts', 'PostController@fetchPost');
    Route::get('posts/{slug}', 'PostController@detailPost');
    // Tags
    Route::get('tags', 'TagController@fetchTag');
    // Categories
    Route::get('categories', 'CategoryController@fetchCategory');
});
