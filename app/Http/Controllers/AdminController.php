<?php

namespace App\Http\Controllers;

use App\Models\Reservation;

class AdminController extends Controller
{
    public function getOrderHistory()
    {
        try {

            $result = Reservation::select('first_name','last_name','email','check_in','check_out','guests','amount','created_at','status')->paginate(30);

        } catch (\Exception $e) {
            $result = [
                'status' => false,
                'code' => $e->getCode(),
                'message' => $e->getMessage()
            ];

            return response()->json($result, 500);
        }

        return response()->json($result);
    }
}
