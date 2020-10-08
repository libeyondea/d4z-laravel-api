<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RolePermission extends Model
{
    protected $table = 'role_permission';
    protected $primaryKey = ['role_id', 'permission_id'];
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function Role()
    {
    	return $this->belongsTo('App\Role', 'role_id', 'id');
    }

    public function Permission()
    {
    	return $this->belongsTo('App\Permission', 'permission_id', 'id');
    }
}
