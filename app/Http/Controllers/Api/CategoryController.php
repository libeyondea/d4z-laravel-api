<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\User;
use JWTAuth;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\RecursiveCategoryResource;

class CategoryController extends Controller
{
    public function fetchCategory()
    {
        $fetchCategory = CategoryResource::collection(Category::all());
        return response()->json(['success' => true, 'data' => $fetchCategory], 200);
    }

    public function fetchRecursiveCategory()
    {
        $fetchRecursiveCategory = RecursiveCategoryResource::collection(Category::whereNull('parent_id')
                                                            ->orderBY('created_at', 'desc')->get());
        return response()->json(['success' => true, 'data' => $fetchRecursiveCategory], 200);
    }
}
