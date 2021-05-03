@extends('layouts.dashboard.app')
<?php
$page="days";
$title=trans('site.days');
?>
@section('title_page')
{{$title}}
@endsection
@section('content')
<div class="content-wrapper">
    <section class="content-header">
        <h1>@lang('site.days')</h1>
        <ol class="breadcrumb">
            <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a>
            </li>
            <li><a href="{{ route('dashboard.days.index') }}"> @lang('site.days')</a></li>
            <li class="active">@lang('site.edit')</li>
        </ol>
    </section>
    <section class="content">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title">@lang('site.edit')</h3>
            </div><!-- end of box header -->
            <div class="box-body">
                @include('partials._errors')
                <form action="{{ route('dashboard.days.update', $day->id) }}" method="post"
                    enctype="multipart/form-data">
                    {{ csrf_field() }}
                    {{ method_field('put') }}

                       <div class="form-group">
                        <label>@lang('site.days')</label>
                        <input type="text" required="required" name="day" class="form-control" value="{{ $day->day}}">
                    </div>
                     <div class="form-group">
                        <label>@lang('site.dayOff')</label>

                        <select required="required" class="form-control"  name="dayOff" id="">
                            <option {{ $day->dayOff =="Friday" ?'selected':''}} value="Friday">Friday</option>
                            <option {{ $day->dayOff =="Saturday" ?'selected':''}} value="Saturday">Saturday</option>
                            <option {{ $day->dayOff =="Saturday and Friday"?'selected':''}} value="Saturday and Friday">Saturday and Friday</option>
                        </select>
                     </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-edit"></i>
                            @lang('site.edit')</button>
                    </div>
                </form><!-- end of form -->
            </div><!-- end of box body -->
        </div><!-- end of box -->
    </section><!-- end of content -->
</div><!-- end of content wrapper -->
@endsection
