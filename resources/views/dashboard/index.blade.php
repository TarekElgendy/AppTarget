@extends('layouts.dashboard.app')
<?php
$page="dashboard";
$title=trans('site.dashboard');
?>
@section('title_page')
{{$title}}
@endsection
@section('content')
<div class="content-wrapper">
    <section class="content-header">
        <h1>@lang('site.dashboard')</h1>
        <ol class="breadcrumb">
            <li class="active"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</li>
        </ol>
    </section>
    <section style="display:none" class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- Info boxes -->
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-red"><i class="ion ion-ios-cart-outline"></i></span>
                            <div class="info-box-content">
                                <span class="info-box-text">@lang('site.orders')</span>
                                <span class="info-box-number">{{$orders}}</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                   
                    <!-- /.col -->
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-green"><i class="fa fa-user-o"></i></span>
                            <div class="info-box-content">
                                <span class="info-box-text">@lang('site.customers')</span>
                                <span class="info-box-number">{{$customers}}</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                   
                    
                   
                   
                    <!-- fix for small devices only -->
                    <div class="clearfix visible-sm-block"></div>
                </div>
                <!-- /.row -->
            </div>
 
            <div class="col-md-12">
                <!-- USERS LIST -->
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title"> @lang('site.customers')</h3>
                        <div class="box-tools pull-right">
                            <span class="label label-danger"> @lang('site.customers')( {{count($customers_list)}} )
                            </span>
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                    class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i
                                    class="fa fa-times"></i>
                            </button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <ul class="users-list clearfix">
                            @foreach ($customers_list as $item)
                            <li>
                                <!--<img src="{{$item->image_path}}" alt="User Image">-->
                                <a class="users-list-name" href="#">{{$item->full_name}}</a>
                                <span class="users-list-date">
                                    {{ \Carbon\Carbon::parse($item->created_at)->diffForHumans() }}</span>
                            </li>
                            @endforeach
                        </ul>
                        <!-- /.users-list -->
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer text-center">
                        <a href="{{url('dashboard/customers')}}" class="uppercase">@lang('site.customers')</a>
                    </div>
                    <!-- /.box-footer -->
                </div>
                <!--/.box -->
            </div>


            
        </div>
      
    </section>
 
</div><!-- end of content wrapper -->
@endsection