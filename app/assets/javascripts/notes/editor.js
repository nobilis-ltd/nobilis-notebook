// handles rendering of markdown to preview and
// growing the editor textarea
var markdownEditorModule = (function() {
  function init(){
    cacheDom();
    updateEditor();
  }

  function cacheDom(){
    $editorInput = $('#note-input textarea');
    $editorSizingSpan = $('#note-input pre span');
    $notePreview = $('#note-preview');
  }

  function updateEditor(oldContent) {
    var newContent = $editorInput.val();

    if (newContent != oldContent) {
      // resize editor accordingly
      $editorSizingSpan.html(newContent);
      // show preview
      $notePreview.html(markdown.toHTML(newContent));
    }

    setTimeout(function(){
      updateEditor(newContent)
    }, 100);
  }

  return { init: init };
})();

// initialize the module in the following actions
Paloma.controller('Notes', {
  new: function(){
    markdownEditorModule.init();
  },
  create: function(){
    markdownEditorModule.init();
  },
  edit: function(){
    markdownEditorModule.init();
  },
  update: function(){
    markdownEditorModule.init();
  }
})