<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    //use \App\Http\Traits\UsesUuid;

    protected $table = 'post';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function User()
    {
    	return $this->belongsTo('App\User', 'user_id', 'id');
    }

    public function PostTag()
    {
    	return $this->hasMany('App\PostTag', 'post_id', 'id');
    }

    public function Tag()
    {
        return $this->belongsToMany('App\Tag', 'post_tag');
    }

    public function PostCategory()
    {
    	return $this->hasMany('App\PostCategory', 'post_id', 'id');
    }

    public function Category()
    {
        return $this->belongsToMany('App\Category', 'post_category');
    }

    public function Comment()
    {
    	return $this->hasMany('App\Comment', 'post_id', 'id');
    }

}
