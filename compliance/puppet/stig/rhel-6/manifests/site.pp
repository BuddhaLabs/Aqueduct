import "nodes"

filebucket { main: server =>'puppet.domain.com' }

# global defaults
File { backup => main}
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }
