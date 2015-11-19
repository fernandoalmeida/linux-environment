theme_load_paths.unshift("~/.conkerorrc/themes/");
theme_unload("default");
theme_load("conkeror-theme-zenburn");

theme_find("conkeror-theme-zenburn").unregister('hints.css');
register_user_stylesheet(
    make_css_data_uri(
        [
          'span.__conkeror_hint {' +
          '    background-color: #3F3F3F !important;' +
          '    color: #F0DFAF !important;' +
          '    position: absolute !important;' +
          '    font-family: "DejaVu Sans Mono", monospace;' +
          '    font-size: 10px !important;' +
          '    line-height: 10px !important;' +
          '    font-weight: bold !important;' +
          '    padding: 1px 2px !important;' +
          '    border-radius: 2px;' +
          '    z-index: 10000001 !important;' +
          '    display: block !important;' +
          '}'
	]
    )
);
