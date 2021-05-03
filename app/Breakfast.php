<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Breakfast extends Model
{
    use \Dimsav\Translatable\Translatable;
    protected $guarded = [];

    public $translatedAttributes = ['title', 'description', 'short_description',];
    protected $appends = ['image_path'];

    public function getImagePathAttribute()
    {
        return asset('uploads/breakfast/' . $this->image);
    } //end of image path attribute
}
