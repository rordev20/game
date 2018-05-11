function initializeGame(){
    var shapes = new Object();
    $.each(gon.game_data, function( key, value ) {
        shapes[value.title] = value.game_data; 
    })

    $('#prefabs img').mousedown(function(e) { e.preventDefault(); });
    w= parseInt($("#gridwidth")[0].value);
    h= parseInt($("#gridheight")[0].value);
    g.setHandlers(shapes);
    SetBoxSize();

    isHighlightingBoxes = false;
    isDraggingShape = false;
    $('body').mouseup(function() {
        isHighlightingBoxes = false;
        isDraggingShape = false;
    });

    $("#gamecontrol").click(function(){
    	  StartStop(g);
    });

    $("#newgrid").click(function(){
      	w= parseInt($("#gridwidth")[0].value);
      	h= parseInt($("#gridheight")[0].value);
      	g = NewGrid(w,h);
      	g.setHandlers(shapes);
    });

    $("#stringify").click(function(){
      	var string = g.GridToString();
      	$("#stringarea")[0].value = string;
    });

    $("#gridify").click(function(){
      	var s = $("#stringarea")[0].value;
      	g=NewGrid(s,0);
      	g.setHandlers(shapes);
    });

    $(".prefab").mousedown(function(){
        $(".prefab").removeClass("selected");
        $(this).addClass("selected");
        isDraggingShape = true;
        Stop("Start", "Stop");
    })
}