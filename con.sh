set -e

cmd=$1
shift

count=$#
cores=$(nproc)

let div=count/cores || true
let rem="count-cores*div" || true

start=1

for i in $(seq $cores)
do
    length=$div
    [ $rem -gt 0 ]    && ((length+=1))
    [ $length -eq 0 ] && break

    {
        $cmd "${@:$start:$length}"
        result=$?
        [ $result -eq 0 ] && echo " -> task $i done"
      ! [ $result -eq 0 ] && echo " -> task $i errorcode $result"
    } &

    (( start += length))
    (( rem   -= 1))
done

wait
