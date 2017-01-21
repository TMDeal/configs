let g:html_indent_script1="inc"
let g:html_indent_style1="inc"
let g:jsx_ext_required=0

if functions#PluginExists('emmet')
    let g:emmet_html5=0
endif

if functions#PluginExists('closetag')
    let g:closetag_filenames="*.html,*.php,*.xhtml,*.xml,*.jsx,*.js,*.hbs,*.handlebars,*.jinja"
endif
