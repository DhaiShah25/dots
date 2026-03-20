$env.config.show_banner = false

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

$env.config.history.isolation = false
$env.config.history.max_size = 1000
atuin init nu | save -f ($nu.data-dir | path join "vendor/autoload/atuin.nu")

$env.config.completions.external.enable = true
$env.config.completions.external.max_results = 200
carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")

use std/config *

$env.config.hooks.env_change.PWD = $env.config.hooks.env_change.PWD? | default []
$env.config.hooks.env_change.PWD ++= [{||
  direnv export json | from json | default {} | load-env
  $env.PATH = do (env-conversions).path.from_string $env.PATH
}]

$env.PATH ++= ['/usr/bin/env', '~/.local/bin']
$env.EDITOR = "nvim";
$env.VISUAL = "nvim";

alias "nv" = nvim

microfetch
