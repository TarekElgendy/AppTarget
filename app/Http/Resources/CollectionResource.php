<?php

namespace App\Http\Resources;

use App\CollectionProduct;
use App\Product;
use App\Program;
use Illuminate\Http\Resources\Json\JsonResource;

class CollectionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //collections
     //   $CollectionProduct =   CollectionProduct::where('collection_id', $this->id)->pluck('product_id');
        return [

            'id' => $this->id,
            'isBreakfast' => $this->isBreakfast,
            'isDinner' => $this->isDinner,
            'isLaunch' => $this->isLaunch,
            'numberSnaks' => $this->numberSnaks,
            'day_id' => $this->day_id ,
            'days' => $this->day->day,
            'dayOff' => $this->day->dayOff,
            'image' => $this->image_path,
            'title' => $this->title,
            'price' => $this->price,
            'description' => $this->description,
          //  'program_id' => ProgramResource::collection(Program::where('id', $this->program_id)->get()),

          //  'products' => ProductResource::collection(Product::whereIn('id', $CollectionProduct)->get()),

        ];
    }
}
