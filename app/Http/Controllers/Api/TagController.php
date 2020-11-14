<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Tag;
use JWTAuth;
use App\Http\Resources\TagResource;
use App\Http\Resources\TagCollection;

class TagController extends Controller
{
    public function fetchTag()
    {
        $fetchTag = new TagCollection(Tag::orderBY('created_at', 'desc')->get());
        return response()->json(['success' => true, 'data' => $fetchTag], 200);
    }

    public function singleTag($id) {
        $singleTag = new TagResource(Tag::where('id', $id)->firstOrFail());
        return response()->json(['success' => true, 'data' => $singleTag], 200);
    }
}
