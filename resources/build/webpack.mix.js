/*
 |--------------------------------------------------------------------------
 | Laravel Mix + Tailwind
 |--------------------------------------------------------------------------
 */

let mix = require('laravel-mix');

mix
    .setPublicPath('../assets')
    .scripts([
        '../assets/js/sortable.js',
        '../assets/js/core.js',
    ], '../assets/js/core.min.js')
    .postCss('../assets/css/core.css', 'css/core.min.css')
    .postCss('../assets/css/theme.css', 'css/theme.min.css')
    .options({
        processCssUrls: false,
        postCss: [ 
            require("tailwindcss"),
            require('autoprefixer')(),
            require('cssnano')({
                preset: ['default', {
                    discardComments: {
                        removeAll: true,
                    },
                }]
            }),
         ],
    });
