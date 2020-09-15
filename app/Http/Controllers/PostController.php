<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\User;

class PostController extends Controller
{
    public function fetchPost()
    {
        $fetchPost = User::select('user.user_name', 'post.title', 'post.summary', 'post.created_at', 'post.slug', 'post.id')
                    ->join('post','post.user_id','user.id')
                    ->orderBY('created_at', 'desc')
                    ->get();
        return response()->json(['success' => true, 'data' => $fetchPost], 200);
    }

    public function createPost(Request $request)
    {
        $createPost = Post::create($request->all());
        return response()->json(['success' => true, 'data' => $createPost], 200);
    }

    public function detailPost($slug)
    {
        $post = User::select('post.user_id', 'user.user_name', 'post.title', 'post.summary', 'post.created_at', 'post.slug', 'post.id', 'post.content')
                    ->join('post','post.user_id','user.id')
                    ->where('slug', $slug)
                    ->firstOrFail();
        return response()->json(['success' => true, 'data' => $post], 200);
    }

    public function editPost($slug)
    {
        $post = User::select('user.user_name', 'post.title', 'post.summary', 'post.created_at', 'post.slug', 'post.id', 'post.content', 'post.meta_title', 'post.meta_description', 'post.image')
                    ->join('post','post.user_id','user.id')
                    ->where('slug', $slug)
                    ->firstOrFail();
        return response()->json(['success' => true, 'data' => $post], 200);
    }

    public function updatePost(Request $request, $slug)
    {
        $updatePost = Post::where('slug', $slug)->firstOrFail();
        $updatePost->update($request->all());
        $updatePost->save();

        return response()->json(['success' => true, 'data' => $updatePost], 200);
    }

    public function deletePost($slug)
    {
        $deletePost = Post::where('slug', $slug)->firstOrFail();
        $deletePost->delete();
        return response()->json(['success' => true, 'data' => $deletePost], 200);
    }
}
