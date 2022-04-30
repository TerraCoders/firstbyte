(function ($) {
    $(document).ready(function(){
        // dificulty rendering button element in the blocks render array--so let's do it here:
        $("#button-wrap").html("<button id=\"next-steps-button\">Scroll to H2</button>");
        
        // little bit of styling to make button more visible
        $("#next-steps-button").css("margin-top", "20px");
        
        // onClick, scroll to h2:last-of-type
        $("#next-steps-button").click(function() {
            $([document.documentElement, document.body]).animate({
                scrollTop: $(".text-content").find("h2:last-of-type").offset().top
            }, 2000);
        });
        
        // logic to display .messages tooltip--i.e., display when last h2 is visible
        $(window).scroll(function() {
            var hT = $(".text-content").find("h2:last-of-type").offset().top
                hH = $(".text-content").find("h2:last-of-type").outerHeight(),
                wH = $(window).height(),
                wS = $(this).scrollTop();
                /*
                * If Statement:
                *
                * lots of measurement conditions; important to only append .message if it doesn't already exist
                */
                if (wS > (hT+hH-wH) && (hT > wS) && (wS+wH > hT+hH) && $(".messages")[0] == null){
                    // append a div to the body with a class of .messages
                    $("body").append("<div class=\"messages\" style=\"position:fixed;\">");

                    // insert our message into .messages
                    $(".messages").html("Congratulations, you've reached the 'Next Steps' header.");

                    // let's make it look half decent
                    $(".messages").css({
                        "top" : 150,
                        "right" : 0,
                        "z-index" : 999,
                    });
                }

                // remove the tooltip if we scroll back up, but only if .messages exists
                if (wS < (hT+hH-wH) && $(".messages")[0] != null){
                    $(".messages").remove();
                }
         });
    });
})(jQuery);