# ss
# Autogenerated from man page /usr/lib/jvm/default/man/man8/ss.8.gz
complete -c ss -s h -l help -d 'Show summary of options'
complete -c ss -s V -l version -d 'Output version information'
complete -c ss -s H -l no-header -d 'Suppress header line'
complete -c ss -s O -l oneline -d 'Print each socket\'s data on a single line'
complete -c ss -s n -l numeric -d 'Do not try to resolve service names'
complete -c ss -s r -l resolve -d 'Try to resolve numeric address/ports'
complete -c ss -s a -l all -d 'Display both listening and non-listening (for TCP this means established conn…'
complete -c ss -s l -l listening -d 'Display only listening sockets (these are omitted by default)'
complete -c ss -s o -l options -d 'Show timer information.  For TCP protocol, the output format is: . RS '
complete -c ss -s e -l extended -d 'Show detailed socket information.  The output format is: . RS '
complete -c ss -s m -l memory -d 'Show socket memory usage.  The output format is: . RS '
complete -c ss -s p -l processes -d 'Show process using socket'
complete -c ss -s T -l threads -d 'Show thread using socket.  Implies  -p '
complete -c ss -s i -l info -d 'Show internal TCP information.  Below fields may appear: . RS . P'
complete -c ss -l tos -d 'Show ToS and priority information.  Below fields may appear: . RS . P'
complete -c ss -l cgroup -d 'Show cgroup information.  Below fields may appear: . RS . P'
complete -c ss -l tipcinfo -d 'Show internal tipc socket information. RS . P'
complete -c ss -s K -l kill -d 'Attempts to forcibly close sockets'
complete -c ss -s s -l summary -d 'Print summary statistics'
complete -c ss -s E -l events -d 'Continually display sockets as they are destroyed'
complete -c ss -s Z -l context -d 'As the  -p option but also shows process security context'
complete -c ss -s z -l contexts -d 'As the  -Z option but also shows the socket context'
complete -c ss -s N -l net -d 'Switch to the specified network namespace name'
complete -c ss -s b -l bpf -d 'Show socket classic BPF filters (only administrators are allowed to get these…'
complete -c ss -s 4 -l ipv4 -d 'Display only IP version 4 sockets (alias for -f inet)'
complete -c ss -s 6 -l ipv6 -d 'Display only IP version 6 sockets (alias for -f inet6)'
complete -c ss -s 0 -l packet -d 'Display PACKET sockets (alias for -f link)'
complete -c ss -s t -l tcp -d 'Display TCP sockets'
complete -c ss -s u -l udp -d 'Display UDP sockets'
complete -c ss -s d -l dccp -d 'Display DCCP sockets'
complete -c ss -s w -l raw -d 'Display RAW sockets'
complete -c ss -s x -l unix -d 'Display Unix domain sockets (alias for -f unix)'
complete -c ss -s S -l sctp -d 'Display SCTP sockets'
complete -c ss -l tipc -d 'Display tipc sockets (alias for -f tipc)'
complete -c ss -l vsock -d 'Display vsock sockets (alias for -f vsock)'
complete -c ss -l xdp -d 'Display XDP sockets (alias for -f xdp)'
complete -c ss -s M -l mptcp -d 'Display MPTCP sockets'
complete -c ss -l inet-sockopt -d 'Display inet socket options'
complete -c ss -s f -l family -d 'Display sockets of type FAMILY'
complete -c ss -s A -l query -l socket -d 'List of socket tables to dump, separated by commas'
complete -c ss -s D -l diag -d 'Do not display anything, just dump raw information about TCP sockets to FILE …'
complete -c ss -s F -l filter -d 'Read filter information from FILE'

