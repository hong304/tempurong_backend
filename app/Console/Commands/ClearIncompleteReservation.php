<?php

namespace App\Console\Commands;

use App\Http\Controllers\ReservationController;
use App\Models\Reservation;
use Illuminate\Console\Command;

class ClearIncompleteReservation extends Command
{
	/**
	 * The name and signature of the console command.
	 *
	 * @var string
	 */
	protected $signature = 'clear:reservation';
	
	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'Remove incomplete reservation after a certain time';
	
	/**
	 * Create a new command instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		parent::__construct();
	}
	
	/**
	 * Execute the console command.
	 *
	 * @return mixed
	 */
	public function handle()
	{
		$reservationControl = new ReservationController();
		$reservationControl->deleteInvalidReservation();
	}
}
