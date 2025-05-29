<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddTypeToListingsTable extends Migration
{
    public function up()
    {
        Schema::table('listings', function (Blueprint $table) {
            $table->string('type')->nullable()->after('title'); // e.g., apartment, house
        });
    }

    public function down()
    {
        Schema::table('listings', function (Blueprint $table) {
            $table->dropColumn('type');
        });
    }
}
