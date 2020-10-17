<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    protected $table = 'tag';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function PostTag()
    {
    	return $this->hasMany('App\Models\PostTag', 'tag_id', 'id');
    }

    public function Post()
    {
        return $this->belongsToMany('App\Models\Post', 'post_tag');
    }
}
