<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BookController extends Controller
{
    public function getBooks(){
        $skip= (int) request()->skip ?? 0;
        $limit = request()->limit ?? 10;
        $orderBy =request()->orderBy ?? "id";
        $ascending= request()->ascending ?? 'ASC';
        $search= request()->search ?? '';

        $books = DB::table('books')->where('deleted_at')->where(

            function($query) use ($search){
                return $query
                ->orWhere('name','like', '%'. $search . '%')
                ->orWhere('std','like', '%'. $search . '%');
            }
        )->orderBy($orderBy,$ascending)->skip($skip)->take($limit)->get();

        return   response([
            'books' => $books,
            ],200);
    }
    public function addBook(Request $request){
        $pdf= '';
        $coverImage = '';
        $validation=  $request->validate([
           'name'    => 'required',
            'std'    => 'required',
            'board'      => 'required',
           'pdf_link' => 'required',
            'cover_link' => 'required',
         ]);
         if($request->cover_link->isValid()){
            $coverImage =  $request->file('cover_link')->store('cover_link');
        }
        if($request->pdf_link->isValid()){
            $pdf= $request->file('pdf_link')->store('pdf_link');
        }


                 $validation['name'] =  $request->name;
                 $validation['std'] = $request->std;
                 $validation['board'] = $request->board;
                 $validation['pdf_link'] = $pdf;
                 $validation['cover_link'] = $coverImage;


   $bookId= DB::table('books')->insertGetId($validation);
        return response([
            'message' => 'Books added Successfully',
          ],201);
    }
    public function editBook(Request $request){

        $request->validate([
            'id'    => 'required',
            'name'    => 'required',
            'std'    => 'required',
            'board'      => 'required',
            'pdf_link' => 'required',
            'cover_link' => 'required',

         ]);

         $validation['name'] =  $request->name;
         $validation['std'] = $request->std;
         $validation['board'] = $request->board;
         $validation['pdf_link'] = $request->pdf_link;
         $validation['cover_link'] = $request->cover_link;

        $bookId= DB::table('books')->where('id',$request->id)->update($validation);
        return response([
            'message' => 'Books edited Successfully',
            ],200);
    }
}
