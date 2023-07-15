<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class UserController extends Controller
{
    //

    public function getCartItems(Request $request)
    {
        $result = DB::table('cart')
            ->select('*', 'cart.id as cartid')
            ->join('products', 'products.id', '=', 'cart.productid')
            ->where('userid', $request->loginid)
            ->get();

        echo json_encode($result);
    }

    public function createOrder(Request $request)
    {
        $cartitems = DB::table('cart')->where(
            [
                'userid' => $request->userid,
                'status' => 0
            ]
        )->get();

        $insert_array = $request->all();

        foreach ($cartitems as $key => $value) {

            $insert_array['productid'] = $value->productid;
            $insert_array['price'] = $value->price;
            DB::table('orders')->insert($insert_array);
        }

        $cartitems = DB::table('cart')->where(
            [
                'userid' => $request->userid,
                'status' => 0
            ]
        )->update(['status' => 1]);

        echo json_encode('success');


    }

    public function getOrders(Request $request)
    {
        $result = DB::table('orders')
            ->join('products', 'products.id', '=', 'orders.productid')
            ->where('userid', $request->userid)
            ->get();

        echo json_encode($result);
    }
    public function getDistributorOrders(Request $request)
    {
        $result = DB::table('orders')
            ->select('*', 'orders.id as orderid')
            ->join('products', 'products.id', '=', 'orders.productid')
            ->join('user', 'user.loginid', '=', 'orders.userid')
            ->where('distributorid', $request->id)
            ->get();

        echo json_encode($result);
    }
    public function getTurfBooking(Request $request)
    {
        $result = DB::table('turfbooking')
            ->join('turf', 'turf.loginid', '=', 'turfbooking.turfid')
            ->where('userid', $request->userid)
            ->get();

        echo json_encode($result);
    }

    public function getTurfBookingForTurf(Request $request)
    {
        $result = DB::table('turfbooking')
            ->select('*', 'turfbooking.id as bookingid')
            ->join('user', 'user.loginid', '=', 'turfbooking.userid')
            ->where('turfid', $request->id)
            ->get();

        echo json_encode($result);
    }

    public function getFeedbacks(Request $request){
        $result = DB::table('feedback')
        ->select('*','feedback.id as fid')
        ->join('user','user.loginid','=','feedback.userid')
        ->get();
        echo json_encode($result);
    }


    public function getComplaints(Request $request){
        $result = DB::table('complaints')
        ->select('*', 'complaints.id as complaintid', 'turf.username as turfname', 'user.username as username')
        ->join('user','user.loginid', '=', 'complaints.userid')
        ->join('turf', 'complaints.turfid', '=', 'turf.id')
        ->get();
        echo json_encode($result);
    }

   /*  public function getComplaintbById(Request $request) {
        $result = BD::table('complaints')
        ->select('*', 'complaints.id as complaintid')
        ->join('user', 'user.loginid', '=', 'complaints.userid')
        ->first();
        echo json_encode($result);
    } */

    public function getAllTournaments(Request $request) {
        $result = DB::table('tournaments')
        ->select('*', 'tournaments.id as tournamentid')
        ->join('turf', 'turf.loginid', '=', 'tournaments.turfid')
        ->get();
        echo json_encode($result);
    }

    public function getTournamentById(Request $request) {
        $result = DB::table('tournaments')
        ->select('*', 'tournaments.id as tournamentid')
        ->join('turf', 'turf.loginid', '=', 'tournaments.turfid')
        ->where('tournaments.id', $request->id)
        ->first();
        echo json_encode($result);
    }

    public function getTournamentBookingsforTurf(Request $request) {
        $result = DB::table('ticketbooking')
        ->select("*", 'tournaments.id as trid', 'turf.id as tfid', 'ticketbooking.id as tbid', 'userid as usid', 'turf.username as turfname')
        ->join('tournaments', 'tournaments.id', '=', 'ticketbooking.tournamentid')
        ->join('turf', 'turf.id', '=', 'tournaments.turfid')
        ->join('user', 'user.loginid', '=', 'ticketbooking.userid')
        ->where('tournaments.turfid', $request->id)
        ->get();

         echo json_encode($result);
    }
     
    public function getTournamentBookingsforUser(Request $request) {
        $result = DB::table('ticketbooking')
        ->select("*", 'tournaments.id as trid', 'turf.id as tfid', 'ticketbooking.id as tbid', 'userid as usid', 'turf.username as turfname','turf.contact as turfcontact')
        ->join('tournaments', 'tournaments.id', '=', 'ticketbooking.tournamentid')
        ->join('turf', 'turf.id', '=', 'tournaments.turfid')
        ->join('user', 'user.loginid', '=', 'ticketbooking.userid')
        ->where('user.id', $request->id)
        ->orderBy('ticketbooking.id')
        ->get();

         echo json_encode($result);
    }
     

}