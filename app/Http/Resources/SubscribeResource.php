<?php

namespace App\Http\Resources;

use App\ChooseMeal;
use App\Collection;
use Illuminate\Http\Resources\Json\JsonResource;

class SubscribeResource extends JsonResource
{
 
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request   PieceResource
     * @return array
     */
    public function toArray($request)
    {
        return [

            'id' => $this->id,
            'code' => $this->code,
            'total' => $this->total,
            'totalWithDiscount' => $this->totalWithDiscount,
            'subcribe_date' => $this->subcribe_date,
            'start_programe_date' => $this->start_programe_date,
            'end_programe_date' => $this->end_programe_date,
          //  'collection_id' => $this->collection_id,
            'collectionData' => new CollectionResource(Collection::where('id', $this->collection_id)->first()),
            'choosedMeals' =>ChooseMailResource::collection(ChooseMeal::where('subscribe_id', $this->id)->get()),


        ];
    }
}
