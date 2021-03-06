<?php

namespace App\Http\Controllers\FrontEndAuthentication\Customer;

use App\Cart;
use App\City;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\frontend\PromoCodeRequest;
use App\Order;
use App\OrderAddition;
use App\OrderDetail;
use App\Product;
use App\ProductWeight;
use App\PromoCode;
use App\State;
use App\Traits\FrontendTrait;

class CheckoutController extends Controller
{
    use FrontendTrait;
    public function GetCart()
    {
        return  Cart::where('customer_id', authCustomer()->id)->latest()->get();
    } //end of GetCart
    public function sum_Incart()
    {
        $carts = $this->GetCart();
        $sumCartAndDetail = 0;
        foreach ($carts as $cart) {
            $cart_total = $cart->TotalCart;
            foreach ($cart->cart_detials as $cart_detial) {
                $total_detials = $cart_detial->TotalCartDetails;
            }
            $sumCartAndDetail += $cart->SumCartWithCartDetails;
        }

        ///

        if (isset(session()->get('coupon')['discount'])) {
            //check if discount >=  $sumCartAndDetail
            if (session()->get('coupon')['discount'] >= $sumCartAndDetail) {
                $sum = $sumCartAndDetail;
            } else {
                $sum =  $sumCartAndDetail - session()->get('coupon')['discount'];
            }
        } else {

            $sum =  $sumCartAndDetail;
        }
        ///
        if (isset(session()->get('delivery')['amount'])) {
            $sum = $sum + session()->get('delivery')['amount'];
        }

        return $sum;
    } //end of sum_Incart (product in cart and cart details )

    public function index()
    {
        $cities = City::get();
        $states = State::get();
        $carts = $this->GetCart();
        if (count($carts) <= 0) {
            $this->removePromocode();
            $this->removeDeliver();
            return redirect()->route('home');
        }
        $sum = $this->sum_Incart();
        return view('frontend.customer.profile.checkout.index', compact('cities', 'states', 'carts', 'sum'));
    } //end of index

    public function applyPromo(PromoCodeRequest $request)
    {
        $promocode = PromoCode::where('code', $request->code)->first();
        $sum = $this->sum_Incart();
        if ($sum) {
            session()->put('coupon', [
                'name' => $promocode->code,
                'discount' => $promocode->discount($sum),
                'subtotal' => $promocode->subtotal($sum),
            ]);
            session()->flash('success', __('site.done_successfuly'));
        }
        return redirect()->back();
    } //end of applyPromo

    public function IncreasePromoUser($code)
    {
        PromoCode::where('code', $code)->increment('used');
    } //end IncreasePromoUser


    public function calculate_delivery_cost(Request $request)
    {
        $state = State::find($request->state_id);

        session()->put('delivery', [
            'state' => $state->title,
            'amount' => $state->price,
        ]);
        return back();
    } //end of calculate_delivery_cost

    public function checkout(Request $request)
    {
        $request->validate([
            'phone' => 'required',
            'name' => 'required',
            'payment_method' => 'required|in:visa,cach',
        ]);


        //////// check Stock

        $carts = $this->GetCart();
        foreach ($carts as $cart) {
            $product = Product::find($cart->product_id);
            if ($product->stock < $cart->qty) {
                session()->flash('success', __('Not Allowed to add More than =' . $product->stock . 'For' . $product->title));
                return  redirect()->back();
            }
        } //end of carts

        //////// End check Stock


        $order =  Order::create([
            "customer_id" => authCustomer()->id,
            "total" => $this->sum_Incart(),
            "taxes" => 0,
            "delivery_fees" =>  session()->get('delivery')['amount'],
            "promocode" =>   session()->get('coupon')['discount'],
            "customer_name" => $request->name,
            "customer_phone" => $request->phone,
            "customer_email" => $request->email,
            "customer_region" => $request->customer_region,
            "customer_street" => $request->customer_street,
            "customer_home_number" => $request->customer_home_number,
            "customer_floor_number" => $request->customer_floor_number,
            "customer_postal_code" => $request->customer_postal_code,
            "customer_comments_extra" => $request->customer_comments_extra,
            "payment_method" => $request->payment_method,
            "payment_status" => 'Not Complete',
        ]);
        $this->session_create_order_id($order->id);

        // insert order detrails and orderDetial
        $this->CreateOrderDetails($order->id);
        $this->CreateOrderAddtions($order->id);

        if ($request->payment_method == 'cach') {
            Cart::where('customer_id', authCustomer()->id)->delete();
            $this->update_payment_status();
            $this->RemoveAllSession();
            session()->flash('success', __('site.done_successfuly'));
            return view('frontend.customer.profile.index');
        } else {

            $this->payemnt_visa();
        }
    } //end of checkout
    public function session_create_order_id($order_id)
    {
        session(['order_id' => $order_id]);
    } //end of session_create_order_id
    public function session_get_order_id()
    {
        return session()->get('order_id');
    } //end of session_order_id
    public function update_payment_status()
    {
        $order = Order::where('id', $this->session_get_order_id())->update([
            "payment_status" => 'Complete',
        ]);
    } //end of update_payment_status
    public function CreateOrderDetails($order_id)
    {
        $carts = $this->GetCart();
        // $carts->cart_detials();
        foreach ($carts as $cart) {
            if ($cart->productWeight_id) {
                $productWeight = ProductWeight::find($cart->productWeight_id);
                $type = $productWeight->weight->title;
            } else {
                $type = '';
            }
            OrderDetail::create([
                'order_id' => $order_id,
                'product_id' => $cart->product_id,
                'qty' => $cart->qty,
                'type' => $type,
                'price_before_discount' => $cart->product->total,
                'price' => $cart->TotalCart,
            ]);
            //decrement stock
            $this->decrementStockProduct($cart->product_id, $cart->qty);
            $this->decrementStockProductWeight($cart->productWeight_id, $cart->qty);
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

    public function payemnt_visa()
    {

        // "variable_amount_id"=>42, //stage
        $order = Order::find($this->session_get_order_id());
        $total =   $this->sum_Incart();
        // $url = "https://community.xpay.app/api/v1/payments/pay/variable-amount";
        $url = "https://staging.xpay.app/api/v1/payments/pay/variable-amount";
        $client = new \GuzzleHttp\Client();
        // $success_url = 'https://woowegypt.com/en/customer/paymentSuccess';
        $success_url = 'http://127.0.0.1:8000/order/paymentSuccess';


        $headers = [
            'Authorization' => 'x-api-key' . x_api_key(),
            'Accept'        => 'application/json',
        ];

        $response = $client->request('POST', $url, [
            'headers' => $headers,
            'json' => [
                "billing_data" => [
                    "name" => authCustomer()->full_name . " " . "gamal",
                    "email" =>  $order->id . 'info@customer.com',
                    "phone_number" => "+201112117402"
                ],
                "amount" =>   $total,
                "currency" => "EGP", // EGP  USD
                "variable_amount_id" => 81,
                "community_id" => comunityId(),
                "pay_using" => "card",
                "custom_fields" => [
                    [
                        "field_label" => 'order id',
                        "field_value" => $this->session_get_order_id()
                    ], [
                        "field_label" => 'customer id',
                        "field_value" => authCustomer()->id
                    ],
                    // [
                    //     "field_label" => 'coupon name',
                    //     "field_value" => session('coupon')['name'] ?? "not_found"
                    // ],
                ]

            ]
        ]);

        // $response = $response->getBody()->getContents();
        $data =  json_decode($response->getBody()->getContents());

        $iframe_url = $data->data->iframe_url;
        $transaction_uuid = $data->data->transaction_uuid;

        dd($data, $iframe_url);

        //  $order->update(['transaction_uuid' => $transaction_uuid]);

        $ifram = "<iframe src=" . $iframe_url . " width='100%' height='1000px'></iframe>";
        session()->flash('success', __('site.Success Operation'));
        $order = authCustomer()->orders()->latest()->first();
        return $ifram;
        //  return view('customer.payment', compact('order', 'session_id', 'ifram'));
    } // end of payOrderPage
    public function payemnt_online_done()
    {
        $this->update_payment_status();
        Cart::where('customer_id', authCustomer()->id)->delete();
        $this->RemoveAllSession();
        session()->flash('success', __('site.done_successfuly'));
        return view('frontend.customer.profile.index');
    } //end of payemnt_online_done

    public function removePromocode()
    {
        session()->forget('coupon');
        return redirect()->back();
    } //end of removePromocode
    public function removeDeliver()
    {
        session()->forget('delivery');
        return redirect()->back();
    } //end of removeDeliver

    public function RemoveAllSession()
    {
        $this->removePromocode();
        $this->removeDeliver();
    } //end of RemoveAllSession
}//end of class
