// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// initialize the module in the following actions
Paloma.controller('NoteBooks/Notes', {
  new: function(){
    markdownEditorModule.init();
  },
  create: function(){
    markdownEditorModule.init();
  },
  edit: function(){
    markdownEditorModule.init();
  },
  show: function(){
    noteShowPageRenderer.init(this.params.noteContent);
  },
  update: function(){
    markdownEditorModule.init();
  }
})
