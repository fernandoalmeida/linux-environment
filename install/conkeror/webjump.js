define_delicious_webjumps('fernandoalmeida');

define_webjump("gmail", "https://mail.google.com/mail/u/0/#search/%s");
define_webjump("news", "https://news.ycombinator.com");
define_webjump("dropbox", "https://www.dropbox.com/home");
define_webjump("ifttt", "https://ifttt.com/myrecipes/personal");
define_webjump("evernote", "https://www.evernote.com/Home.action#x=%s",
	      $alternative = "https://www.evernote.com/Home.action");
define_webjump("trello", "https://trello.com")
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
define_webjump("hangout", "https://plus.google.com/hangouts/_/");

// Locaweb stuff
define_webjump("outlook", "https://outlook.locaweb.com.br");
define_webjump("jenkins", "http://ci.qaservices.locaweb.com.br");
define_webjump("code", "https://code.locaweb.com.br/%s");
define_webjump("servicenow", "https://lwprod.service-now.com/");
define_webjump("confluence", "http://confluence.locaweb.com.br/");
define_webjump("rh", "http://rh.locaweb.com.br/");
define_webjump("basecamp", "https://basecamp.com/1739668/projects/9206881");
define_webjump("kanbanery", "https://paaslocaweb.kanbanery.com/projects/45757/board/");
define_webjump('jira', 'https://locaweb.atlassian.net/browse/NPD')
define_webjump('fila-beta', 'http://fila-beta.hospedagem.locaweb.com.br/LogGeral.aspx?prov=%s')
define_webjump('sistema-beta', 'sistema-beta.hospedagem.locaweb.com.br')

function locaweb_url(protocol, subdomain, env) {
    var prefix = {
	"sysint": ".systemintegration",
	"qa": ".qa",
	"prod": ""
    }

    return protocol + "://" + subdomain + prefix[env] + ".locaweb.com.br";
}

define_webjump(
    'hank',
    function(env) { return locaweb_url('https', 'hank', env) }
);
define_webjump(
    'hodor',
    function(env) { return locaweb_url('https', 'hodor', env) }
);
define_webjump(
    'panel',
    function(env) { return locaweb_url('https', 'painelhospedagem', env) }
);
define_webjump(
    'prov-workers',
    function(env) { return locaweb_url('http', 'prov-workers.hospedagem', env) }
);

define_webjump('portal-locaweb', 'https://portallocaweb.cservices.com.br/PortalLocaweb/')
define_webjump('ponto-online', 'https://portallocaweb.cservices.com.br/WebPontoLocaweb/just_user/IncluirMarcacaoOnLine.asp')
define_webjump('ponto-espelho', 'https://portallocaweb.cservices.com.br/WebPontoLocaweb/Relatorios/SolicitaRelatorio.asp?Relatorio=RELRB118')
define_webjump('campfire', 'https://loca.campfirenow.com/')
define_webjump(
    'leela',
    'http://webleela.service.ita.consul.locaweb.com.br/' // 10.30.124.172
)
define_webjump('grafana', 'https://grafana.locaweb.com.br/')

webjumps.g = webjumps.google;
