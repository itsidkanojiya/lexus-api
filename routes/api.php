<?php

use App\Http\Controllers\AnalysisController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BlankController;
use App\Http\Controllers\BoardController;
use App\Http\Controllers\BookController;
use App\Http\Controllers\LongController;
use App\Http\Controllers\McqController;
use App\Http\Controllers\OneTWoController;
use App\Http\Controllers\PaperController;
use App\Http\Controllers\QuestionsController;
use App\Http\Controllers\ShortController;
use App\Http\Controllers\SolutionController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\SubjectController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\TrueFalseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

//Auth
Route::post('/register', [AuthController::class, 'Register']);
Route::post('/login', [AuthController::class, 'Login']);
Route::post('/verify-token', [AuthController::class, 'verifyToken'])->middleware('auth:sanctum');


//Analytics
Route::get('/teacher-analysis', [AnalysisController::class, 'getTeacherAnalysis'])->middleware('auth:sanctum');
Route::get('/student-analysis', [AnalysisController::class, 'getStudentAnalysis'])->middleware('auth:sanctum');
Route::get('/question-analysis', [AnalysisController::class, 'getQuestionAnalysis'])->middleware('auth:sanctum');


//Teacher
Route::post('/teacher-register', [TeacherController::class, 'teacherRegister']);
Route::get('/activate-teacher', [TeacherController::class, 'getActiveTeacher'])->middleware('auth:sanctum');
Route::get('/pending-teacher', [TeacherController::class, 'getPendingTeacher'])->middleware('auth:sanctum');
Route::put('/make-activate', [TeacherController::class, 'makeActivate'])->middleware('auth:sanctum');
Route::put('/make-deactivate', [TeacherController::class, 'makeDeactivate'])->middleware('auth:sanctum');
Route::delete('/delete-teacher', [TeacherController::class, 'deleteTeacher'])->middleware('auth:sanctum');


//Student
Route::post('/student-register', [StudentController::class, 'studentRegister']);
Route::get('/students', [StudentController::class, 'getStudent'])->middleware('auth:sanctum');
Route::delete('/delete-student', [StudentController::class, 'deleteStudent'])->middleware('auth:sanctum');


//Book
Route::post('/add-book', [BookController::class, 'addBook']);
Route::post('/edit-book', [BookController::class, 'editBook']);
Route::get('/books', [BookController::class, 'getBooks']);


//Paper
Route::post('/add-paper', [PaperController::class, 'addPaper']);
Route::get('/paper', [PaperController::class, 'getPaper']);

//Solution
Route::post('/add-solution', [SolutionController::class, 'addSolution']);
Route::post('/edit-solution', [SolutionController::class, 'editSolution']);
Route::get('/solutions', [SolutionController::class, 'getSolutions']);


//Board
Route::post('/add-board', [BoardController::class, 'addBoard'])->middleware('auth:sanctum');;
Route::post('/edit-board', [BoardController::class, 'editBoard'])->middleware('auth:sanctum');;
Route::get('/board', [BoardController::class, 'getBoard']);


//Subject
Route::post('/add-subject', [SubjectController::class, 'addSubject']);
Route::post('/edit-subject', [SubjectController::class, 'editSubject']);
Route::get('/subject', [SubjectController::class, 'getSubject']);



//Quetions

Route::get('/get-questions', [QuestionsController::class, 'getQuestions']);

//Mcq
Route::post('/add-mcq', [McqController::class, 'addMcq'])->middleware('auth:sanctum');
Route::post('/edit-mcq', [McqController::class, 'editMcq'])->middleware('auth:sanctum');
Route::get('/mcq', [McqController::class, 'getMcq']);
Route::delete('/delete-mcq', [McqController::class, 'deleteMcq'])->middleware('auth:sanctum');

//TrueorFlase
Route::post('/add-truefalse', [TrueFalseController::class, 'addTrueFalse'])->middleware('auth:sanctum');
Route::post('/edit-truefalse', [TrueFalseController::class, 'editTrueFalse'])->middleware('auth:sanctum');
Route::get('/true-false', [TrueFalseController::class, 'getTrueFalse']);
Route::delete('/delete-truefalse', [TrueFalseController::class, 'deleteTrueFalse'])->middleware('auth:sanctum');

//Blank
Route::post('/add-blank', [BlankController::class, 'addBlank'])->middleware('auth:sanctum');
Route::post('/edit-blank', [BlankController::class, 'editBlank'])->middleware('auth:sanctum');
Route::get('/blank', [BlankController::class, 'getBlank']);
Route::delete('/delete-blank', [BlankController::class, 'deleteBlank'])->middleware('auth:sanctum');

//Short
Route::post('/add-short', [ShortController::class, 'addShort'])->middleware('auth:sanctum');
Route::post('/edit-short', [ShortController::class, 'editShort'])->middleware('auth:sanctum');
Route::get('/short', [ShortController::class, 'getShort']);
Route::delete('/delete-short', [ShortController::class, 'deleteShort'])->middleware('auth:sanctum');

//Long
Route::post('/add-long', [LongController::class, 'addLong'])->middleware('auth:sanctum');
Route::post('/edit-long', [LongController::class, 'editLong'])->middleware('auth:sanctum');
Route::get('/long', [LongController::class, 'getLong']);
Route::delete('/delete-long', [LongController::class, 'deleteLong'])->middleware('auth:sanctum');

//OneTwo
Route::post('/add-onetwo', [OneTWoController::class, 'addOneTwo'])->middleware('auth:sanctum');
Route::post('/edit-onetwo', [OneTWoController::class, 'editOneTwo'])->middleware('auth:sanctum');
Route::get('/onetwo', [OneTWoController::class, 'getOneTwo']);
Route::get('/delete-onetwo', [OneTWoController::class, 'deleteOneTwo'])->middleware('auth:sanctum');


// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {

// });


