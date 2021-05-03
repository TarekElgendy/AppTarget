<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Day extends Model
{

    protected $guarded = [];
    public function collections()
    {
        return $this->hasMany(Collection::class);
    } //end of collections.
}
