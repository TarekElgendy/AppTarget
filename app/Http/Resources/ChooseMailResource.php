<?php

namespace App\Http\Resources;

use App\Breakfast;
use App\Dinner;
use App\Launch;
use App\Snack;
use Illuminate\Http\Resources\Json\JsonResource;

class ChooseMailResource extends JsonResource
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
            'date' => $this->date,
            'breakfast_id' =>  new BreakfastResource(Breakfast::where('id', $this->breakfast_id)->first()), 
            'breakfastNotes' => $this->breakfastNotes,
            'dinner_id' =>  new DinnerResource(Dinner::where('id', $this->dinner_id)->first()), 
            'dinnerNotes' => $this->dinnerNotes,
            'launche_id' => new LaunchResource(Launch::where('id', $this->launche_id)->first()), 
            'launcheNotes' => $this->launcheNotes,
            'snack_id' => new SnackResource(Snack::where('id', $this->snack_id)->first()), 
            'snackNotes' => $this->snackNotes,

        ];
    }
}
