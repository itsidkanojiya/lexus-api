<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PaperController extends Controller
{
    public function addPaper(Request $request){

        $pdf= '';

        $validation=  $request->validate([
           'uid'    => 'required',
           'pdf_link' => 'required',
         ]);

        if($request->pdf_link->isValid()){
            $pdf= $request->file('pdf_link')->store('pdf_link');
        }
             $validation['uid'] =  $request->uid;
             $validation['pdf_link'] = $pdf;



        DB::table('paper')->insertGetId($validation);
        return response([
            'message' => 'Paper added Successfully',
          ],201);
    }

    public function getPaper(){
        $userID = Auth::id();
        $paper = DB::table('paper')->where('deleted_at',null)->where('uid',$userID)->get();

        return response([
            'paper' => $userID,
            ],200);
    }



}
