<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Post;
use App\Models\PostTag;
use App\Models\Tag;
use App\Models\PostCategory;
use App\Models\Category;
use App\Models\User;
use JWTAuth;
use Carbon\Carbon;
use App\Http\Resources\PostResource;
use App\Http\Resources\PostCollection;

class PostController extends Controller
{
    public function fetchPost(Request $request)
    {
        $per_page = (int) $request->per_page;
        $fetchPost = new PostCollection(Post::paginate($per_page));
        return response()->json($fetchPost, 200);
    }

    public function fetchTrendingPost(Request $request)
    {
        $per_page = (int) $request->per_page;
        $fetchTrendinghPost = new PostCollection(Post::paginate($per_page));
        return response()->json($fetchTrendinghPost, 200);
    }

    public function createPost(Request $request)
    {
        $mytime = Carbon::now();
        $user = JWTAuth::toUser($request->token);
        if($user->Role()->firstOrFail()->slug == 'admin') {
            $published = '1';
            $published_at = $mytime->toDateTimeString();
        } else {
            $published = '0';
            $published_at = null;
        }
        $rules = [
            'slug' => ['unique:post'],
        ];
        $messages = [
            'slug.unique' => 'Slug already exists',
        ];
        $payload = [
            'id' => $request->id,
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
        $validator = Validator::make($payload, $rules, $messages);
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errorMessage' => $validator->errors()
            ], 200);
        }
        $createPost = new Post($payload);
        $createPost->save();
        $lastIdPost = $createPost->id;
        foreach ($request->tag as $key => $tag) {
            //$tagCheck = Tag::where('slug', $tag['slug'])->first();
            if (isset($tag['__isNew__'])) {
                if ($tag['__isNew__'] === true) {
                    $newTag = new Tag;
                    $newTag->id = $tag['id'];
                    $newTag->title = $tag['title'];
                    $newTag->meta_title = $tag['meta_title'];
                    $newTag->meta_description = $tag['meta_description'];
                    $newTag->slug = $tag['slug'];
                    $newTag->content = $tag['content'];
                    $newTag->save();
                }
            }
            $tagCheckId = Tag::where('id', $tag['id'])->first();
            if ($tagCheckId !== null) {
                $postTag = new PostTag;
                $postTag->post_id = $lastIdPost;
                $postTag->tag_id = $tag['id'];
                $postTag->save();
            }
        }
        foreach ($request->category as $key => $category) {
            $postCategory = new PostCategory;
            $postCategory->post_id = $lastIdPost;
            $postCategory->category_id = $category['id'];
            $postCategory->save();
        }
        return response()->json([
            'success' => true,
            'data' => [$createPost, $postTag, $postCategory]
        ], 200);
    }

    public function detailPost($id)
    {
        $post = new PostResource(Post::where('id', $id)->firstOrFail());
        return response()->json(['success' => true, 'data' => $post], 200);
    }

    public function editPost(Request $request, $id)
    {
        $user = JWTAuth::toUser($request->token);
        $post = new PostResource(Post::where('id', $id)->firstOrFail());
        if($user->Role()->firstOrFail()->slug == 'admin' || $post->user_id == $user->id) {
            return response()->json(['success' => true, 'data' => $post], 200);
        } else {
            return response()->json(['errors' => 'Unauthorized'], 401);
        }
    }

    public function updatePost(Request $request, $id)
    {
        $user = JWTAuth::toUser($request->token);
        $updatePost = Post::where('id', $id)->firstOrFail();
        if($user->Role()->firstOrFail()->slug == 'admin' || $updatePost->user_id == $user->id) {
            $rules = [
                'slug' => 'unique:post,slug,'.$id,
            ];
            $messages = [
                'slug.unique' => 'Slug already exists',
            ];
            $payload = [
                'title' => $request->title,
                'meta_title' => $request->meta_title,
                'meta_description' => $request->meta_description,
                'slug' => $request->slug,
                'summary' => $request->summary,
                'content' => $request->content,
                'image' => $request->image
            ];
            $validator = Validator::make($payload, $rules, $messages);
            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'errorMessage' => $validator->errors()
                ], 200);
            }
            $updatePost->update($payload);
            $updatePost->save();

            $idPost = $updatePost->id;
            $deletePostTag = PostTag::where('post_id', $idPost);
            if ($deletePostTag->get()->count() > 0) {
                $deletePostTag->delete();
            }
            foreach ($request->tag as $key => $tag) {
                if (isset($tag['__isNew__'])) {
                    if ($tag['__isNew__'] === true) {
                        $newTag = new Tag;
                        $newTag->id = $tag['id'];
                        $newTag->title = $tag['title'];
                        $newTag->meta_title = $tag['meta_title'];
                        $newTag->meta_description = $tag['meta_description'];
                        $newTag->slug = $tag['slug'];
                        $newTag->content = $tag['content'];
                        $newTag->save();
                    }
                }
                $tagCheckId = Tag::where('id', $tag['id'])->first();
                if ($tagCheckId !== null) {
                    $postTag = new PostTag;
                    $postTag->post_id = $idPost;
                    $postTag->tag_id = $tag['id'];
                    $postTag->save();
                }
            }

            $deletePostCategory = PostCategory::where('post_id', $idPost);
            if ($deletePostTag->get()->count() > 0) {
                $deletePostCategory->delete();
            }
            foreach ($request->category as $key => $category) {
                $postCategory = new PostCategory;
                $postCategory->post_id = $idPost;
                $postCategory->category_id = $category['id'];
                $postCategory->save();
            }
            return response()->json([
                'success' => true,
                'data' => [$updatePost, $postTag, $postCategory]
            ], 200);
        } else {
            return response()->json(['errors' => 'Unauthorized'], 401);
        }
    }

    public function deletePost(Request $request, $id)
    {
        $user = JWTAuth::toUser($request->token);
        $deletePost = Post::where('id', $id)->firstOrFail();
        if($user->Role()->firstOrFail()->slug == 'admin' || $deletePost->user_id == $user->id) {
            $deletePost->delete();
            return response()->json(['success' => true, 'data' => $deletePost], 200);
        } else {
            return response()->json(['errors' => 'Unauthorized'], 401);
        }
    }
}
