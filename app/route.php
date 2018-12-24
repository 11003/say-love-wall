<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;

Route::get('/','index/Index/index');
Route::get('/saylove','index/Saylove/index');
Route::any('/search','index/Index/search',['method'=>'get|post']);
Route::get('/help','index/Index/help');
Route::rule('/share/id/:id','index/Saylove/share');
Route::post('/action','index/Saylove/action');
Route::post('/liked','index/Saylove/liked');
Route::post('/guess','index/Saylove/guess');
Route::rule('/comment','index/Comment/comment');
Route::post('/commentpost','index/Comment/commentPost');
Route::post('/appeal','index/Blacklist/appealPost');
Route::rule('/uploadloveImg','index/Saylove/uploadloveImg');


return [
    '__pattern__' => [
        'name' => '\w+',
    ],
    '[hello]'     => [
        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
        ':name' => ['index/hello', ['method' => 'post']],
    ],
];