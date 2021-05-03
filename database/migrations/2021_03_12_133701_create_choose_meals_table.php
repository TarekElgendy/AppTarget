<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateChooseMealsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('choose_meals', function (Blueprint $table) {
            $table->increments('id');
            $table->date('date');


            $table->integer('customer_id')->unsigned();
            $table->foreign('customer_id')->references('id')->on('customers')->onDelete('cascade');



            $table->integer('subscribe_id')->unsigned();
            $table->foreign('subscribe_id')->references('id')->on('subscribes')->onDelete('cascade');


            $table->integer('breakfast_id')->unsigned();
            $table->foreign('breakfast_id')->references('id')->on('breakfasts')->onDelete('cascade');

            $table->text('breakfastNotes')->nullable();

            $table->integer('dinner_id')->unsigned();
            $table->foreign('dinner_id')->references('id')->on('dinners')->onDelete('cascade');

            $table->text('dinnerNotes')->nullable();

            $table->integer('launche_id')->unsigned();
            $table->foreign('launche_id')->references('id')->on('launches')->onDelete('cascade');
            $table->text('launcheNotes')->nullable();

            $table->integer('snack_id')->unsigned();
            $table->foreign('snack_id')->references('id')->on('snacks')->onDelete('cascade');
            $table->text('snackNotes')->nullable();










            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('choose_meals');
    }
}
