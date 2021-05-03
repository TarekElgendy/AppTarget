@extends('layouts.app')
@section('title_page')
@lang('site.privacies')
@endsection
@section('content')
<!-- START => Breadcrumb -->
<div class="head-pages">
    <div class="breadcrumb-bg"></div>
    <div class="container-fluid">
        <div class="breadcrumb-title">
            <strong>@lang('site.We keep pace with development to create an easier life')</strong>
        </div>
        <div class="breadcrumb-pages">
            <ul class="d-flex align-items-center">
                <li><a href="{{route('home')}}">@lang('site.home')</a></li>
                <li class="mx-2"> <i class="fa fa-chevron-right fa-sm"></i> </li>
                <li><a href="{{route('privacies')}}">@lang('site.privacies')</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- //END => Breadcrumb -->
<!-- START => About Us -->
<section class="sec-about py-3">
    <div class="container-fluid container-bg">
       <div class="row align-items-center  ">
            <div class="col-md-6">
                <div class="about-txt">
                    <strong class="h1 d-block">{{$item->title}}</strong>
                    <p class="m-0">
                        {!!$item->description!!}
                    </p>
                 </div>
            </div>
            <div class="col-md-6">
                <div class="about-img">
                    <img src="{{$item->image_path}}" class="img-fluid" alt="">

                </div>
            </div>
        </div>
    </div>
</section>
<!-- //END => About Us -->
@endsection
