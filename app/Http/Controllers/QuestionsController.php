<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class QuestionsController extends Controller
{
    public function getQuestions(Request $request){ // $user = $request->user();
        $mcq = DB::table('mcq')->where('deleted_at', null)->get()->map(function ($item) {
            $item->type = 'mcq';
            return $item;
        });

        $long = DB::table('long')->where('deleted_at', null)->get()->map(function ($item) {
            $item->type = 'long';
            return $item;
        });

        $short = DB::table('short')->where('deleted_at', null)->get()->map(function ($item) {
            $item->type = 'short';
            return $item;
        });

        $truefalse = DB::table('true_false')->where('deleted_at', null)->get()->map(function ($item) {
            $item->type = 'true&false';
            return $item;
        });

        $onetwo = DB::table('onetwo')->where('deleted_at', null)->get()->map(function ($item) {
            $item->type = 'onetwo';
            return $item;
        });

        $blank = DB::table('blanks')->where('deleted_at', null)->get()->map(function ($item) {
            $item->type = 'blank';
            return $item;
        });

        $combinedResults = $mcq->concat($long)->concat($short)->concat($truefalse)->concat($onetwo)->concat($blank);

        return response($combinedResults, 200);
    }


}
