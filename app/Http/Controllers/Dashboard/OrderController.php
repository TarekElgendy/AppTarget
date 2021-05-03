<?php

namespace App\Http\Controllers\Dashboard;

use App\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class OrderController extends Controller
{
    public function __construct()
    {
        //create read update delete
        $this->middleware(['permission:read_orders'])->only('index');
        $this->middleware(['permission:create_orders'])->only('create');
        $this->middleware(['permission:update_orders'])->only('edit');
        $this->middleware(['permission:delete_orders'])->only('destroy');
    } //end of constructor
    public function index(Request $request)
    {
        $orders = Order::when($request->order_id, function ($q) use ($request) {
            return $q->where('id', $request->order_id);
        })->when($request->status, function ($q) use ($request) {

            return $q->where('status', $request->status);
        })
            ->when($request->payment_status, function ($q) use ($request) {

                return $q->where('payment_status', $request->payment_status);
            })

            ->latest()->get();
        return view('dashboard.orders.index', compact('orders'));
    } //end of orders
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
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        //
    }

    public function edit(Order $order)
    {

        return view('dashboard.orders.edit', compact('order'));
    }


    public function update(Request $request, Order $order)
    {
        $request_data = $request->except(['image',]);
        $order->update($request_data);
        session()->flash('success', __('site.updated_successfully'));
        return redirect()->back();
    } //end of update
    public function destroy(Order $order)
    {


        $order->delete();
        session()->flash('success', __('site.deleted_successfully'));
        return redirect()->back();
    } //end of destroy
}
