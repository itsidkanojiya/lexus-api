<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LongController extends Controller
{
    public function getLong(){
        $skip= (int) request()->skip ?? 0;
        $limit = request()->limit ?? 10;
        $orderBy =request()->orderBy ?? "id";
        $ascending= request()->ascending ?? 'ASC';
        $search= request()->search ?? '';

        $long = DB::table('long')->where('deleted_at',null)->where(

            function($query) use ($search){
                return $query
                ->orWhere('question','like', '%'. $search . '%')
                ->orWhere('answer','like', '%'. $search . '%');

            }
        )->orderBy($orderBy,$ascending)->skip($skip)->take($limit)->get();

        return response([
            'questions' => $long,
            ],200);
    }
    public function addLong(Request $request){

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



   $bookId= DB::table('long')->insertGetId($validation);
        return response([
            'message' => 'Long added Successfully',
          ],201);
    }
    public function editLong(Request $request){

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



        $bookId= DB::table('long')->where('id',$request->id)->update($validation);
        return response([
            'message' => 'Long edited Successfully',
            ],200);
    }
      public function deleteLong(Request $request){

        $request->validate([
            'id'    => 'required',

         ]);
         $current_timestamp = Carbon::now();

         DB::table('long')->where('id',$request->id)->update(array('deleted_at' =>  $current_timestamp));;
        return response([
            'message' => 'Successfully Deleted',
            ],200);
    }
}
