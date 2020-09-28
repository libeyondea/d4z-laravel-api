<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\PostTagResource;
use App\Http\Resources\PostCategoryResource;

class CommentResource extends JsonResource
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
            'post_id' => $this->post_id,
            'user' => $this->user()->firstOrFail(),
            'parent_id' => $this->parent_id,
            'content' => $this->content,
            'published' => $this->published,
            'published_at' => $this->published_at,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'children_comment' =>  CommentResource::collection($this->ChildrenComment()->orderBY('created_at', 'desc')->get())
        ];
    }
}
