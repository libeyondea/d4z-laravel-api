<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PostTag extends Model
{
    protected $table = 'post_tag';
    protected $primaryKey = ['post_id', 'tag_id'];
    public $timestamps = false;
    public $incrementing = false;

    public function Post()
    {
    	return $this->belongsTo('App\Post', 'post_id', 'id');
    }

    public function Tag()
    {
    	return $this->belongsTo('App\Tag', 'tag_id', 'id');
    }
}
