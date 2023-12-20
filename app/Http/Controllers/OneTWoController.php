<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OneTWoController extends Controller
{
    public function getOneTwo(){
        $skip= (int) request()->skip ?? 0;
        $limit = request()->limit ?? 10;
        $orderBy =request()->orderBy ?? "id";
        $ascending= request()->ascending ?? 'ASC';
        $search= request()->search ?? '';

        $onetwo = DB::table('onetwo')->where('deleted_at',null)->where(

            function($query) use ($search){
                return $query
                ->orWhere('question','like', '%'. $search . '%')
                ->orWhere('answer','like', '%'. $search . '%')
               ;
            }
        )->orderBy($orderBy,$ascending)->skip($skip)->take($limit)->get();

        return response([
            'questions' => $onetwo,
            ],200);
    }
    public function addOneTwo(Request $request){

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



   $bookId= DB::table('onetwo')->insertGetId($validation);
        return response([
            'message' => 'OneTwo added Successfully',
          ],201);
    }
    public function editOneTwo(Request $request){

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



        $bookId= DB::table('onetwo')->where('id',$request->id)->update($validation);
        return response([
            'message' => 'OneTwo edited Successfully',
            ],200);
    }
    public function deleteOneTwo(Request $request){

        $request->validate([
            'id'    => 'required',

         ]);
         $current_timestamp = Carbon::now();

         DB::table('onetwo')->where('id',$request->id)->update(array('deleted_at' =>  $current_timestamp));;
        return response([
            'message' => 'Successfully Deleted',
            ],200);
    }
}
