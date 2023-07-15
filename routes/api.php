<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UtilController;
use App\Http\Controllers\UserController;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// UtilController

Route::post('save', [UtilController::class, 'save']);
Route::post('saveuser', [UtilController::class, 'saveuser']);
Route::post('update', [UtilController::class, 'update']);
Route::post('getall', [UtilController::class, 'getAll']);
Route::post('getbyid', [UtilController::class, 'getById']);
Route::post('getbydata', [UtilController::class, 'getByData']);
Route::post('delete', [UtilController::class, 'delete']);
Route::post('deleteuser', [UtilController::class, 'deleteUser']);
Route::post('getuserbyid', [UtilController::class, 'getUserById']);
Route::post('updateuser', [UtilController::class, 'updateUser']);
Route::post('login', [UtilController::class, 'Login']);

Route::post('fileupload', [UtilController::class, 'fileupload']);



//UserController


Route::post('getcartitems', [UserController::class, 'getCartItems']);
Route::post('createorder', [UserController::class, 'createOrder']);
Route::post('getorders', [UserController::class, 'getOrders']);
Route::post('getdistributororders', [UserController::class, 'getDistributorOrders']);
Route::post('getturfbooking', [UserController::class, 'getTurfBooking']);
Route::post('getturfbookingforturf', [UserController::class, 'getTurfBookingForTurf']);
Route::post('getfeedbacks', [UserController::class, 'getFeedbacks']);
Route::post('getcomplaints', [UserController::class, 'getComplaints']);
Route::post('getcomplaintbyid', [UserController::class, 'getComplaintbById']);

Route::post('getalltournaments', [UserController::class, 'getAllTournaments']);
Route::post('gettournamentbyid', [UserController::class, 'getTournamentById']);

Route::post('getTournamentBookingsforTurf', [UserController::class, 'getTournamentBookingsforTurf']);
Route::post('getTournamentBookingsforUser', [UserController::class, 'getTournamentBookingsforUser']);