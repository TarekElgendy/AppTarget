<?php

namespace App\Http\Controllers\Dashboard;

use App\ChooseMeal;
use App\Subscribe;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SubscribeController extends Controller
{
    public function __construct()
    {
        //create read update delete
        $this->middleware(['permission:read_subscribes'])->only('index');
        $this->middleware(['permission:create_subscribes'])->only('create');
        $this->middleware(['permission:update_subscribes'])->only('edit');
        $this->middleware(['permission:delete_subscribes'])->only('destroy');
    } //end of constructor
    public function index(Request $request)
    {
        $subscribes = Subscribe::when($request->subscribe_id, function ($q) use ($request) {
            return $q->where('id', $request->subscribe_id);
        })->when($request->status, function ($q) use ($request) {

            return $q->where('status', $request->status);
        })
            ->when($request->payment_status, function ($q) use ($request) {

                return $q->where('payment_status', $request->payment_status);
            })

            ->latest()->get();
        return view('dashboard.subscribes.index', compact('subscribes'));
    } //end of subscribes
    public function create()
    {
        //
    }


    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Subscribe  $subscribe
     * @return \Illuminate\Http\Response
     */
    public function show(Subscribe $subscribe)
    {
        //
    }

    public function edit(Subscribe $subscribe)
    {
        $choosMeals=ChooseMeal::where('subscribe_id',$subscribe->id)->get();
        
         
        return view('dashboard.subscribes.edit', compact('subscribe','choosMeals'));
    }


    public function update(Request $request, Subscribe $subscribe)
    {
        $request_data = $request->except(['image',]);
        $subscribe->update($request_data);
        session()->flash('success', __('site.updated_successfully'));
        return redirect()->back();
    } //end of update
    public function destroy(Subscribe $subscribe)
    {


        $subscribe->delete();
        session()->flash('success', __('site.deleted_successfully'));
        return redirect()->back();
    } //end of destroy
}
