# Creating golden image for wordpress

To install Packer:
```
bash localscript.sh
```

Before start in your AWS account create key-pair "packer" in us-east-1.

Image for Wordpress will be created: 
* from latest <b>Amazon Linux 2</b>
* in <b>us-east-1</b>



To build image run:
```
make build
```