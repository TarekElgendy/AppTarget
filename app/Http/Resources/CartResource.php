<?php

namespace App\Http\Resources;

use App\Cart;
use App\CartDetail;
use App\Product;
use Illuminate\Http\Resources\Json\JsonResource;

class CartResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {


        return
            [
                'cart_item_id' => $this->id,
                'qty' => $this->qty,
                'type' => $this->type,
                //  'product_price' => $this->product->price,
                'total_price_items' => $this->TotalCart,
                'total_price_additions' => $this->SumCartDetails,
                'product' => new ProductResource(Product::where('id', $this->product_id)->first()),
                'product_addtions' => CartDetailsResource::collection($this->cart_detials),
            ];
    }
}
