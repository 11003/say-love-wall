<?php

namespace filter;
/**
 * 从内容中过滤出img
 * Class FilterContentsEmoji
 * @package filter
 */
class FilterContentsEmoji
{
    public static function getFilterContents($content){
        $img_arr = self::get_html_attr_by_tag($content);
        if(is_array($img_arr)) {
            $img_str = implode('',$img_arr);
        }
        $content = self::del_img($content) . $img_str;
        return $content;
    }

    public static function get_html_attr_by_tag($content="",$attr="src",$tag="img")
    {
        $arr = array();
        $attr = explode(',', $attr);
        $tag = explode(',', $tag);
        foreach ($tag as $i => $t) {
            foreach ($attr as $a) {
                preg_match_all("/<\s*" . $t . "\s+[^>]*?" . $a . "\s*=\s*(\'|\")(.*?)\\1[^>]*?\/?\s*>/i", $content, $match);
                foreach ($match[2] as $n => $m) {
                    $arr[$n] = "<img src='{$m}'>";
                }
            }
        }
        return $arr;//array
    }
    public static function del_img($str){
        $str = preg_replace('~<img(.*?)>~s','',$str);
        return $str;
    }
}
