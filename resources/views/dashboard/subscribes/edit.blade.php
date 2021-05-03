@extends('layouts.dashboard.app')
<?php
$page="subscribes";
$title=trans('site.subscribes');
?>
@section('title_page')
{{$title}}
@endsection
@section('content')
<div class="content-wrapper">
    <section class="content-header">
        <h1>{{$title}}</h1>
        <ol class="breadcrumb">
            <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a>
            </li>
            <li><a href="{{ route('dashboard.subscribes.index') }}">{{$title}}</a></li>
            <li class="active">@lang('site.edit')</li>
        </ol>
    </section>
    @include('partials._errors')
    <!-- Main content -->
    <section class="invoice ">
        <!-- title row -->
        <div class="row">
            <div class="col-xs-12">
                <h2 class="page-header">
                    <i class="fa fa-globe"></i> <b> @lang('site.subscribe_number') </b>: {{ $subscribe->id }}
                    <small class="pull-right"> @lang('site.created_at') : {{ $subscribe->created_at }} </small>
                </h2>
            </div>
            <!-- /.col -->
        </div>
        <!-- info row -->
        <div class="row invoice-info">
            <div class="col-sm-3 invoice-col">
                <address>
                    <b> @lang('site.name') </b>: {{ $subscribe->customer->full_name ??""}} <br>
                    <b> @lang('site.email') </b>: {{ $subscribe->customer->email??"" }} <br>
                    <b> @lang('site.phone') </b>: {{ $subscribe->customer->phone ??""}} <br>
                    {{-- <b> @lang('site.status') </b>: {{__('site.'.$subscribe->status) }} --}}
                </address>
            </div>
            <!-- /.col -->
            <div class="col-sm-3 invoice-col">
                <address>
                    <b> @lang('site.total') </b>: {{ $subscribe->totalWithDiscount!=0?$subscribe->totalWithDiscount: $subscribe->total}}
                    <b> @lang('site.coupon') </b>: <code>{{$subscribe->promocode}}</code> <br>
                   
                    <b> @lang('site.subcribe_date') </b>: {{ $subscribe->subcribe_date }} <br>
                    <b> @lang('site.start_programe_date') </b>: {{ $subscribe->start_programe_date }} <br>
                    <b> @lang('site.end_programe_date') </b>: {{ $subscribe->end_programe_date }} <br>
                    
                    {{-- <b> @lang('site.payment_method') </b>: {{__('site.'.$subscribe->payment_method) }} <br>
                    <b> @lang('site.payment_status') </b>: {{__('site.'.$subscribe->payment_status) }} <br>
                    <b> @lang('site.delivery_fees') </b>: {{ $subscribe->delivery_fees}} <br> --}}
                </address>
            </div>
            <!-- /.col -->
            <div class="col-sm-6 invoice-col">
                <b> @lang('site.customer_address') </b>: {{ $subscribe->customer->customer_address }} <br>
                <b> @lang('site.customer_region') : </b>{{ $subscribe->customer->customer_region }} <br>
                <b> @lang('site.customer_street') : </b>{{ $subscribe->customer->customer_street }} <br>
                <b> @lang('site.customer_home_number') : </b>{{ $subscribe->customer->customer_home_number }} <br>
                <b> @lang('site.customer_floor_number') : </b>{{ $subscribe->customer->customer_floor_number }} <br>
                <b> @lang('site.customer_appartment_number') : </b>{{ $subscribe->customer->customer_appartment_number }} <br>
                <b> @lang('site.notes') : </b>{{ $subscribe->customer->customer_comments_extra }} <br>
            </div>
            <!-- /.col -->
            {{-- <div class="col-sm-3 invoice-col">
                <img src="{{$setting->image_logo}}" class="" width="80" height="80" alt="">
        </div> --}}
        <!-- /.col -->
</div>
<!-- /.row -->
<!-- Table row -->
<div class="row  ">
    <div class="box  ">
        <br>
        <div class="row invoice-info">
            <div class="col-sm-6 invoice-col">
                <address>
                    <b> @lang('site.programs') </b>: {{ $subscribe->program->title??"" }}>
                    {{ $subscribe->collection->title??"" }}
                    <b> @lang('site.date') </b>: {{ $subscribe->subcribe_date ??""}} <br>
                </address>
            </div>
        </div>
    </div>

    

    @foreach ($choosMeals  as $item)
    <div class="box  ">
        <br>
        <div class="row invoice-info"> 
                
            <div class="col-sm-6 invoice-col">
                <address> 
                       
                 <b> @lang('site.breakfasts') </b>: {{ $item->breakfast->title??'' }}
                <b> @lang('site.notes') </b>: {{ $item->breakfastNotes??"" }}
                     
                </address>
            </div>
            <div class="col-sm-6 invoice-col">
                <address> 
                       
                 <b> @lang('site.launchs') </b>: {{ $item->launch->title??'' }}
                <b> @lang('site.notes') </b>: {{ $item->launcheNotes??"" }}
                     
                </address>
            </div>
            <div class="col-sm-6 invoice-col">
                <address> 
                       
                 <b> @lang('site.dinners') </b>: {{ $item->dinner->title??'' }}
                <b> @lang('site.notes') </b>: {{ $item->dinnerNotes??"" }}
                     
                </address>
            </div>
            <div class="row invoice-info"> 
                
                <div class="col-sm-6 invoice-col">
                    <address> 
                           
                     <b> @lang('site.snacks') </b>: {{ $item->snack->title??'' }}
                    <b> @lang('site.notes') </b>: {{ $item->snackNotes??"" }}
                         
                    </address>
                </div>
            </div>
        </div>
    </div>
 

 


	

    @endforeach
     




    <!-- /.col -->
</div>
<!-- /.row -->
<div class="row">
    <!-- accepted payments column -->
    <div class="col-xs-6">
    </div>
    <!-- /.col -->
    <div class="col-xs-6">
    </div>
    <!-- /.col -->
</div>
<!-- /.row -->
<!-- this row will not appear when printing -->
<div class="row no-print">
    <div class="col-xs-12">
        <button onclick="window.print();" class="btn btn-primary"><i
                class="fa fa-print"></i>@lang('site.print')</button>
    </div>
</div>
</section>
<section class="content ">
    <div class="box box-default no-print hidden">
        <div class="box-header with-bsubscribe">
            <h3 class="box-title">@lang('site.edit')</h3>
        </div>
        <div class="box-body ">
            @include('partials._errors')
            <form action="{{ route('dashboard.subscribes.update', $subscribe->id) }}" method="POST"
                enctype="multipart/form-data">
                {{ csrf_field() }}
                {{ method_field('put') }}
                <div class="col-md-12">
                    <div class=" form-group ">
                        <label>@lang('site.status') </label>
                        <select class="form-control" name="status" id="">
                            <option value="">@lang('site.status')</option>
                         
                        </select>
                    </div>
                    {{-- <div class=" form-group ">
                        <label>@lang('site.shipping_number') </label>
                        <input type="text" name="shipping_number" class="form-control"
                            value="{{$subscribe->shipping_number}}" id="">
                    </div> --}}
                    {{-- <div class=" form-group ">
                            <label>@lang('site.notes') </label>
                            <textarea name="note" class="form-control summernote" id="" cols="30"
                                rows="10">{{$subscribe->note}}</textarea>
                </div> --}}
                <div class="form-group">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-edit"></i>
                        @lang('site.edit')</button>
                </div>
        </div>
        </form>
    </div>
    <!-- /.box-body -->
    </div>
    <!-- /.box -->
</section>
<!-- /.content -->
</div><!-- end of content wrapper -->
@endsection