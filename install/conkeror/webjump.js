define_delicious_webjumps('fernandoalmeida');

define_webjump("gmail", "https://mail.google.com/mail/u/0/#search/%s");
define_webjump("news", "https://news.ycombinator.com");
define_webjump("dropbox", "https://www.dropbox.com/home");
define_webjump("ifttt", "https://ifttt.com/myrecipes/personal");
define_webjump("en", "https://www.evernote.com/Home.action#x=%s",
	      $alternative = "https://www.evernote.com/Home.action");
define_webjump("t", "http://translate.google.com/translate_t#auto|en|%s");
define_webjump("i", "http://www.google.com/images?q=%s",
	       $alternative = "http://www.google.com/imghp");
define_webjump("gh", "http://github.com/search?q=%s&type=Everything");

// Locaweb stuff
define_webjump("outlook", "https://outlook.locaweb.com.br");
define_webjump("jenkins", "https://ci.qaservices.locaweb.com.br");
define_webjump("code", "https://code.locaweb.com.br/%s");
define_webjump("servicenow", "https://lwprod.service-now.com/");
define_webjump("confluence", "http://confluence.locaweb.com.br/");
define_webjump("rh", "https://rh.locaweb.com.br/");
define_webjump("basecamp", "https://basecamp.com/1739668/projects/9206881");
define_webjump("kanban", "https://paaslocaweb.kanbanery.com/projects/45757/board/");

webjumps.g = webjumps.google;