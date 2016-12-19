describe("noteShowPageRenderer", function(){

  function setup(){
    // create dom
    var html = "<div data-render-div></div>";
    setFixtures(html);
  }

  beforeAll(setup);
  
  it("renders the note's markdown into html", function(){
    noteShowPageRenderer.init("foo");
    expect($("[data-render-div]").html()).toMatch(/foo/);
  })
});