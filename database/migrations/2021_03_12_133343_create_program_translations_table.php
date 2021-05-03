<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProgramTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('program_translations', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title');
            $table->text('short_description')->nullable();
            $table->text('description')->nullable();
            $table->text('extra_description')->nullable();
            $table->string('locale')->index();
            $table->integer('program_id')->unsigned();
            $table->unique(['program_id', 'locale']);
            $table->foreign('program_id')->references('id')->on('programs')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('program_translations');
    }
}
