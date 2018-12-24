<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/17
 * Time: 10:52
 */
namespace app\index\validate;
use think\Validate;
class PostsValidate extends Validate
{
    protected $rule = [
        'nickName'  =>  'require|max:15',
        'trueName'  =>  'require|max:15',
        'towho'  =>  'require|max:15',
        'contents'  =>  'require|max:520',
    ];

    protected $message = [
        'nickName.require'  =>  '昵称未填~',
        'nickName.max'  =>  '昵称限制在15字符内！',
        'towho.max'  =>  'TA的名字限制在15字符内！',
        'trueName.max'  =>  '真实名字限制在15字符内！',
        'trueName.require'  =>  '请填写你的真实姓名哦~<br><a target="_blank" href="/help">为什么要填真实姓名?</a>',
        'towho.require'  =>  'TA的名字未填~',
        'contents.require'  =>  '表白的内容未填~',
        'contents.max'  =>  '表白的内容限制在520字符内！',
    ];

}