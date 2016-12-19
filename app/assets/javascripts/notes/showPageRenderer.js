// Render a note into a div. Used in show pages.
var noteShowPageRenderer = (function(){
  // Markdown content of the note.
  var noteContent;
  // target div where note will be rendered.
  var $targetDiv;
  
  function init(_noteContent){
    noteContent = _noteContent
    cacheDom();
    render();
  }
  
  function cacheDom(){
    $targetDiv = $("[data-render-div]");
  }

  function render(){
    $targetDiv.html(renderNote());
  }

  function renderNote(){
    return markdown.toHTML(noteContent);
  }

  return { init: init };
})();

Paloma.controller("Notes", {
  show: function(){
    noteShowPageRenderer.init(this.params.noteContent);
  }
})
