using "geb"
 
scenario "scripting style", {
 
    when "we go to google", {
        go "http://google.com"
    }
 
    then "we are at google", {
        page.title.shouldBe "Google"
    }
 
    when "we search for chuck", {
        $("input", name: "q").value("chuck norris")
	waitFor {
        	$("li.g", 0).find("a.l").present
	}
    }
 
    then "we are now at the results page", {
        page.title.shouldEndWith "Google"
    }
 
    and "we get straight up norris", {
        $("li.g", 0).find("a.l").text().shouldStartWith "Chuck Norris"
    }
 
}
