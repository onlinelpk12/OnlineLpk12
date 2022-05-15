// !!! all menu-toggle function has to be removed from navbar-response.js if using this resizer. !!!
$(document).ready(function() {
    $('#column-resizer').mousedown(function(e) {
        $('body').css('cursor', 'col-resize');

        e.preventDefault();
        $(document).mousemove(function(e) {
            var position = e.pageX;                   
                    
            var mousePercent = (position / ($('#page-content-wrapper').width()) * 100);
            var mousePercent1 = mousePercent;
            
            if(mousePercent >= 5 && mousePercent <= 95) {
                $('#editor').css('width', (mousePercent - 2.9) + '%');
                $('#results').css('width', (100-mousePercent-2.9) + '%');
                $('#column-resizer').css('left', $('#editor').width() + 12 + 'px');

                if(mousePercent <= 10) {
                    $('#editor').css('width', (10 - 2.9) + '%');
                    $('#results').css('width', (100 - 10) + '%');
                    $('#column-resizer').css('left', (10 - 1.8) + '%');
                } else if(mousePercent >= 90) {
                    $('#editor').css('width', (90 - 2.9) + '%');
                    $('#results').css('width', (100 - 90) + '%');
                    $('#column-resizer').css('left', (90 - 1.8) + '%');
                }
            }
        });
        $(document).mouseup(function(e) {
            $(document).unbind('mousemove');
            $(document).unbind('mouseup');

            $('body').css('cursor', '');
        });
    });

        $( window ).resize(function() {
            var percent1 = (($('#editor').width())+262)*100 / ($('#page-content-wrapper').width());
            var percent2 = (($('#editor').width()+12))*100 / ($('#page-content-wrapper').width());
            //$("#wrapper").toggleClass("toggled");
            if ($("#wrapper").hasClass("toggled") == false) {
                $('#column-resizer').css('left', $('#editor').width()+262+'px');
            } else {
                $('#column-resizer').css('left', $('#editor').width()+12+'px');
            }
            $('#results').css('width', ($('#page-content-wrapper').width() - $('#editor').width()) - 12 + 'px');
        });
        
});
