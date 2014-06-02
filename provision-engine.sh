sudo su -l
cp /share/security/* ~/.ipython/profile_mpi/security/

cd /share
module add openmpi-x86_64
mpiexec -n 4 /usr/local/Canopy/Canopy_64bit/User/bin/ipengine --mpi=mpi4py --profile=mpi &