<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $table = 'role';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function RolePermission()
    {
    	return $this->hasMany('App\RolePermission', 'role_id', 'id');
    }

    public function Permission()
    {
        return $this->belongsToMany('App\Permission', 'role_permission');
    }

    public function User()
    {
    	return $this->hasMany('App\User', 'role_id', 'id');
    }
}
