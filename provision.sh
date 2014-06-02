sudo su -l
yum install -y gcc gcc-gfortran gcc-c++
yum install -y openmpi-devel.x86_64
export PATH=/usr/lib64/openmpi/bin/:$PATH
module add openmpi-x86_64
yum install -y python-devel
ln -s /usr/local/Canopy/Canopy_64bit/System/lib/libpython2.7.so /usr/local/lib64/

/share/canopy/canopy-1.3.0-rh5-64.sh -b
/root/Canopy/canopy_cli --no-gui-setup --install-dir /usr/local/Canopy --common-install
/usr/local/Canopy/Canopy_64bit/User/bin/pip install mpi4py
/usr/local/Canopy/Canopy_64bit/User/bin/ipython profile create --parallel --profile=mpi
echo "c.IPClusterEngines.engine_launcher_class = 'MPIEngineSetLauncher'" >> /root/.ipython/profile_mpi/ipcluster_config.py
service iptables stop
export LD_LIBRARY_PATH=/usr/lib64/openmpi/lib:$LD_LIBRARY_PATH 