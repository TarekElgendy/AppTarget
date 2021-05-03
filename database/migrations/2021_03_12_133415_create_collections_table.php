<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCollectionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('collections', function (Blueprint $table) {
            $table->increments('id');
            $table->string('status')->default('active');
            $table->string('image')->default('default.png');
            $table->double('price')->default(0);


            $table->integer('program_id')->unsigned();
            $table->foreign('program_id')->references('id')->on('programs')->onDelete('cascade');

            $table->boolean('isBreakfast')->default(0);
            $table->boolean('isDinner')->default(0);
            $table->boolean('isLaunch')->default(0);

            $table->integer('numberSnaks')->default(0);


            $table->integer('day_id')->unsigned();
            $table->foreign('day_id')->references('id')->on('days')->onDelete('cascade');

            $table->integer('promo_code_id')->nullable();
 




            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('collections');
    }
}
