<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'category';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function PostCategory()
    {
    	return $this->hasMany('App\Models\PostCategory', 'category_id', 'id');
    }

    public function Post()
    {
        return $this->belongsToMany('App\Models\Post', 'post_category');
    }
}
