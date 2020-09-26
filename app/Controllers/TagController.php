<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tag;
use App\User;
use JWTAuth;
use Carbon\Carbon;

class TagController extends Controller
{
    public function fetchTagForm()
    {
        $fetchTagForm = Tag::select('id', 'title')->get();
        return response()->json(['success' => true, 'data' => $fetchTagForm], 200);
    }
}
