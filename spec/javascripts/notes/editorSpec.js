describe("markdownEditorModule", function(){

  function setup(){
    // create dom
    var html = "<div id='note-input'> \
                <pre><span></span></pre> \
                <textarea></textarea> \
                </div> \
                <div id='note-preview'></div>";
    setFixtures(html);
    
    // initialize module
    markdownEditorModule.init();
  }

  beforeEach(function(){
    setup();
  });

  it("updates the editor preview when some text is entered in the editor textarea", function(done){
    // retrieve editor input
    var $editorInput = $('#note-input textarea');
    var $notePreview = $('#note-preview');

    // add value to input
    $editorInput.html("foo");
    
    setTimeout(function(){
      expect($notePreview.html()).toMatch(/foo/);
      done();
    }, 101);
  });

  it("resizes the editor textarea when some text is entered", function(done){
    // retrieve editor input
    var $editorInput = $('#note-input textarea');
    var $sizingSpan = $('#note-input pre span');

    // add value to input
    $editorInput.html("foo");
    
    setTimeout(function(){
      expect($sizingSpan.html()).toMatch(/foo/);
      done();
    }, 101);
  });
});