var noteShowPageRenderer = (function(){
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