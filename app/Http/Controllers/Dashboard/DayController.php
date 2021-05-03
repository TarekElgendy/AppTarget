<?php

namespace App\Http\Controllers\Dashboard;

use App\Day;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\backend\DayRequest;

class DayController extends Controller
{
    public function __construct()
    {
        //create read update delete
        $this->middleware(['permission:read_days'])->only('index');
        $this->middleware(['permission:create_days'])->only('create');
        $this->middleware(['permission:update_days'])->only('edit');
        $this->middleware(['permission:delete_days'])->only('destroy');
    } //end of constructor
    public function index(Request $request)
    {
        $days = Day::when($request->search, function ($q) use ($request) {
            return $q->whereTranslationLike('title', '%' . $request->search . '%');
        })->latest()->get();
        return view('dashboard.days.index', compact('days'));
    } //end of index
    public function create()
    {
        return view('dashboard.days.create');
    } //end of create
    public function store(DayRequest $request)
    {
        $request_data = $request->all();
        if ($request->image) {
            $request_data['image'] = upload_img($request->image, 'uploads/day/', 600);
        } //end of if
        $day = Day::create($request_data);

        session()->flash('success', __('site.added_successfully'));
        return redirect()->back();
    } //end of store


    public function show(Day $day)
    {
        //
    }
    public function edit(Day $day)
    {
        return view('dashboard.days.edit', compact('day'));
    } //end of edit
    public function update(DayRequest $request, Day $day)
    {
        $request_data = $request->except(['image',]);
        if ($request->image) {
            //check if img not empty remove the current img to replace the new img
            if ($day->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/' . $day->image);
            } //end of inner if
            $request_data['image'] = upload_img($request->image, 'uploads/day/', 600);
        } //end of external if
        $day->update($request_data);

        session()->flash('success', __('site.updated_successfully'));
        return redirect()->back();
    } //end of update
    public function destroy($day)
    {
        $item = Day::find($day);
        if ($item) {
            if ($item->image != 'default.png') {
                Storage::disk('public_uploads')->delete('/day/' . $item->image);
            } //end of if
            $item->delete();
            session()->flash('success', __('site.deleted_successfully'));
            return redirect()->back();
        } else {
            session()->flash('success', __('site.deleted_successfully'));
            return redirect()->back();
        }
    } //end of destroy

    public function duplicate($id)
    {
        $item = Day::find($id);
        if ($item) {
            Day::create([
                'image' =>  $item->image,
                'ar' => [
                    'title' => $item->title . 'copy' . $item->id,
                    'description'  => $item->description,
                    'short_description' => $item->short_description,
                ],
                'en' => [
                    'title' => $item->title . 'copy' . $item->id,
                    'description'  => $item->description,
                    'short_description' => $item->short_description,
                ],
            ]);/* end of create */
            session()->flash('success', __('site.added_successfully'));
            return redirect()->back();
        }
    } //end of duplicate

}
