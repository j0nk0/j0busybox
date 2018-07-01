#https://github.com/j0nk0/j0busybox
## j0busybox
My(j0nk0) Swiss Army Knife/Extended versions of many common UNIX utilities.


[PackageName]  [Link/src]                           [Info]
bfs          - https://github.com/tavianator/bfs   - Coloured "find" output+more



#=============# bfs #=============#
cd j0find
 cp -a bfs.h j0find.h
 for i in $(find -type f)
  do
   sed -i 's/bfs/j0find/g' $i
 done

