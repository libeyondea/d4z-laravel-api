<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PostCategory extends Model
{
    protected $table = 'post_category';
    protected $primaryKey = ['post_id', 'category_id'];
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function Post()
    {
    	return $this->belongsTo('App\Models\Post', 'post_id', 'id');
    }

    public function Category()
    {
    	return $this->belongsTo('App\Models\Category', 'category_id', 'id');
    }
}
