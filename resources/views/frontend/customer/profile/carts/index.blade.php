@extends('layouts.app')
@section('title_page')
@lang('site.cart')
@php
$page='cart';
@endphp
@endsection
@section('content')
<!-- START => Breadcrumb -->
<div class="breadcrumb-pages" style="background-image: url({{url('/')}}/frontend/assets/imgs/bg-pages.jpg)">
    <strong class="h1 d-block">@lang('site.cart')</strong>
    <ul>
        <li><a href="{{route('home')}}">@lang('site.home')</a></li>
        <li class="mx-2"> <i class="fa fa-chevron-right fa-sm"></i> </li>
        <li><a href="{{route('about')}}">@lang('site.cart')</a></li>
    </ul>
</div>
<!-- //END => Breadcrumb -->
<!-- START => Page Wishlist -->
<section class="page-wishlist">
    <div class="container">
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr class="table-head">
                        <th scope="col">@lang('site.image')</th>
                        <th scope="col">@lang('site.title')</th>
                        <th scope="col">@lang('site.price')</th>
                        <th scope="col">@lang('site.quantity')</th>
                        <th scope="col">@lang('site.additions')</th>
                        <th scope="col">@lang('site.total')</th>
                        <th scope="col">@lang('site.action')</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($carts as $cart)
                    <tr>
                        <td>
                            <a
                                href="{{route('product_details',['id'=>$cart->product->id,'slug'=>make_slug($cart->product->title)])}}"><img
                                    src="{{$cart->product->image_path}}" alt=""></a>
                        </td>
                        <td>
                            <a
                                href="{{route('product_details',['id'=>$cart->product->id,'slug'=>make_slug($cart->product->title)])}}">{{$cart->product->title}}</a>
                        </td>
                        <td>
                               @if(!$cart->productWeight_id)

                                <p class="qty">{{$cart->product->total}}</p>
                                @else
                                <p class="qty">{{$cart->productWeight->price}}</p>
                                @endif
                                {{-- <p class="price">{{$cart->TotalCart}}{{__('site.'.currncy())}}</p> --}}

                                {{-- {{$cart->product->total}} --}}
                                {{-- <h2>
                                ={{$cart->TotalCart}} {{__('site.'.currncy())}}
                                </h2> --}}
                        </td>
                        <td>
                             {{$cart->qty}}
                        </td>
                        <td>
                            @foreach ($cart->cart_detials as $cart_detial)
                            <strong> {{$cart_detial->addtion->title}} : </strong>
                            {{$cart_detial->addtion->price}}*{{$cart_detial->qty}}
                             {{-- = {{$cart_detial->TotalCartDetails}} --}}
                            <br>
                            @endforeach
                            {{-- <hr>
                            <strong> @lang('site.total') : </strong>
                            {{$cart->SumCartDetails}}{{__('site.'.currncy())}}
                            <br> --}}
                        </td>
                        <td>
                            {{-- {{$cart->TotalCart}} + {{$cart->SumCartDetails}} = --}}
                            {{$cart->SumCartWithCartDetails}}{{__('site.'.currncy())}}
                        </td>
                        <td class="actions">
                            <a href="{{route('customer.cart.delete',['id'=>$cart->id])}}" class="mr-3"><i
                                    class="fas fa-lg fa-times"></i> </a>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4">
                            @lang('site.no_data_found')
                        </td>
                    </tr>
                    @endforelse


                </tbody>
                <tfoot>
            <tr>
              <td class="text-left" colspan="3"><a href="{{route('products')}}" class="btn-checkout my-4">@lang('site.Back To Shop')</a></td>
              <td class="text-right" colspan="3"><a href="{{route('customer.checkout.index')}}" class="btn-checkout my-4">@lang('site.checkout')</a></td>
            </tr>
          </tfoot>

            </table>
        </div>
    </div>
</section>
<!-- //END => Page Wishlist -->
@endsection
