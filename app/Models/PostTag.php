<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PostTag extends Model
{
    protected $table = 'post_tag';
    protected $primaryKey = ['post_id', 'tag_id'];
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function Post()
    {
    	return $this->belongsTo('App\Models\Post', 'post_id', 'id');
    }

    public function Tag()
    {
    	return $this->belongsTo('App\Models\Tag', 'tag_id', 'id');
    }
}
