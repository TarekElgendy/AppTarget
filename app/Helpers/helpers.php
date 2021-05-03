<?php

use App\Cart;
use App\PromoCode;
use Intervention\Image\Facades\Image;
////////////////////
if (!function_exists('x_api_key')) {
    function x_api_key()
    {
        return 'JL6JVGgz.tCpQS5RJa1t7DehpK4XioMkBvtwmBRpo';
    }
} //end of x_api_key
if (!function_exists('comunityId')) {
    function comunityId()
    {
        return 'YBZyk2k';
    }
} //end of comunityId
if (!function_exists('variable_amount_id')) {
    function variable_amount_id()
    {
        return 81;
    }
} //end of ApiPaymentId
////////////////////
if (!function_exists('currncy')) {
    function currncy()
    {
        return 'pound';
    }
} //end of currncy
if (!function_exists('Invoice_slug')) {
    function Invoice_slug()
    {
        return '#INV-NO';
    }
} //end of Invoice_slug
if (!function_exists('pages_name')) {
    function pages_name()
    {
        $items = ['polices', 'privacies', 'whystart'];
        return  $items;
    }
} //end of pages_name
if (!function_exists('status_order')) {
    function status_order()
    {
        $status = ['pendding', 'inShipment', 'onDelivery', 'completed', 'canceled'];
        return  $status;
    }
} //end of status_order
if (!function_exists('status_invoice')) {
    function status_invoice()
    {
        $status = ['pending', 'completed', 'Renovated', 'Not renewed', 'cancel'];
        return  $status;
    }
} //end of status_invoice
if (!function_exists('ticket_status')) {
    function ticket_status()
    {
        $status = ['pending',   'completed', 'cancel'];
        return  $status;
    }
} //end of ticket_status
if (!function_exists('ticket_option')) {
    function ticket_option()
    {
        $status = [
            'Technical Support',
            'Services Support',
            'Apps Support',
            'installation Support',
            'order Support',
            'Customer Services',
            'others',
        ];
        return  $status;
    }
} //end of ticket_option
if (!function_exists('ticket_type')) {
    function ticket_type()
    {
        $status = [
            'Normal',
            'medium',
            'high',
            'Emergency',
        ];
        return  $status;
    }
} //end of ticket_option
if (!function_exists('ticket_message')) {
    function ticket_message()
    {
        return  'اهلا بك عزيزي العميل ، تم فتح تذكرة خاصة بك لمساعدتك وتقلي كافة طلباتك';
    }
} //end of ticket_message
if (!function_exists('check_vaild_date_promoCode')) {
    function check_vaild_date_promoCode()
    {
        //if date expired make code not active
        PromoCode::whereDate('endDate', '<', now()->toDateString())->update(['status' => 'notActive']);
    }
} //end of check_vaild_date_promoCode
if (!function_exists('authCustomer')) {
    function authCustomer()
    {
        return auth()->guard('customer')->user();
    }
}
if (!function_exists('authCustomerApi')) {
    function authCustomerApi()
    {
        return auth()->guard('customer-api')->user();
    }
}
if (!function_exists('size_brands')) {
    function size_brands()
    {
        $size = "Recommended Dimension=   350 X 244 px";
        return $size;
    }
} //end of size_brands
if (!function_exists('make_slug')) {
    function make_slug($string)
    {
        $text = html_entity_decode(mb_strtolower($string), ENT_QUOTES, 'UTF-8');
        // replace non letter or digits by -
        $text = preg_replace('~[^\\pL\d]+~u', '-', $text);
        // trim
        $text = trim($text, '-');
        return $text;
    } //end of make slug
    if (!function_exists('upload_img')) {
        function upload_img($request, $path, $resize)
        {
            Image::make($request)
                ->resize($resize, null, function ($constraint) {
                    $constraint->aspectRatio();
                })
                ->save(public_path($path . $request->hashName()));
            return $request->hashName();
        }
    } //end of upload_img
    if (!function_exists('MultipleUploadImages')) {
        function MultipleUploadImages($requests, $path, $resize)
        {
            $data = [];
            foreach ($requests as  $attach) {
                Image::make($attach)
                    ->resize($resize, null, function ($constraint) {
                        $constraint->aspectRatio();
                    })
                    // ->save(public_path($path . $request->hashName()));
                    ->save(public_path($path . $attach->hashName()));
                $data[] = $attach->hashName();
            }
            return $data;
        }
    } //end multiple upload image
    if (!function_exists('sum_cart')) {
        function sum_cart($customer_id)
        {
            $carts = Cart::where('customer_id', $customer_id)->get();
            $sumCart = 0;
            $sumAdditionCart = 0;
            foreach ($carts as $cart) {
                if (!$cart->productWeight_id) {
                    $product_price_total = $cart->product->total;
                } else {
                    $product_price_total = $cart->productWeight->price;
                }
                // if ($cart->type == "per_unit") {
                //     $product_price_total = $cart->product->total;
                // } else {
                //     $product_price_total = $cart->product->total / 2;
                // }
                $sumCart += $product_price_total * $cart->qty;
                foreach ($cart->cart_detials as $cart_detial) {
                    $sumAdditionCart += $cart_detial->addtion->price * $cart_detial->qty;
                }
                $TotalCartWithAddtions = $sumCart + $sumAdditionCart;
            }
            return $TotalCartWithAddtions;
        }
    }
    if (!function_exists('getModels')) {
        function getModels()
        {
            $modules = [
                  //   'orders',
                     'subscribes',
                'programs',
                'days',
                'collections',
                'breakfasts',
                'dinners',
                'launchs',
                'snacks',
               
                // days
                // Collection
                // Breakfast
                // Dinner
                // Launch
                // Snack
                // Subscribe
                // ChoosedMeal

                #--------------
                /////
            
                // 'carts',
                // 'inbox',
                // 'sections',
                // 'categories',
                // 'subCategories',
                // 'products',
                // 'additions',
                // 'pieces',
                // 'instructions',
                // 'galleries',
                // 'rates',
                // 'wishlists',
                // 'addresses',

                // 'ads',
                // 'notifications',
                ////
                // 'invoices',
                'customers',
                //'quotes',
                //'tickets',
                'promocodes',
                //'subscribe',
                //'services',
                // 'plans',
                // 'packages',
                // 'tags',
                //'clients',
                // 'testimonails',
                // 'sliders',
                // 'abouts',
                // 'provenances',
                //'brands',
                //'site_options',
                //'countries',
                'cities',
                'states',
                // 'weights',
                //  'productWeights',
                // 'parteners',
                // 'blogs',
                //'pages',
                //'socail',
                //'settings',
                //'users',
                //'roles',
            ];
            // Log::info($modules);
            return $modules;
        }
    }
}
