#!/bin/bash
#PBS -N mnist_rsvd
#PBS -l select=1:mpiprocs=128,walltime=00:10:00
#PBS -q qexp
#PBS -e mnist_rsvd.e
#PBS -o mnist_rsvd.o

cd ~/KPMS-IT4I-EX/mpi
pwd

module load R
echo "loaded R"

## Fix for warnings from libfabric/1.12 bug
module swap libfabric/1.12.1-GCCcore-10.3.0 libfabric/1.13.2-GCCcore-11.2.0 
time mpirun --map-by ppr:1:node Rscript mnist_rsvd.R
time mpirun --map-by ppr:2:node Rscript mnist_rsvd.R
time mpirun --map-by ppr:4:node Rscript mnist_rsvd.R
time mpirun --map-by ppr:8:node Rscript mnist_rsvd.R
time mpirun --map-by ppr:16:node Rscript mnist_rsvd.R
time mpirun --map-by ppr:32:node Rscript mnist_rsvd.R
time mpirun --map-by ppr:64:node Rscript mnist_rsvd.R
