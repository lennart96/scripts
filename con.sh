set -e

verbose=false

cmd=$1
shift

if [ "$cmd" == '-v' ]; then
    verbose=true
    cmd=$1
    shift
elif [ "$cmd" == '-h' ]; then
    echo "usage: $0 [-v] program arguments*
       $0 -h

example:
       $ $0 echo a b c d e f
       results on a 4 core system in:
           echo a b &
           echo c d &
           echo e &
           echo f &
           wait
       $ $0 'echo -n' a b c d
           echo -n a &
           echo -n b &
           echo -n c &
           echo -n d &
           wait"
    exit 0
fi

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
        [ $result -eq 0 ] && $verbose && echo " -> task $i done"
      ! [ $result -eq 0 ] && $verbose &&echo " -> task $i errorcode $result"
    } &

    (( start += length))
    (( rem   -= 1)) || true
done

wait
