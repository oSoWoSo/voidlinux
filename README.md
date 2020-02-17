VOID base post install script created by me

Run...

sudo xbps-install -S
sudo xbps-install git

git clone git://github.com/zen0bit/bin.git

cd bin
sudo chmod +x post-pass
cd

sudo su
bash
./bin/post-pass

*
*

Add: amd_iommu=on rd.driver.pre=vfio-pci kvm.ignore_msrs=1"
To grub

*
*

Thanks autors for great codes

*
https://github.com/keithieopia

*
https://github.com/bahamas10

*
https://github.com/netzverweigerer

*
https://github.com/duckwork

*
vpm readme
https://github.com/netzverweigerer/vpm/blob/master/README.md

*
vpsm readme
https://github.com/sinetoami/vpsm/blob/master/README.md

*
vsv readme
https://github.com/bahamas10/vsv/blob/master/README.md

*
piu readme
https://github.com/keithieopia/piu/blob/master/README.md
