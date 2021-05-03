<?php
namespace App\Http\Controllers\Api\Customer;
use App\Addition;
use App\Cart;
use App\CartDetail;
use App\ChooseMeal;
use App\Collection;
use App\Customer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\CartResource;
use App\Http\Resources\CartTotalResource;
use App\Http\Resources\CustomerResource;
use App\Http\Resources\OrderResource;
use App\Http\Resources\ProductResource;
use App\Http\Resources\PromoResource;
use App\Order;
use App\OrderAddition;
use App\OrderDetail;
use App\Product;
use App\ProductWeight;
use App\PromoCode;
use App\Rate;
use App\State;
use App\Subscribe;
use App\Traits\ApiResponseTrait;
use App\Traits\AuthenticateUser;
use App\Wishlist;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
class OrderController extends Controller
{
    use AuthenticateUser;
    use ApiResponseTrait;
    use HasApiTokens, Notifiable;
    #subscribes
    public function subscribe(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'collection_id' => 'required|exists:collections,id',
            //'code' => 'required',
            // 'choose_breakfast_id' => 'required',
            // 'choose_dinner_id' => 'required',
            // 'choose_launche_id' => 'required',
            // 'choose_snack_id' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        $collection=Collection::find($request->collection_id);

        $totalWithDiscount = $this->promoOrder($request->code,$collection->price);
      

        /*
         $chooseMeal=[
            [
                
                2021-04-12,1,'breakfastNotes',3,'breakfastNotes',10,'launcheNotes',3,'snackNotes',
            ],
            
            [
                2021-04-12,'','',3,'breakfastNotes',10,'launcheNotes',3,'snackNotes',
            ],
             
            [
                2021-04-12,1,'breakfastNotes',3,'breakfastNotes',10,'launcheNotes',3,'snackNotes',
            ],
        ];
        $chooseMeal=[
            [

                'choose_date'=>'14-4-2021',
                'choose_breakfast_id'=>5,
                'breakfastNotes'=>'breakfastNotes',
                'dinner_id'=> null,
                'dinnerNotes'=> 'breakfastNotes',
                'launche_id'=> null,
                'launcheNotes'=> 'launcheNotes',
                'snack_id'=>  null,
                'snackNotes'=> 'snackNotes',
            ],
            
            [
                'choose_date'=>'1-6-2021',
                'choose_breakfast_id'=>5,
                'breakfastNotes'=>'breakfastNotes',
                'dinner_id'=> null,
                'dinnerNotes'=> 'breakfastNotes',
                'launche_id'=> null,
                'launcheNotes'=> 'launcheNotes',
                'snack_id'=>  null,
                'snackNotes'=> 'snackNotes',
            ],
             
            [
                'choose_date'=>'10-8-2021',
                'choose_breakfast_id'=>5,
                'breakfastNotes'=>'breakfastNotes',
                'dinner_id'=> null,
                'dinnerNotes'=> 'breakfastNotes',
                'launche_id'=> null,
                'launcheNotes'=> 'launcheNotes',
                'snack_id'=>  null,
                'snackNotes'=> 'snackNotes',
            ],
        ];
        */
     
        $subcribe_date = date('Y-m-d');
        $subscribe=Subscribe::create([
            "customer_id" => authCustomerApi()->id,
            "collection_id" => $request->collection_id,
            "code" => $request->code,
            "total" => $collection->price,
            "totalWithDiscount" => $totalWithDiscount,
            "subcribe_date" =>date('Y-m-d'),
             "start_programe_date" =>date('Y-m-d', strtotime($subcribe_date. ' + 2 days')),
             "end_programe_date" =>date('Y-m-d', strtotime(date('Y-m-d', strtotime($subcribe_date. ' + 2 days')).' + '. $collection->day->day. ' days')),
        ]);
        ///
        
  $count= count($request->chooseMeal);
  for($i=0 ; $i<$count; $i++){
    $chooseMeal_arry = explode(",", $request->chooseMeal[$i]);

    // dd($chooseMeal_arry[1]==''?null:$chooseMeal_arry[1]);
    ChooseMeal::create([
        'subscribe_id'=> $subscribe->id,
        'customer_id'=>  authCustomerApi()->id,
        'date'=>$chooseMeal_arry[0],
        'breakfast_id'=> $chooseMeal_arry[1]=="''"?null:$chooseMeal_arry[1],
        'breakfastNotes'=> $chooseMeal_arry[2]=="''"?null:$chooseMeal_arry[2],
        'dinner_id'=> $chooseMeal_arry[3]=="''"?null:$chooseMeal_arry[3],
        'dinnerNotes'=> $chooseMeal_arry[4]=="''"?null:$chooseMeal_arry[4],
        'launche_id'=> $chooseMeal_arry[5]=="''"?null:$chooseMeal_arry[5],
        'launcheNotes'=> $chooseMeal_arry[6]=="''"?null:$chooseMeal_arry[6],
        'snack_id'=> $chooseMeal_arry[7]=="''"?null:$chooseMeal_arry[7],
        'snackNotes'=>   $chooseMeal_arry[8]=="''"?null:$chooseMeal_arry[8],
    ]);
  } //ennd of for

   

        return $this->sendResponse('Created Successfuly', '');
    }//end of subscribes


 
    public function editChoosedMeals(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'choose_meal_id' => 'required|exists:choose_meals,id',
            'breakfast_id' => 'exists:breakfasts,id',
            'dinner_id' => 'exists:dinners,id',
            'launche_id' => 'exists:launches,id',
            'snack_id' => 'exists:snacks,id',
             
        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
 
        // 
        ChooseMeal::where('customer_id', authCustomerApi()->id)->where('id', $request->choose_meal_id)->update([
            'breakfast_id' => $request->breakfast_id,
            'dinner_id' => $request->dinner_id,
            'launche_id' => $request->launche_id,
            'snack_id' => $request->snack_id,
            ]);

            return $this->sendResponse('Updated Successfuly', '');
        }//end of editChoosedMeals
    #favourit
    public function addTofavourite(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        $favoirte = Wishlist::firstOrCreate(['product_id' =>  $request->product_id, 'customer_id' => AuthCustomerApi()->id]);
        return $this->sendResponse("", "");
    } //end of addTofavourite
    public function deleteFavourite(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        Wishlist::where('product_id', $request->product_id)->where('customer_id',  AuthCustomerApi()->id)->delete();
        return $this->sendResponse("", "");
    } //end of deleteFavourite
    public function listDatafavourite(Request $request)
    {
        $products = Product::whereIn('id', $request->user()->wishlists->pluck('product_id'))->latest('id')->paginate(10);
        $items = ProductResource::collection($products);
        return $this->sendResponse($items, "");
    } //end of listDatafavourite
    public function addToCart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
            'productWeight_id' => 'nullable|exists:product_weights,id',
            'qty' => 'required|integer|min:1',
            //   'type' => 'required|in:per_unit,gram',
        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        $findCart = Cart::where('customer_id', AuthCustomerApi()->id)->where('product_id', $request->product_id)->where('productWeight_id', $request->productWeight_id)->first();
        if ($findCart) {
            return $this->sendResponse('Actually Added Successfuly', '');
        }
        //check stock
        $product = Product::find($request->product_id);
        if ($product->stock < $request->qty) {
            return $this->sendResponse('Not Allowed to add More than =' . $product->stock . 'Product', '');
        }
        if ($request->qty <= 0) {
            $request->qty = 1;
        }
        $cart = Cart::firstOrCreate([
            'customer_id' => AuthCustomerApi()->id,
            'product_id' => $request->product_id,
            'qty' => $request->qty,
            'productWeight_id' => $request->productWeight_id,
            'type' => '',
        ]);
        if ($request->addition_id) {
            $this->CartDetail($cart->id, $request->addition_id, $request->qty);
        }
        return $this->sendResponse("Item Added Successfuly ", "");
    } //end of addToCart
    public function CartDetail($cart_id, $addition_id, $qty)
    {
        if ($addition_id) {
            $count_arry = explode(",", $addition_id);
            for ($i = 0; $i < count($count_arry); $i++) {
                $addtion = Addition::find($count_arry[$i]);
                if ($addtion) {
                    CartDetail::firstOrCreate([
                        'cart_id' => $cart_id,
                        'addition_id' => $count_arry[$i],
                        'qty' =>  $qty,
                    ]);
                } //end if
            } //end for
        } //end if
    }  //end of CartDetail
    public function deleteCart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cart_id' => 'required|exists:carts,id',
        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        $cart = Cart::where('id', $request->cart_id);
        $cart->delete();
        return $this->sendResponse("", "");
    } //end of  deleteCart
    public function listDataCart(Request $request)
    {
        if (count(authCustomerApi()->carts) > 0) {
            return $this->sendResponse(new CartTotalResource(Customer::find(authCustomerApi())), "");
        } else {
            return $this->sendError(' ', 'cart is empty');
        }
    } //end of  listDataCart
    public function editCart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cart_id' => 'required|exists:carts,id',
            'qty' => 'required|integer|min:1',
        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        if ($request->qty <= 0) {
            $qty = 1;
        } else {
            $qty = $request->qty;
        }
        Cart::where('customer_id', authCustomerApi()->id)->where('id', $request->cart_id)->update([
            'qty' => $qty
        ]);
        CartDetail::where('cart_id', $request->cart_id)->update([
            'qty' => $qty
        ]);
        return $this->sendResponse("", "");
    } //end of  editCart
    public function addPromoCode(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'code' => 'required|exists:promo_codes,code',
        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        $promocode = PromoCode::where('code', $request->code)->whereDate('endDate', '>=', now()->toDateString())->first();
        return $this->sendResponse(new PromoResource($promocode), "");
    } //end of addPromoCode
    public function createOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'customer_phone' => 'required',
            'total' => 'required',
            'customer_name' => 'required',
            'device_type' => 'required|in:ios,android',
            'payment_method' => 'required|in:visa,cach',
            'city_id' => 'required|exists:cities,id',
            'state_id' => 'required|exists:states,id',
            'program_id' => 'required|exists:programs,id',
            'collection_id' => 'required|exists:collections,id',
            'breakfast_id' => 'nullable|exists:breakfasts,id',
            'launch_id' => 'nullable|exists:launches,id',
            'dinner_id' => 'nullable|exists:dinners,id',
            'snack_id' => 'nullable|exists:snacks,id',
        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        $total_promoOrder = $this->promoOrder($request->code,$request->total);
        $delivery_fees = $this->calcDeliveryFees($request->state_id);
        $total = $total_promoOrder + $delivery_fees;
        $order =  Order::create([
            "customer_id" => authCustomerApi()->id,
            "total" => $total,
            "taxes" => 0,
            "delivery_fees" =>  $delivery_fees,
            "promocode" =>   $request->code,
            "device_type" =>   $request->device_type,
            "customer_name" => $request->customer_phone,
            "customer_phone" => $request->customer_phone,
            "customer_email" => $request->customer_email,
            "customer_region" => $request->customer_region,
            "customer_street" => $request->customer_street,
            "customer_home_number" => $request->customer_home_number,
            "customer_floor_number" => $request->customer_floor_number,
            "customer_postal_code" => $request->customer_postal_code,
            "customer_comments_extra" => $request->customer_comments_extra,
            "payment_method" => $request->payment_method,
            "payment_status" => 'Completed',
        'program_id'=>   $request->program_id,
        'collection_id' =>   $request->collection_id,
        'breakfast_id' =>   $request->breakfast_id,
        'breakfast_note'=>   $request->breakfast_note,
        'launch_id'  =>   $request->launch_id,
        'launch_note' =>   $request->launch_note,
        'dinner_id'=>   $request->dinner_id,
        'dinner_note' =>   $request->dinner_note,
        'snack_id'  =>   $request->snack_id,
        'snack_note' =>   $request->snack_note,
        'date_subscription'=>   $request->date_subscription,
        ]);
        // $this->CreateOrderDetails($order->id);
        // $this->CreateOrderAddtions($order->id);
        // Cart::where('customer_id', authCustomerApi()->id)->delete();
        $order = Order::where('id', $order->id)->first();
    return $this->sendResponse('Orde Done Successfuly', '');
        //return $this->sendResponse(new OrderResource($order), "");
        //return $this->sendResponse("", "");
    } //end of createa orders
    public function GetCart()
    {
        return authCustomerApi()->carts;
    }
    public function CreateOrderDetails($order_id)
    {
        $carts = $this->GetCart();
        // $carts->cart_detials();
        foreach ($carts as $item) {
            if ($item->productWeight_id) {
                $productWeight = ProductWeight::find($item->productWeight_id);
                $type = $productWeight->weight->title;
            } else {
                $type = '';
            }
            OrderDetail::create([
                'order_id' => $order_id,
                'product_id' => $item->product_id,
                'qty' => $item->qty,
                'type' => $type,
                'price_before_discount' => $item->product->total,
                'price' => $item->TotalCart,
            ]);
            $this->decrementStockProduct($item->product_id, $item->qty);
            $this->decrementStockProductWeight($item->productWeight_id, $item->qty);
        }
    } //end of CreateOrderDetails
    public function decrementStockProduct($product_id, $qty)
    {
        Product::where('id', $product_id)->decrement('stock', $qty);
    } //decrementStockProduct
    public function decrementStockProductWeight($productWeight_id, $qty)
    {
        ProductWeight::where('id', $productWeight_id)->decrement('stock', $qty);
    } //decrementStockProductWeight
    public function CreateOrderAddtions($order_id)
    {
        $carts = $this->GetCart();
        foreach ($carts as $item) {
            $cart_detials = $item->cart_detials;
            foreach ($cart_detials as $details) {
                OrderAddition::create([
                    'order_id' => $order_id,
                    'addition_id' => $details->addition_id,
                    'qty' => $details->qty,
                    'price' => $details->TotalCartDetails,
                    'price_before_discount' => $details->addtion->price,
                ]);
            }
        }
    } //end of CreateOrderAddtions
    public function update_payment_status(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required|exists:orders,id',
        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        $order = Order::where('id', $request->order_id)->update([
            "payment_status" => 'Complete',
        ]);
        return $this->sendResponse("", "");
    } //end of update_payment_status
    public function promoOrder($code,$total_collection)
    {
        if ($code) {
            $promocode = PromoCode::where('code', $code)->whereDate('endDate', '>=', now()->toDateString())->first();
            if ($promocode) {
                //totalWithPromo
                $total = round($promocode->subtotal($total_collection));
            } else {
                $total = 0;
            }
        } else {
            $total = 0;
        }
        return $total;
    } //end of promoOrder
    public function calcDeliveryFees($state_id)
    {
        $state = State::find($state_id);
        if ($state) {
            $fees = $state->price;
        } else {
            $fees =  0;
        }
        return $fees;
    } //end of calcDeliveryFees
    public function listOrder()
    {
        $orders = Order::where('customer_id', authCustomerApi()->id)->paginate($this->PaginateNumber);
        $items = OrderResource::collection($orders);
        return $this->sendResponse($items, "");
    } //end of listOrder
    public function createRateProduct(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
            'rate' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError(' ', $validator->errors()->first());
        }
        $rate = Rate::firstOrCreate([
            'customer_id' => authCustomerApi()->id,
            'rate' => $request->rate,
            'feedback' => $request->feedback,
            'product_id' => $request->product_id,
        ]);
        return $this->sendResponse("", "");
    } //end of listOrder
}//end of class
