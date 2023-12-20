<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ShortController extends Controller
{
    public function getShort(){
        $skip= (int) request()->skip ?? 0;
        $limit = request()->limit ?? 10;
        $orderBy =request()->orderBy ?? "id";
        $ascending= request()->ascending ?? 'ASC';
        $search= request()->search ?? '';

        $short = DB::table('short')->where('deleted_at',null)->where(

            function($query) use ($search){
                return $query
                ->orWhere('question','like', '%'. $search . '%')
                ->orWhere('answer','like', '%'. $search . '%')
               ;
            }
        )->orderBy($orderBy,$ascending)->skip($skip)->take($limit)->get();

        return response([
            'questions' => $short,
            ],200);
    }
    public function addShort(Request $request){

        $validation=  $request->validate([
          'board'     => 'required',
          'std'     => 'required',
          'question' => 'required',
          'answer'   => 'required',

         ]);

                 $validation['board'] =  $request->board;
                 $validation['std'] =  $request->std;
                 $validation['question'] = $request->question;
                 $validation['answer'] =  $request->answer;



   $bookId= DB::table('short')->insertGetId($validation);
        return response([
            'message' => 'Short added Successfully',
          ],201);
    }
    public function editShort(Request $request){

        $validation=  $request->validate([
            'board'     => 'required',
            'std'     => 'required',
            'question' => 'required',
            'answer'   => 'required',

           ]);

                   $validation['board'] =  $request->board;
                   $validation['std'] =  $request->std;
                   $validation['question'] = $request->question;
                   $validation['answer'] =  $request->answer;



        $bookId= DB::table('short')->where('id',$request->id)->update($validation);
        return response([
            'message' => 'Short edited Successfully',
            ],200);
    }
    public function deleteShort(Request $request){

        $request->validate([
            'id'    => 'required',

         ]);
         $current_timestamp = Carbon::now();

         DB::table('short')->where('id',$request->id)->update(array('deleted_at' =>  $current_timestamp));;
        return response([
            'message' => 'Successfully Deleted',
            ],200);
    }
}
