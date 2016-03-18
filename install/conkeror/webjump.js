define_delicious_webjumps('fernandoalmeida');

define_webjump("gmail", "https://mail.google.com/mail/u/0/#search/%s");
define_webjump("news", "https://news.ycombinator.com");
define_webjump("dropbox", "https://www.dropbox.com/home");
define_webjump("ifttt", "https://ifttt.com/myrecipes/personal");
define_webjump("evernote", "https://www.evernote.com/Home.action#x=%s",
	      $alternative = "https://www.evernote.com/Home.action");
define_webjump("t", "http://translate.google.com/translate_t#auto|en|%s");
define_webjump("i", "http://www.google.com/images?q=%s",
	       $alternative = "http://www.google.com/imghp");
define_webjump("github", "http://github.com/search?q=%s&type=Everything");
define_webjump("whatsapp", "https://web.whatsapp.com");
define_webjump(
    "ruby",
    function(klass) {
	var url = 'http://ruby-doc.org/core-2.2.0/'
	return url + klass.charAt(0).toUpperCase() + klass.slice(1) + '.html';
    },
    $alternative = 'http://ruby-doc.org/core-2.2.0/'
)

// Locaweb stuff
define_webjump("outlook", "https://outlook.locaweb.com.br");
define_webjump("jenkins", "http://ci.qaservices.locaweb.com.br");
define_webjump("code", "https://code.locaweb.com.br/%s");
define_webjump("servicenow", "https://lwprod.service-now.com/");
define_webjump("confluence", "http://confluence.locaweb.com.br/");
define_webjump("rh", "http://rh.locaweb.com.br/");
define_webjump("basecamp", "https://basecamp.com/1739668/projects/9206881");
define_webjump("kanbanery", "https://paaslocaweb.kanbanery.com/projects/45757/board/");
define_webjump('jira', 'https://locaweb.atlassian.net/browse/HP')
define_webjump('fila-beta', 'http://fila-beta.hospedagem.locaweb.com.br/LogGeral.aspx?prov=%s')
define_webjump('sistema-beta', 'sistema-beta.hospedagem.locaweb.com.br')
define_webjump('hank', 'https://hank.locaweb.com.br')
define_webjump('hodor', 'https://hodor.locaweb.com.br')
define_webjump('hosting-panel', 'http://painelhospedagem.locaweb.com.br/databases?per_page=500')
define_webjump('prov-workers', 'http://prov-workers.hospedagem.locaweb.com.br/search?query=%s')
define_webjump('portal-locaweb', 'https://portallocaweb.cservices.com.br/PortalLocaweb/')
define_webjump('ponto-online', 'https://portallocaweb.cservices.com.br/WebPontoLocaweb/just_user/IncluirMarcacaoOnLine.asp')
define_webjump('ponto-espelho', 'https://portallocaweb.cservices.com.br/WebPontoLocaweb/Relatorios/SolicitaRelatorio.asp?Relatorio=RELRB118')
define_webjump('campfire', 'https://loca.campfirenow.com/')
define_webjump(
    'leela',
    'http://webleela.service.ita.consul.locaweb.com.br/' // 10.30.124.172
)

webjumps.g = webjumps.google;
