sudo su -l

/usr/local/Canopy/Canopy_64bit/User/bin/ipcontroller --ip=192.168.33.10 --profile=mpi &

sleep 5

cp ~/.ipython/profile_mpi/security/* /share/security

cd /share   
/usr/local/Canopy/Canopy_64bit/User/bin/ipython notebook --ip 0.0.0.0 --port 80 --no-browser &