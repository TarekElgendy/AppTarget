@extends('layouts.dashboard.app')
<?php
$page="collections";
$title=trans('site.collections');
?>
@section('title_page')
{{$title}}
@endsection
@section('content')
<div class="content-wrapper">
    <section class="content-header">
        <h1>@lang('site.collections')</h1>
        <ol class="breadcrumb">
            <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a>
            </li>
            <li><a href="{{ route('dashboard.collections.index') }}"> @lang('site.collections')</a></li>
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
                <form action="{{ route('dashboard.collections.update', $collection->id) }}" method="post"
                    enctype="multipart/form-data">
                    {{ csrf_field() }}
                    {{ method_field('put') }}
                 
  <div class="form-group" data-select2-id="25">
                    <label for="files">@lang('site.programs')</label>
                    <select   class="form-control " data-placeholder="@lang('site.programs')" name="program_id">
                          
                        @foreach($programs as $item)
                            <option value="{{$item->id}}" {{ $collection->program_id==$item->id?"selected":"" }} >{{$item->title}} </option>
                            @endforeach
                       
                    </select>
                    </div>
                    
                    <div class="form-group" data-select2-id="25">
                        <label for="files">@lang('site.days')</label>
                        <select   class="form-control " data-placeholder="@lang('site.days')" name="day_id">
                              @foreach($days as $day)
                            <option value="{{$day->id}}"  {{ $collection->day_id==$day->id?"selected":"" }}   >{{$day->day}} </option>
                            @endforeach
                        
                           
                        </select>
                    </div>



                    @foreach (config('translatable.locales') as $key=> $locale)
                    <div class="form-group">
                        <span class="label label-warning  ">{{$key+1}} </span>
                        <label>@lang('site.' . $locale .'.title')</label>
                        <input type="text" name="{{ $locale }}[title]" class="form-control"
                            value="{{ $collection->translate($locale)->title }}">
                    </div>
                    <div class="form-group">
                         <label>@lang('site.' . $locale .'.description')</label>
                        <input type="text" name="{{ $locale }}[description]" class="form-control"
                            value="{{ $collection->translate($locale)->description }}">
                    </div>
                   
                    @endforeach
                     <div class="form-group">
                        <label>@lang('site.price')</label>
                        <input type="text" name="price"  required="required" class="form-control" value="{{ $collection->price }}">
                    </div>
                    <div class="form-group">
                        <label>@lang('site.isBreakfast')</label>
                        
                        <input type="checkbox" name="isBreakfast"  {{ $collection->isBreakfast==1?"checked":"" }} value="1">
                    </div>
                    <div class="form-group">
                        <label>@lang('site.isDinner')</label>
                        
                        <input type="checkbox" name="isDinner" {{ $collection->isDinner==1?"checked":"" }} value="1">
                    </div>
                    <div class="form-group">
                        <label>@lang('site.isLaunch')</label>
                        
                        <input type="checkbox" name="isLaunch" {{ $collection->isLaunch==1?"checked":"" }} value="1">
                    </div>
                    <div class="form-group">
                        <label>@lang('site.numberSnaks')</label>
                        
                        <input type="number" name="numberSnaks" class="form-control" value="{{ $collection->numberSnaks }}">
                    </div>
                    


                    <div class="form-group">
                        <label>@lang('site.image')</label>
                        <input type="file" name="image" class="form-control image">
                    </div>
                    <div class="form-group">
                        <img src="{{ $collection->image_path }}" style="width: 100px" class="img-thumbnail image-preview"
                            alt="">
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
