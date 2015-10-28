require('new-tabs.js')

function define_switch_buffer_key (key, buf_num) {
    define_key(
	default_global_keymap,
	key,
        function (I) {
            switch_to_buffer(
		I.window,
                I.window.buffers.get_buffer(buf_num)
	    );
        }
    );
}

for (let i = 0; i < 10; ++i) {
    define_switch_buffer_key("C-" + String((i+1)%10), i);
}
