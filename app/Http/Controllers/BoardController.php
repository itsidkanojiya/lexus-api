<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BoardController extends Controller
{
    public function getBoard(){
        $boards = DB::table('board')->get();
        return response([
            'boards' =>  $boards],200);

    }
    public function addBoard(Request $request){
        $validation=  $request->validate([
            'name'    => 'required',
            'cover_link' => 'required',

         ]);
         $validation['name'] =  $request->name;
         $validation['cover_link'] = $request->cover_link;


        $boardId= DB::table('board')->insertGetId($validation);
        return response([
            'message' => 'Board added Successfully',
            'id' =>  $boardId],201);
    }
    public function editBoard(Request $request){

        $request->validate([
            'id'    => 'required',
            'name'    => 'required',
            'cover_link' => 'required',

         ]);

         $validation['name'] =  $request->name;
         $validation['cover_link'] = $request->cover_link;

        $boardId= DB::table('board')->where('id',$request->id)->update($validation);

        return response([
            'message' => 'Board edited Successfully',
            ],200);
    }
}
