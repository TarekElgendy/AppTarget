<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Dinner extends Model
{
    use \Dimsav\Translatable\Translatable;
    protected $guarded = [];

    public $translatedAttributes = ['title', 'description', 'short_description',];
    protected $appends = ['image_path'];

    public function getImagePathAttribute()
    {
        return asset('uploads/dinner/' . $this->image);
    } //end of image path attribute
}
