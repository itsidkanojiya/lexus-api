<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SubjectController extends Controller
{
    public function getSubject(){
        $subjects = DB::table('subject')->get();
        return response([
            'subjects' =>  $subjects],200);

    }

    public function addSubject(Request $request){
        $validation=  $request->validate([
            'name'    => 'required',
         ]);
         $validation['name'] =  $request->name;


        $subjectId= DB::table('subject')->insertGetId($validation);
        return response([
            'message' => 'Subject added Successfully',
            'id' =>  $subjectId],201);
    }
    public function editSubject(Request $request){

        $request->validate([
            'id'    => 'required',
            'name'    => 'required',

         ]);

         $validation['name'] =  $request->name;

        $subjectId= DB::table('subject')->where('id',$request->id)->update($validation);

        return response([
            'message' => 'Subject edited Successfully',
            ],200);
    }
}
