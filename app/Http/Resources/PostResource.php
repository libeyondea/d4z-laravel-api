<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\PostTagResource;
use App\Http\Resources\PostCategoryResource;

class PostResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'user' => $this->user()->firstOrFail(),
            'parent_id' => $this->parent_id,
            'title' => $this->title,
            'meta_title' => $this->meta_title,
            'meta_description' => $this->meta_description,
            'slug' => $this->slug,
            'summary' => $this->summary,
            'image' => $this->image,
            'content' => $this->content,
            'published' => $this->published,
            'published_at' => $this->published_at,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'post_category' => PostCategoryResource::collection($this->postcategory()->get()),
            'post_tag' => PostTagResource::collection($this->posttag()->get())
        ];
    }
}
