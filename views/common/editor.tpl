

  <!---
	Please read this before copying the toolbar:

	* One of the best things about this widget is that it does not impose any styling on you, and that it allows you 
	* to create a custom toolbar with the options and functions that are good for your particular use. This toolbar
	* is just an example - don't just copy it and force yourself to use the demo styling. Create your own. Read 
	* this page to understand how to customise it:
    * https://github.com/mindmup/bootstrap-wysiwyg/blob/master/README.md#customising-
	--->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
	<div id="alerts"></div>
    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
      <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="字体大小"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
          <ul class="dropdown-menu">
          <li><a data-edit="fontSize 5"><font size="5">大</font></a></li>
          <li><a data-edit="fontSize 3"><font size="3">正常</font></a></li>
          <li><a data-edit="fontSize 1"><font size="1">小</font></a></li>
          </ul>
	  </div>
      <div class="btn-group">
        <a class="btn" data-edit="bold" title="加粗 (Ctrl+B)"><i class="icon-bold"></i></a>
        <a class="btn" data-edit="italic" title="斜体 (Ctrl+I)"><i class="icon-italic"></i></a>
        <a class="btn" data-edit="strikethrough" title="删除线"><i class="icon-strikethrough"></i></a>
        <a class="btn" data-edit="underline" title="下划线 (Ctrl+U)"><i class="icon-underline"></i></a>
        <a class="btn" data-edit="insertunorderedlist" title="无序列表"><i class="icon-list-ul"></i></a>
        <a class="btn" data-edit="insertorderedlist" title="有序列表"><i class="icon-list-ol"></i></a>
        <!--
		<a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
        <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
      	-->
      <!--
	  <div class="btn-group">
        <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
      </div>
		-->
		  <!--
		<a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
   		-->
	  </div>
      <div class="btn-group">
		  <a class="btn dropdown-toggle" data-toggle="dropdown" title="超链接"><i class="icon-link"></i></a>
		    <div class="dropdown-menu input-append">
			    <input class="span2" placeholder="URL" style="width: inherit;" type="text" data-edit="createLink"/>
			    <button class="btn btn-primary btn-sm" type="button">添加</button>
        	</div>
        <a class="btn" data-edit="unlink" title="取消超链接"><i class="icon-cut"></i></a>

      
        <a class="btn" title="插入图片" id="pictureBtn"><i class="icon-picture"></i></a>
        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
        <a class="btn" data-edit="undo" title="撤销 (Ctrl+Z)"><i class="icon-undo"></i></a>
      
	  </div>
		<!--
      <div class="btn-group">
           </div>
		-->
      <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
    </div>

    <div id="editor">
      
    </div>
<script>
   $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      $('#voiceBtn').hide();
      // if ("onwebkitspeechchange"  in document.createElement("input")) {
      //   var editorOffset = $('#editor').offset();
      //   $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
      // } else {
      //   $('#voiceBtn').hide();
      // }
    };
    initToolbarBootstrapBindings();  
    $('#editor').wysiwyg();
    window.prettyPrint && prettyPrint();
  }); 
</script>

