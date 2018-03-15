define('main', function (using) {
    var slide = using('ui/slide');
    init();
    function init() {
        slide('#photo_slide', {
            continuousScroll: true,
            speed: 5000,
            lazyLoad: true,
            transitionType: 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',
            firstCallback: function (i, sum, me) {
                photoNums = me.find('ul').children().length;
                setPhotoNum(1);
            },
            callback: function (i, sum, me) {
                setPhotoNum(i + 1);
            }
        });
    }
    function setPhotoNum(index) {
        $('.num_pics').text(index + '/' + photoNums);
    }
    $('.nav').on('click','span',function(){
        var index=$(this).index();
        $(this).parent().children('.sel').removeClass('sel');
        $(this).addClass('sel');
        $('.choose').children('.active').removeClass('active');
        $('.choose').children().eq(index).addClass('active');
    });
    $('.closeApp').on('click',function(){
        $('.ad_title').css('display','none');
    })
});