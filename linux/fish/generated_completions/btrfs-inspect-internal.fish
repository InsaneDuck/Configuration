# btrfs-inspect-internal
# Autogenerated from man page /usr/lib/jvm/default/man/man8/btrfs-inspect-internal.8.gz
complete -c btrfs-inspect-internal -s f -l full -d 'print full superblock information, including the system chunk array and backu…'
complete -c btrfs-inspect-internal -s a -l all -d 'print information about all present superblock copies (cannot be used togethe…'
complete -c btrfs-inspect-internal -s i -d '(deprecated since 4. 8, same behaviour as --super)'
complete -c btrfs-inspect-internal -l bytenr -d 'specify offset to a superblock in a non-standard location at bytenr, useful f…'
complete -c btrfs-inspect-internal -s F -l force -d 'attempt to print the superblock even if a valid BTRFS signature is not found;…'
complete -c btrfs-inspect-internal -s s -l super -d '(see compatibility note above)'
complete -c btrfs-inspect-internal -s e -l extents -d 'print only extent-related information: extent and device trees'
complete -c btrfs-inspect-internal -s d -l device -d 'print only device-related information: tree root, chunk and device trees'
complete -c btrfs-inspect-internal -s r -l roots -d 'print only short root node information, i. e.  the root tree keys'
complete -c btrfs-inspect-internal -s R -l backups -d 'same as --roots plus print backup root info, i. e'
complete -c btrfs-inspect-internal -s u -l uuid -d 'print only the uuid tree information, empty output if the tree does not exist'
complete -c btrfs-inspect-internal -s b -d 'print info of the specified block only, can be specified multiple times'
complete -c btrfs-inspect-internal -l follow -d 'use with -b, print all children tree blocks of <block_num>'
complete -c btrfs-inspect-internal -l dfs -d '(default up to 5. 2)'
complete -c btrfs-inspect-internal -l bfs -d '(default since 5. 3)'
complete -c btrfs-inspect-internal -l hide-names -d 'print a placeholder HIDDEN instead of various names, useful for developers to…'
complete -c btrfs-inspect-internal -l csum-headers -d 'print b-tree node checksums stored in headers (metadata)'
complete -c btrfs-inspect-internal -l csum-items -d 'print checksums stored in checksum items (data)'
complete -c btrfs-inspect-internal -l noscan -d 'do not automatically scan the system for other devices from the same filesyst…'
complete -c btrfs-inspect-internal -s t -d 'print only the tree with the specified ID, where the ID can be numerical or c…'
complete -c btrfs-inspect-internal -s v -d '(deprecated) alias for global -v option logical-resolve [-Pvo] [-s <bufsize>]…'
complete -c btrfs-inspect-internal -s P -d 'skip the path resolving and print the inodes instead'
complete -c btrfs-inspect-internal -s o -d 'ignore offsets, find all references to an extent instead of a single block'
complete -c btrfs-inspect-internal -l resume-offset -d 'print only the value suitable as resume offset for file /sys/power/resume_off…'
complete -c btrfs-inspect-internal -l id -d 'specify the device id to query, default is 1 if this option is not used rooti…'

