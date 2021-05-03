<?php

namespace App\Http\Resources;

use App\Collection;
use Illuminate\Http\Resources\Json\JsonResource;

class PromoResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
   

    public function toArray($request)
    {
       $collection= Collection::where('id',$request->collection_id)->first();
        return [
            'code' => $this->code,
            'total' =>$collection->price,
            'discount' => $this->discount($collection->price),
            'totalWithPromo' => $this->subtotal($collection->price),
            // 'totalWithPromo' => $this->subtotal(sum_cart(authCustomerApi()->id)),
            // 'totalWithPromo' =>Collection::where('id',$request->collection_id)->first(),
        ];
    }
}
