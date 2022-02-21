(module vanilla.plugins.nvcolorizer
   {autoload {colorizer colorizer}})

(import-macros {: set!} :vanilla.macros)

(set! termguicolors)

(colorizer.setup
  ["*"]
  {:RGB true
   :RRGGBB true
   :names true
   :RRGGBBAA true
   :rgb_fn true
   :hsl_fn true
   :mode "background"})
