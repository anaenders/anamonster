var geosans = { src: '/swf/geosans.swf' };

sIFR.activate(geosans);

sIFR.replace(geosans, {
  selector: '#blog_container h3',
  wmode: 'transparent',
  css: [
    '.sIFR-root { font-size: 16px; color: #d2e1fe }',
    'a:link { color: #d2e1fe }',    
    'a:visited { color: #d2e1fe }',  
    'a:hover { color: #000000 }', 
    'a:active { color: #d2e1fe }',
    'a { text-decoration: none }'
  ]
});

sIFR.replace(geosans, {
  selector: '#blog_container h2',
  wmode: 'transparent',
  css: '.sIFR-root { font-size: 18px; color: #000000 }'
});

sIFR.replace(geosans, {
  selector: 'span.contact, span.search_button',
  wmode: 'transparent',
  css: [
    '.sIFR-root { font-size: 14px; color: #ffffff }',
    'a:link { color: #ffffff }',    
    'a:visited { color: #ffffff }',  
    'a:hover { color: #ffffff }', 
    'a:active { color: #ffffff }',
    'a { text-decoration: none }'
  ]
});

sIFR.replace(geosans, {
  selector: '#footer_navigation p',
  wmode: 'transparent',
  css: '.sIFR-root { font-size: 13px; color: #ffffff; text-align: right; }'
});

sIFR.replace(geosans, {
  selector: 'h2.album_name',
  wmode: 'transparent',
  css: '.sIFR-root { font-size: 25px; color: #F131C6 }'
});

sIFR.replace(geosans, {
  selector:'#description h3, #resume h3',
  wmode: 'transparent',
  css: '.sIFR-root { font-size: 16px; color: #000000 }'
});

// sIFR.replace(geosans, {
//   selector: 'p.name label, p.email label, p.message',
//   wmode: 'transparent',
//   css: '.sIFR-root { font-size: 14px; color: #000000 }'
// });

sIFR.replace(geosans, {
  selector: '#calendar th',
  wmode: 'transparent',
  css: [
    '.sIFR-root { font-size: 12px; color: #1263f9; text-align: center }',
    'a:link { color: #1263f9 }',    
    'a:visited { color: #1263f9 }',  
    'a:hover { color: #1263f9 }', 
    'a:active { color: #1263f9 }',
    'a { text-decoration: none }'
  ]
});

// sIFR.replace(geosans, {
//   selector: '#calendar td',
//   wmode: 'transparent',
//   css: [
//     '.sIFR-root { font-size: 10px; color: ##7C7C7C; text-align: center }',
//     'a:link { color: #000000 }',    
//     'a:visited { color: #000000 }',  
//     'a:hover { color: #000000 }', 
//     'a:active { color: #000000 }',
//     'a { text-decoration: underline }'
//   ]
// });