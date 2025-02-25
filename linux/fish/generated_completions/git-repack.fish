# git-repack
# Autogenerated from man page /usr/lib/jvm/default/man/man1/git-repack.1.gz
complete -c git-repack -s a -d 'Instead of incrementally packing the unpacked objects, pack everything refere…'
complete -c git-repack -s A -d 'Same as -a, unless -d is used'
complete -c git-repack -s d -d 'After packing, if the newly created packs make some existing packs redundant,…'
complete -c git-repack -l cruft -d 'Same as -a, unless -d is used'
complete -c git-repack -l cruft-expiration -d 'Expire unreachable objects older than <approxidate> immediately instead of wa…'
complete -c git-repack -l expire-to -d 'Write a cruft pack containing pruned objects (if any) to the directory <dir>'
complete -c git-repack -s l -d 'Pass the --local option to git pack-objects.  See git-pack-objects(1)'
complete -c git-repack -s f -d 'Pass the --no-reuse-delta option to git-pack-objects, see git-pack-objects(1)'
complete -c git-repack -s F -d 'Pass the --no-reuse-object option to git-pack-objects, see git-pack-objects(1)'
complete -c git-repack -s q -l quiet -d 'Show no progress over the standard error stream and pass the -q option to git…'
complete -c git-repack -s n -d 'Do not update the server information with git update-server-info'
complete -c git-repack -l window -l depth -d 'These two options affect how the objects contained in the pack are stored usi…'
complete -c git-repack -l threads -d 'This option is passed through to git pack-objects'
complete -c git-repack -l window-memory -d 'This option provides an additional limit on top of --window; the window size …'
complete -c git-repack -l max-pack-size -d 'Maximum size of each output pack file'
complete -c git-repack -s b -l write-bitmap-index -d 'Write a reachability bitmap index as part of the repack'
complete -c git-repack -l pack-kept-objects -d 'Include objects in . keep files when repacking'
complete -c git-repack -l keep-pack -d 'Exclude the given pack from repacking.  This is the equivalent of having '
complete -c git-repack -l unpack-unreachable -d 'When loosening unreachable objects, do not bother loosening any objects older…'
complete -c git-repack -s k -l keep-unreachable -d 'When used with -ad, any unreachable objects from existing packs will be appen…'
complete -c git-repack -s i -l delta-islands -d 'Pass the --delta-islands option to git-pack-objects, see git-pack-objects(1)'
complete -c git-repack -s g -l geometric -d 'Arrange resulting pack structure so that each successive pack contains at lea…'
complete -c git-repack -s m -l write-midx -d 'Write a multi-pack index (see git-multi-pack-index(1)) containing the non-red…'
complete -c git-repack -l local -d 'option to git pack-objects.  See git-pack-objects(1)'
complete -c git-repack -l no-reuse-delta -d 'option to git-pack-objects, see git-pack-objects(1)'
complete -c git-repack -l no-reuse-object -d 'option to git-pack-objects, see git-pack-objects(1)'
complete -c git-repack -l 'window;' -d '<n> bytes in memory'
complete -c git-repack -o ad
complete -c git-repack -l unpacked -d 'is specified, loose objects are implicitly included in this "roll-up", withou…'

