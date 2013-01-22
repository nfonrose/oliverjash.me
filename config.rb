# Require any additional compass plugins here.
require "modular-scale"
require "breakpoint"

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "source/css"
sass_dir = "source/_sass"
images_dir = "source/images"
javascripts_dir = "source/js"

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed
# TO DO: Add source maps in production
if environment == :development
  sass_options = {:debug_info => true}
  output_style = :expanded
else
  output_style = :compressed
end

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
line_comments = false

