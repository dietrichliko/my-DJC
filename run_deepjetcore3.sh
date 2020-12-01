#! /bin/sh

opt=""
for mnt in /afs /local /data /scratch /scratch-cbe /eos
do
    if [ -e $mnt ]
    then
       opt="$opt -B $mnt"
    fi
done

if [ -e /dev/nvidia0 ]
then
  opt="$opt --nv"
fi

if [ $(hostname) = "hepgpu01.hephy.oeaw.ac.at" ]
then
   SINGULARITY_SIFDIR=/local/$USER/singularity
elif [ $(hostname -d) = "cbe.vbc.ac.at" ]
then
   SINGULARITY_SIFDIR=/scratch-cbe/users/$USER/singularity
else
   echo "Unknown location"
   exit 1
fi

singularity shell $opt $SINGULARITY_SIFDIR/deepjetcore3-latest.sif
