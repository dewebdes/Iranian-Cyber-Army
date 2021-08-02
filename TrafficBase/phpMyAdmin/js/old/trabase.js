jQuery(document).ready(function () {


    $('#pmalogo').after('<input value="Setup Page" type="button" style="" onclick      ​="setpageup();">');


});


var curow;


function setpageup() {


    $(".table_results tr").on("contextmenu", function (event) {


        var dlft = (event.pageX - $($('.data')[0]).position().left);


        var dtop = (event.pageY - $($('.data')[0]).position().top);


        curow = $(this);


        var menu = '<div class="cList cListx" style="left: ' + dlft + 'px; top: ' + dtop + 'px;"><div class="lDiv"><div><input type="checkbox" checked="checked"><input value="Act to ROW" type="button" style="" onclick      ​="rowact1();"></div><div class="showAllColBtn">Show all</div></div>';


        $('.cListx').remove();


        $($('.data')[0]).append($(menu));


        return false;


    });


}


function rowact1() {


    var did = $($($(curow).find('td'))[4]).text();


    var tbl = getQueryStringValue('table');


    $('.cListx').remove();


    alert(tbl + " > " + did);


}


function getQueryStringValue(name) {


    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");


    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),


    results = regex.exec(location.search);


    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));


}
