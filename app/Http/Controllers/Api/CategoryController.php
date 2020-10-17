<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\User;
use JWTAuth;
use App\Http\Resources\CategoryResource;

class CategoryController extends Controller
{
    public function fetchCategory()
    {
        $fetchCategory = CategoryResource::collection(Category::all());
        return response()->json(['success' => true, 'data' => $fetchCategory], 200);
    }
}
