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
define_webjump("ci", "http://ci.qaservices.locaweb.com.br");
define_webjump("code", "https://code.locaweb.com.br/%s");
define_webjump("servicenow", "https://lwprod.service-now.com/");
define_webjump("confluence", "http://confluence.locaweb.com.br/");
define_webjump("rh", "http://rh.locaweb.com.br/");
define_webjump("basecamp", "https://basecamp.com/1739668/projects/9206881");
define_webjump("kanban", "https://paaslocaweb.kanbanery.com/projects/45757/board/");
define_webjump('fila-beta', 'http://fila-beta.hospedagem.systemintegration.locaweb.com.br/LogGeral.aspx?prov=%s')
define_webjump('sistema-beta', 'sistema-beta.hospedagem.systemintegration.locaweb.com.br')
define_webjump('hank', 'https://hank.qa.locaweb.com.br')
define_webjump('hodor', 'https://hodor.qa.locaweb.com.br')
define_webjump('hosting-panel', 'http://hosting-panel.qa.locaweb.com.br')
define_webjump('prov-workers', 'http://prov-workers.hospedagem.systemintegration.locaweb.com.br/search?query=%s')
define_webjump('ponto', 'https://portallocaweb.cservices.com.br/WebPontoLocaweb/just_user/IncluirMarcacaoOnLine.asp')

webjumps.g = webjumps.google;
