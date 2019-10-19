function iprl5(document) {
    var d=document,
	z=d.createElement('scr'+'ipt'),
	b=d.body,
	l=d.location;
    try {
	if(!b) throw(0);
	d.title='(Saving...) '+d.title;
	z.setAttribute('src',l.protocol+'//www.instapaper.com/j/ykGcM1eaWfBv?a=read-later&u='+encodeURIComponent(l.href)+'&t='+(new Date().getTime()));
	b.appendChild(z);
    } catch(e) {
	alert('Please wait until the page has loaded.');
    }
}

interactive(
    "instapaper",
    "Send the current page to InstaPaper.",
    function (I) {
        iprl5(I.buffer.document);
    }
);

define_key(default_global_keymap, "C-c i", "instapaper");

define_webjump("instapaper", "https://www.instapaper.com/u");
