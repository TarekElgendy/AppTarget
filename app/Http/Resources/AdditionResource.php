<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class AdditionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        /*
        title_en
        title_ar
        price_addtion
        \
        */
        return [

            'id' => $this->id,
            'title' => $this->title_ar,
            'price' => $this->Total,
            'currency' => __('site.' . currncy()),
        ];
    }
}
