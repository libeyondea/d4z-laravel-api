<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\TagResource;
use App\PostTag;
use App\Tag;

class PostTagResource extends JsonResource
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
            'post_id' => $this->post_id,
            'tag_id' => $this->tag_id,
            'tag' => $this->tag()->firstOrFail()
            //'tag' => new TagResource($this->tag()->firstOrFail())
        ];
    }
}
