#!/bin/bash
for counter in {1..10}
do
   echo $counter. "\$start = " $start " and \$end = " $end
   sed -i -e "s/JAS-[0-9]*/JAS-${end}/g" ../test-2/Jenkinsfile
cd test-1
git commit -m "update for JAS-${end}" .
git push
cd ..
   if [[ $start -eq 1 ]];
   then
      start=0
   fi
   start=$(($start+1))
   end=$(($end+1))
   if [[ $end -ge 10 ]];
   then
      break
   fi
done
