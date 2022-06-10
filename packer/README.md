# Creating golden image for wordpress

To install Packer:
```
bash localscript.sh
```

Before start manually create key-pair "packer" in your region or it will be created automatically in VPC block

Image for Wordpress will be created: 
* from latest <b>Amazon Linux 2</b>
* in region with value of PKR_VAR_region


To build image run:
```
make build
```