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

*

https://github.com/zen0bit/void_post/blob/master/vpm.md

*

vpsm readme

*

https://github.com/zen0bit/void_post/blob/master/vpsm.md

*

vsv readme

*

https://github.com/zen0bit/void_post/blob/master/vsv.md

*

piu readme

*

https://github.com/zen0bit/void_post/blob/master/piu.md
