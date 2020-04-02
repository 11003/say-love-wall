<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/15
 * Time: 22:06
 */
use PHPMailer\PHPMailer\PHPMailer;
/**
 * 发送邮件
 */
function send_email($address,$uid)
{
    $smtpSetting = config('smtp_setting');

    $mail        = new PHPMailer();
    // 设置PHPMailer使用SMTP服务器发送Email
    $mail->IsSMTP();
    $mail->IsHTML(true);
    $mail->SMTPAuth = true;
    //$mail->SMTPDebug = 3;
    // 设置邮件的字符编码，若不指定，则为'UTF-8'
    $mail->CharSet = 'UTF-8';
    // 添加收件人地址，可以多次使用来添加多个收件人
    $mail->AddAddress($address);
    //提交链接
    $link =$smtpSetting['link']."/id/{$uid}";
    // 组装a标签链接
//    $a_tag = "<a href='{$link}'>{$link}</a>";
    // 设置邮件正文
    $mail->Body = contents($smtpSetting['body'],$link);
    // 设置邮件头的From字段。
    $mail->From = $smtpSetting['from'];
    // 设置发件人名字
    $mail->FromName = $smtpSetting['from'];
    // 填写发送人的邮箱，和主题标题
    $mail->setFrom($smtpSetting['address'], $smtpSetting['from']);
    // 填写回复的邮箱，和主题标题
    $mail->addReplyTo($smtpSetting['address'],$smtpSetting['from']);
    // 设置邮件标题
    $mail->Subject = $smtpSetting['title'];
    // 设置SMTP服务器。
    $mail->Host ='smtp.qq.com;';
    //by Rainfer
    // 设置SMTPSecure。
    $mail->SMTPSecure = 'ssl';
    // 设置SMTP服务器端口。
    $mail->Port = "465";
    // 设置为"需要验证"
    $mail->SMTPAuth    = true;
    $mail->SMTPAutoTLS = false;
    $mail->Timeout     = 10;
    // 设置用户名和密码。
    $mail->Username = $smtpSetting['username'];
    $mail->Password = $smtpSetting['password'];
    // 发送邮件。
    if (!$mail->Send()) {
        $mailError = $mail->ErrorInfo;
        if($smtpSetting['debug']){
            echo 'Mailer Error: ' . $mailError . '<br>';
        }
        return ["error" => 1, "message" => $mailError];
    } else {
        return ["error" => 0, "message" => "success"];
    }
}

/**
 * @param $data
 * @param $time
 * @return string
 * 表白邮箱样式
 */
function contents($data,$a_tag='')
{
    return '
<div style="background: #f8f8f8; color: #666; font-size: 12px;"> 
<div style="width: 570px; margin: 0 auto; background: #FFF; padding: 25px 70px; border-top: 30px solid #DB2828;"> 
<div style="text-align: center; margin-bottom: 40px; line-height: 1.8em;"> 
<h1 style="color: #333;">你被表白啦！ヽ(✿ﾟ▽ﾟ)ノ</h1> 
</div> 
<p style="border: 1px solid #eee; padding: 20px; margin: 15px 0;font-size:16px"> '.$data.' </p>
<p class="footer" style="padding-top: 6px; margin-top: 15px; color: #838383; text-align: center;">

</p> 
<a style="display: block; width: 400px; height: 40px; background: #DB2828; margin: 25px auto 40px; font-size: 16px; line-height: 40px; letter-spacing: 3px; color: #f8f8f8; text-align: center; text-decoration: none;" href='.$a_tag.' target="_blank">查看完整內容(>▽<)~&gt;&gt;</a> <p style="text-align: center;color: #bbb;margin-top: 40px;">此邮件来自 - <a target="_blank" href="http://love.liuhai.fun/">Sonder</a> - 表白墙</p> </div> </div>';
}

/**
 * 获取客户端IP地址
 * @param integer $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
 * @param boolean $adv 是否进行高级模式获取（有可能被伪装）
 * @return string
 */
function get_client_ip($type = 0, $adv = true)
{
    return request()->ip($type, $adv);
}

/**
 * 检测与过滤服务器接收到的数据
 * @method test_input
 * @param  string     $data 传入需要检测的数据
 * @return string           返回过滤过的数据
 */
function test_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
/**
 * 统一返回信息
 * @param $code
 * @param $data
 * @param $msge
 */
function msg($code, $data, $msg)
{
    return compact('code', 'data', 'msg');
}
