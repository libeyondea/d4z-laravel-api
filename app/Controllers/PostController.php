<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\PostTag;
use App\Tag;
use App\User;
use JWTAuth;
use Carbon\Carbon;
use App\Http\Resources\PostResource;
use App\Http\Resources\PostCollection;

class PostController extends Controller
{
    public function fetchPost()
    {
        $fetchPost = User::select('user.user_name', 'post.title', 'post.summary', 'post.created_at', 'post.slug', 'post.id')
                    ->join('post','post.user_id','user.id')
                    ->orderBY('created_at', 'desc')
                    ->paginate(66);
        return response()->json(['success' => true, 'data' => $fetchPost], 200);
    }

    public function createPost(Request $request)
    {
        $mytime = Carbon::now();
        $user = JWTAuth::toUser($request->token);
        if($user->role_id == 1) {
            $published = '1';
            $published_at = $mytime->toDateTimeString();
        } else {
            $published = '0';
            $published_at = '';
        }
        $payload = [
            'title' => $request->title,
            'meta_title' => $request->meta_title,
            'meta_description' => $request->meta_description,
            'slug' => $request->slug,
            'summary' => $request->summary,
            'content' => $request->content,
            'image' => $request->image,
            'published' => $published,
            'published_at' => $published_at,
            'user_id' => $user->id,
        ];
        $createPost = new Post($payload);
        $createPost->save();
        $lastIdPost = $createPost->id;
        foreach ($request->tag as $key => $tag) {
            $post_tag = new PostTag;
            $post_tag->post_id = $lastIdPost;
            $post_tag->tag_id = $tag['id'];
            $post_tag->save();
        }
        return response()->json([
            'success' => true,
            'data' => [$createPost, $post_tag]
        ], 200);
    }

    public function detailPost($slug)
    {
        $post = User::select('post.user_id', 'user.user_name', 'post.title', 'post.summary', 'post.created_at', 'post.slug', 'post.id', 'post.content')
                    ->join('post','post.user_id','user.id')
                    ->where('slug', $slug)
                    ->firstOrFail();
        return response()->json(['success' => true, 'data' => $post], 200);
    }

    public function editPost(Request $request, $slug)
    {
        $user = JWTAuth::toUser($request->token);
        //$post = User::select('post.user_id', 'user.user_name', 'post.title', 'post.summary', 'post.created_at', 'post.slug', 'post.id', 'post.content', 'post.meta_title', 'post.meta_description', 'post.image')
        //            ->join('post','post.user_id','user.id')
        //            ->where('slug', $slug)
        //            ->firstOrFail();
        //$tag = Tag::select('tag.title', 'post_tag.tag_id')
        //            ->join('post_tag','post_tag.tag_id','tag.id')
        //            ->where('post_tag.post_id', $post->id)->get();

        $post = new PostResource(Post::where('slug', $slug)->firstOrFail());
        if($user->role_id == 1 || $post->user_id == $user->id) {
            return response()->json(['success' => true, 'data' => $post], 200);
        } else {
            return response()->json(['errors' => 'Unauthorized'], 401);
        }
    }

    public function updatePost(Request $request, $slug)
    {
        $user = JWTAuth::toUser($request->token);
        $updatePost = Post::where('slug', $slug)->firstOrFail();
        if($user->role_id == 1 || $updatePost->user_id == $user->id) {
            $updatePost->update($request->all());
            $updatePost->save();
        return response()->json(['success' => true, 'data' => $updatePost], 200);
        } else {
            return response()->json(['errors' => 'Unauthorized'], 401);
        }
    }

    public function deletePost(Request $request, $slug)
    {
        $user = JWTAuth::toUser($request->token);
        $deletePost = Post::where('slug', $slug)->firstOrFail();
        if($user->role_id == 1 || $deletePost->user_id == $user->id) {
            $deletePost->delete();
            return response()->json(['success' => true, 'data' => $deletePost], 200);
        } else {
            return response()->json(['errors' => 'Unauthorized'], 401);
        }
    }
}
