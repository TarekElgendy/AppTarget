<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePlanTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('plan_translations', function (Blueprint $table) {
            $table->increments('id');

            $table->string('title')->nullable();
            $table->text('short_description')->nullable();
            $table->text('description')->nullable();


            $table->string('locale')->index();

            $table->integer('plan_id')->unsigned();
            $table->unique(['plan_id', 'locale']);
            $table->foreign('plan_id')->references('id')->on('plans')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('plan_translations');
    }
}
