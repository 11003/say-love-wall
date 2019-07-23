$(document).ready(function() {

    $.getJSON("https://v1.hitokoto.cn/?c=b",function(res){
        $("<span>").text(res.hitokoto).appendTo('#shici');
    });

    $("#submit").click(function(event) {
        var nickName = words_cut($("#nickName").val(), 30);
        var trueName = words_cut($("#trueName").val(), 30);
        var towho = words_cut($("#towho").val(), 30);
        var email = words_cut($("#email").val(), 30);
        var emailType = $("#emailType").val();
        var contents = $("#contents").val();
        var gender = $("#genderType").val();
        var itsGender = $("#itsGenderType").val();
        // 图片
        var loveImage = $("#image")[0].files[0];
        // console.log(loveImage);
        if (email != "") {
            //拼接
            email += emailType;
        } else {
            email = "";
        }


        var formData = new FormData();

        formData.append('nickName',nickName);
        formData.append('trueName',trueName);
        formData.append('towho',towho);
        formData.append('email',email);
        formData.append('contents',contents);
        formData.append('gender',gender);
        formData.append('itsGender',itsGender);
        formData.append('loveImage',loveImage);

        $("#Hint").text('');
        $("#submit").text('提交中...').attr('disabled',true);
        $.ajax({
            url: "/action",
            type: "POST",
            dataType: "json",
            data:formData,
            contentType: false,
            processData:false,  // 不加就会出现illegal invocation"非法引援"
            cache:false,
            success:function(result){

                if(1 == result.code){
                    $("#nickName").val('');
                    $("#trueName").val('');
                    $("#towho").val('');
                    $("#email").val('');
                    $("#contents").val('');
                    $("#Hint").html(result.msg);
                    // layer.msg(result.msg, {icon: 1,time:2000, shade: 0.5});
                    // setTimeout(function() {
                    //         // window.location.href="/";
                    //         window.location.reload();
                    //     },
                    // 2300);
                }
                $("#submit").text('提交').remove('disabled');
                $("#Hint").html(result.msg);

                // console.log(result);
            },
        })

    });


    // 申诉提交
    $("#appeal-submit").click(function(){
        var appeal = $("#appeal-input").val();
        var uip = $("#ip").val();
        var id = $("#Hint").children('a').data('post');
        if(appeal!= ''){
            $("#appeal-submit").text('提交中...').attr('disabled',true);
            $.ajax({
                url: "/appeal",
                type: "POST",
                dataType: "json",
                data: {content:appeal,ip:uip,id:id},
                success:function(result){

                    if(1 == result.code){
                        $("#appeal-input").val('');
                        $("#appeal-hint").html(result.msg);
                    }
                    $("#appeal-submit").text('发布表白').remove('disabled');
                    $("#appeal-hint").html(result.msg);

                    // console.log(result);
                },
            });
        }
    });


});




function words_deal()
{
    var curLength=$("#contents").val().length;
    if(curLength>520)
    {
        var num=$("#contents").val().substr(0,520);
        $("contents").val(num);
    }
    else
    {
        $("#textCount").text(520-$("#contents").val().length);
    }
}

function words_cut(sentences, lengthCut) {
    if (sentences.length > lengthCut) {
        return sentences.substr(0,lengthCut);
    }else{
        return sentences;
    }
}



// 启用与关闭邮件通知
$("#switch").change(function(event) {
    // console.log(event);
    // console.log($(this));
});

$("#switch").click(function(event) {
    // console.log($(this));
});

function openEmailNotice() {
    var status = $("#switch:checked").val();
    var $this = $("#email-box");
    if (status == "on") {
        $($this).css('display', 'block');
    }else{
        $($this).css('display', 'none');
        $("#email").val('');  // 选择关闭后清空邮箱
    }
}