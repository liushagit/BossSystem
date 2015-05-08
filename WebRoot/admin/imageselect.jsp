<%@ page contentType="text/html; charset=GBK" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">  
    <head>  
        <!--<base href="http://localhost:88/dojodemo/" />  -->
        <title>¼ô²Ã</title>  
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
        <style type="text/css">  
                em {background: url(http://static.l99.com/skin/default/images/miniblog/hover.png) no-repeat;width:180px;height:60px;position:absolute;top:-85px;left:-85px;text-align:center;padding: 10px 12px 10px;font-style:normal;z-index:2;display:none;}   
                em button {background-color:#CCCCCC;border:1px solid #999999;color:#000000;cursor:pointer;font-size:12px;height:20px;width:50px;}   
                .adelete{position:relative;}   
                div.imgcutDiv {margin: 30px auto;width: 320px;text-align: center;}   
                div.imgcutDiv a {margin:0 10px;float:left;}                
        </style>  
    </head>  
  
    <body>  
        <div class="tagBt_down">  
            <div class="con_title">  
                        ¼ô²ÃÍ·Ïñ   
            </div>  
            <div class="con_fill">  
                <div class="container">  
                            <p>  
                                <img id="ferret" src="/images/1510243_200807062233495.jpg"  
                                    alt="loading IMG ......"  
                                    title="image select"  
                                    style="float: left; margin-right: 10px;"/>  
                            </p>  
                </div>  
  
                <div class="clear"></div>  
                <div class="imgcutDiv">  
                        <form action="cutImg.action" method="post" id="cutImgForm">  
                            <input type="hidden" id="cutImageW"  name="imgWidth" />  
                            <input type="hidden" id="cutImageH"  name="imgHeight" />  
                            <input type="hidden" id="cutImageX"  name="imgTop" />  
                            <input type="hidden" id="cutImageY"  name="imgLeft" />                                                                                           
                            <input type="hidden" value="avatars.id" name="avatarsId" />                                  
                            <a id="img_cut_fb" href="javascript:void(0);" class="bt_22">È·ÈÏ¼ô²Ã</a>  
                            <a href="javascript:history.go(-1);" class="bt_2">È¡Ïû¼ô²Ã</a>  
                        </form>  
                </div>  
            </div>  
        </div>  
            <script type="text/javascript" src="js/jquery-1.2.6.js?ver=20080814"></script>  
            <script type="text/javascript" src="js/jquery.imgareaselect-0.5.js?ver=20080913"></script>  
            <script type="text/javascript">  
                var imageW = 537;   
                var imageH = 681;   
                function preview(img, selection){    
                    showCut(selection.width,selection.height,selection.x1,selection.y1);   
                }   
                   
                function showCut(w,h,x,y){   
                    var scaleX = 200 / w;   
                    var scaleY = 222 / h;   
                    $('#ferret + div > img').css({ width: Math.round(scaleX * imageW) + 'px', height: Math.round(scaleY * imageH) + 'px', marginLeft: '-' + Math.round(scaleX * x) + 'px', marginTop: '-' + Math.round(scaleY * y) + 'px' });                   
                    $('input#cutImageW').val(w);   
                    $('input#cutImageH').val(h);   
                    $('input#cutImageX').val(x);   
                    $('input#cutImageY').val(y);   
                }   
                   
                $(document).ready(function () {   
                    $('<div><img src="/images/1510243_200807062233495.jpg" style="position: relative;" /></div>')   
                    .css({ float: 'left', position: 'relative', overflow: 'hidden', width: '200px', height: '222px' })   
                    .insertAfter($('#ferret'));   
                       
                    imageW = $('#ferret + div > img').width();   
                    imageH = $('#ferret + div > img').height();   
                       
                    $("form > a#img_cut_fb").click(function(){   
                        if(confirm('È·ÈÎ¼ôÇÐÂð£¿')){   
                            alert("width: " + $('input#cutImageW').val() + "height: " + $('input#cutImageH').val() + "left: " + $('input#cutImageX').val() + "top: " + $('input#cutImageY').val());   
                        }   
                    });   
                });    
                    
                $(window).load(function () {   
                   $('img#ferret').imgAreaSelect({ selectionOpacity: 0,minWidth:90,minHeight:100,outerOpacity:'0.5', selectionColor: 'blue', aspectRatio:'9:10',x1: 10, y1: 10, x2: 100, y2: 110,onSelectChange: preview });   
                   showCut(90,100,10,10);   
                 });   
            </script>  
    </body>  
</html>  