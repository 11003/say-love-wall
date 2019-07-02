$(document).ready(function() {

    var msg = [
        "愿无岁月可回首，且以深情共白头。",
        "只为爱你 不图任何 每个晚安都是肺腑 格格安好便是晴天——《云烟成雨》",
        "我跨了两个省，去找我一直心爱的姑娘，满怀欣喜的在前天跨年那一晚亲口跟她说了我爱你，然后她拒绝了我。天黑了，在一个陌生的城市路上找不到方向，离火车开动还有15分钟。这是我第一次来郑州，也是我最后一次吧。-1°，多云，大风。——《纸短情长》",
        "花了八秒删了你的联系方式花了八分钟删了所有的聊天记录花了八小时扔掉了所有与你有关的东西花了八天才静下来花了八个月才开始忘记你结果你一个电话说了一句 在吗所有记忆全部复活。——《岁月神偷》",
        "春风十里，不如你。夏阳满山，不如你。秋雨淅淅，不如你。冬雪皑皑，不如你。我说所有的酒，都不如你。——《春风十里》",
        "总以为你是我的过客 没想到最后我才是你的过客。——《过客》",
        "那年，我17，她17。我19，她19，后来，我21，她21，我22，她21，我23，她21……。现在我23，她21。——《刚刚好》",
        "祝你们幸福是假，祝你幸福是真。",
        "枕上诗书闲处好，门前风景雨来佳。——李清照《摊破浣溪沙》",
        "You know my loneliness is only kept for you, my sweet songs are only sung for you.",
        "总有一天你会把最心痛的事当玩笑一般说出来。",
        "欲买桂花同载酒，终不似、少年游。——刘过《唐多令·芦叶满汀洲》",
        "I Don't Mind If You Don't Mind",
        "Don’t forget the things you once you owned. Treasure the things you can’t get. Don't give up the things that belong to you and keep those lost things in memory.",
        "海底月是天上月，眼前人是心上人。后来才知道，海底月捞不起，心上人不可及。",
        "“慢慢大家会明白的，无法跟喜欢的人在一起，其实是人生的常态。”——《后来》",
        "厌倦一个人晚餐，就算粗茶淡饭。——《四季》",
        "你知道深爱是什么感觉吗？就像房间突然黑了，我不是去找灯而是去找他。",
        "有些习惯是不该养成的，比如熬夜晚睡，比如等你说早安~",
        "后来我瞒着所有人，继续爱了你很久。",
        "我醉欲眠卿且去，明朝有意抱琴来。——李白《山中与幽人对酌》",
        "有多少人以朋友的名义，深深的爱着一个人……",
        "连雨不知春去，一晴方觉夏深。——范成大《喜晴》",
        "别后相思空一水，重来回首已三生。——黄景仁《感旧》",
        "酒之所以好喝，正是因为它难喝。生活之所以美好，正是因为它坎坷。",
        "世界上最美妙的感觉是：当你拥抱一个你爱的人，他竟然把你抱得更紧。",
        "是啊，你wifi在线了，应该是起床了。你4G，应该是出去了。你2G，应该是回乡下了。你又4G了，从乡下回来了，正在和朋友玩。晚上4G 了，害怕和你出去的是男生还是女生?大半夜你wifi了，应该是在家了。没显示在线了应该是睡觉了。所以，什么时候回我呢？",
        "“这个世界上什么都有用，钱有用，衣服有用，吃有用，唯独一颗真心最没用。”",
        "你好啊，陌生人，你应该很累吧！那么当你看到这句话的时候，希望能把我一部分的运气分给你，希望你能快乐。",
        "我对你仍有爱意，我对自己无能为力。",
        "是啊，你wifi在线了，应该是起床了。你4G，应该是出去了。你2G，应该是回乡下了。你又4G了，从乡下回来了，正在和朋友玩。晚上4G 了，害怕和你出去的是男生还是女生?大半夜你wifi了，应该是在家了。没显示在线了应该是睡觉了。所以，什么时候回我呢？",
        "如同从前，车、马、邮件都很慢，一生只够爱一个人。",
        "小可爱你知道吗？从遇见你的那一天起，我所走的每一步，都是为了接近你。",
        "我是个俗气至顶的人，见山是山，见海是海，见花便是花。唯独见了你，云海开始翻涌，江潮开始澎湃，昆虫的小触须挠着全世界的痒。你无需开口，我和天地万物便通通奔向你。",
      "是小女子冒犯了，不知公子已心属别家姑娘。那芳菲四月是个差错，那杯浊酒是个蹉跎。公子是我梦里的岁月，梦外却没了结果世人皆无过，是小女子不才，不得公子喜欢罢了。--《我有一个道姑朋友》",
      "到头来，我不是孙悟空，也不是至尊宝，终究成了城墙下的那群人，看着别人的爱情，咀嚼自己的青春。",
      "偷偷在草稿纸上写你名字的人是我，下雪时偷偷在雪地里写你名字的是我，对反光镜哈气写你名字的是我，为了和你偶遇不惜绕路的是我，想为你瘦下来的是我，可是不知道的是你。",
      "我真的非常喜欢别人在半夜给我发一大堆信息了，日常分享也好，吐槽什么事情也行。然后我早上醒了从上翻到下看一眼，会让我觉得，哇，我被人需要了呢。",
      "想象一下 你喜欢的人站在你面前 微微歪着头朝你笑 笑的眉眼弯弯 日光倾城 照的眼前人明媚的刚好 然后问你 你是不是喜欢我啊",
      "我其实只想和你在一起一次 哪怕只有61秒 25小时 13个月",
      "谢谢你来到我身边呀 带着山谷的风 带着原始的阳光 带着郁郁葱葱的森林 然后这些美好的物件连同你一起安放在我身边 于是就有了温暖的风吹过潮湿的森林穿越金黄色的阳光照耀在你身上 天地顿开 我一无所有 却又拥有一切",
      "明明早已百无禁忌 偏偏你是一百零一。"
      "有人问 是不是越成熟就越难爱上一个人 其实不是 只是越成熟越能看清那不是爱 ",
      "老师:思念一个人到极致是什么感觉？ 学生:……。 老师:只要岁岁平安，即使，生生不见。",
      "我喜欢我望向别处时你落在我身上的目光。",
      "人生的出场顺序太重要了。",
      "校服是我和她唯一穿过的情侣装，毕业照是我和她唯一的合影。",
      "喜欢这种东西，捂住嘴巴，也会从眼睛里跑出来。",
      "现在纯种的杀马特越来越少了，一定要顽强的活下去啊！不要让白发人送赤橙黄绿青蓝紫发人啊！",
      "喜欢一个人孤独的时刻 但不能喜欢太多。",
      "一房两人，三餐四季。 ----出自网易云音乐《给自己的歌》热评",
      "当你老了，我也老了，平行而进，平行而尽。----出自网易云音乐《当你老了》热评",
      "灯泡灭了，我仔细检查了下，钨丝并没有断。我重新按下开关， 灯泡闪了两下又灭了。我问，你怎么了，不开心么。灯泡回答，等会儿，有个蛾子在窗外看我好久了。我说，那不挺好，有人看得上你。灯泡说，我不是火，别让她看错了，误了人一辈子。----出自网易云音乐《我只在乎你》热评",
      "她的手只有我的手四分之三那么大，可我还是没能抓住。 ----出自网易云音乐《一生所爱》热评",
      "我想做一个能在你的葬礼上描述你一生的人。",
      "你那么孤独，却说一个人真好。",
      "有时候听歌被感动不是因为旋律有多棒，歌词有多好，而是因为想起了以前听这首歌时你做的事，你和谁听了这首歌。",
      "18岁的时候可以为了一个牵手激动地整夜睡不早觉，20岁的时候会为了一个谎言流泪到深夜，而现在所有事情都显得那么无关紧要。"
      "今天鼓起勇气给他发了消息，我说了一长串话，他回了个嗯。真羡慕他，这么快就放下，哪像我这么傻。",
      "爸爸妈妈问你智能手机怎么用的时候，请不要不耐烦，因为他们曾经不厌其烦的教你怎么用筷子。",
      "更多精彩,未完待续。(^_^)"
    ];
    // var alert = msg[Math.floor(Math.random() * msg.length)];
    var alert = msg[Math.random() * msg.length];
    $("<span>").text(alert).appendTo('#shici');

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