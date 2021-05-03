@extends('layouts.dashboard.app')
<?php
$page="subscribes";
$title=trans('site.subscribes');
// to hide any section please type -> close
$section_search='';
$section_add=' ';
$section_edit=' ';
$section_delete=' ';
?>
@section('title_page')
{{$title}}
@endsection
@section('content')
<div class="content-wrapper">
    <section class="content-header">
        <h1>@lang('site.subscribes')</h1>
        <ol class="breadcrumb">
            <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a>
            </li>
            <li class="active">@lang('site.subscribes')</li>
        </ol>
    </section>
    <section class="content">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title" style="margin-bottom: 15px">@lang('site.subscribes')
                    <small>
                        @lang('site.total_search')
                        ( {{  count($subscribes) }} )
                    </small></h3>
                <form action="{{ route('dashboard.subscribes.index') }}" method="get">
                    <div class="row">
                        <div class="{{$section_search=='close'?'hidden':''}}">
                            <div class="col-md-3">
                                <input type="text" name="order_id" class="form-control"
                                    placeholder="@lang('site.order_number')" value="{{ request()->order_id }}">
                            </div>
                            <div class="col-md-3">
                                <select name="payment_status" class="form-control">
                                    <option value="">@lang('site.payment_status')</option>
                                    <option value="completed" {{request()->payment_status=='completed'?'selected':''}}>
                                        @lang('site.completed')</option>
                                    <option value="Not completed"
                                        {{request()->payment_status=='Not completed'?'selected':''}}>@lang('site.Not
                                        completed')</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <select name="status" class="form-control">
                                    <option value="">@lang('site.status')</option>
                                    @foreach (status_order() as $index=>$status)
                                    <option {{request()->status==$status ? 'selected':''}} value="{{$status}}">
                                        {{__('site.'.$status)}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i>
                                    @lang('site.search')</button>
                            </div>
                        </div>
                    </div>
                </form><!-- end of form -->
            </div><!-- end of box header -->
            <div class="box-body">
                {{-- <a style="float:left" href="{{ route('dashboard.subscribes.export_subscribes') }}"
                    class="btn btn-success  btn-sm">
                    Export Excel Sheet
                    <i class="fa fa-file-excel-o"></i>
                </a> --}}
                @if ($subscribes->count() > 0)
                <table class="table table-hover " id="data_table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>@lang('site.order_number')</th>
                            <th>@lang('site.info') @lang('site.customers') </th>
                            
                            <th>@lang('site.collections')</th>
                            <th>@lang('site.total')</th>
                            <th>@lang('site.subcribe_date')</th>
                            <th>@lang('site.start_programe_date')</th>
                            <th>@lang('site.end_programe_date')</th>
                            <th>@lang('site.action')</th>
                        </tr>
                       

                    </thead>
                    <tbody>
                        @foreach ($subscribes as $index=>$subscribe)
                        <tr style="background-color:{{ $subscribe->status=="pending" ? '#f1d4d4' :'#04fb0938' }}">
                            <td>{{ $index + 1 }}</td>
                            <td> <code> {{  $subscribe->id}} </code> </td>
                            <td>
                                {{ $subscribe->customer->full_name ??""}} <br>
                                {{ $subscribe->customer->dateOfBirth ??""}} <br>
                                 / {{ $subscribe->created_at }}
                                <br><strong> @lang('site.phone'):{{ $subscribe->customer->phone ??""}} </strong>
                            </td>
                            <td> {{$subscribe->collection->title}}</td>
                            <td>
                                {{ $subscribe->totalWithDiscount!=0?$subscribe->totalWithDiscount: $subscribe->total}}
                            </td>
                          
                             
                            <td> {{$subscribe->subcribe_date}}</td>
                            <td> {{$subscribe->start_programe_date}}</td>
                            <td> {{$subscribe->end_programe_date}}</td>
                       
                            <td>
                                @if (auth()->user()->hasPermission('update_subscribes'))
                                <a href="{{ route('dashboard.subscribes.edit', $subscribe->id) }}"
                                    class="btn btn-info btn-sm {{$section_edit=='close'?'hidden':''}}"><i
                                        class="fa fa-eye"></i>
                                    @lang('site.details')</a>
                                @else
                                <a href="#" class="btn btn-info btn-sm disabled"><i class="fa fa-eye"></i>
                                    @lang('site.details')</a>
                                @endif
                                @if (auth()->user()->hasPermission('delete_subscribes'))
                                <form action="{{ route('dashboard.subscribes.destroy', $subscribe->id) }}" method="post"
                                    style="display: inline-block">
                                    {{ csrf_field() }}
                                    {{ method_field('delete') }}
                                    <button type="submit"
                                        class="btn btn-danger delete btn-sm {{$section_delete=='close'?'hidden':''}}"><i
                                            class="fa fa-trash"></i> @lang('site.delete')</button>
                                </form><!-- end of form -->
                                @else
                                <button class="btn btn-danger btn-sm disabled"><i class="fa fa-trash"></i>
                                    @lang('site.delete')</button>
                                @endif
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table><!-- end of table -->
                @else
                <label for="" class="alert alert-danger col-xs-12 text-center">@lang('site.no_data_found')</label>
                @endif
            </div><!-- end of box body -->
        </div><!-- end of box -->
    </section><!-- end of content -->
</div><!-- end of content wrapper -->
@endsection
