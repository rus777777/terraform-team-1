# Creating golden image

To install Packer:
```
bash localscript.sh
```

Create key-pair "packer" in us-east-1.

Image for Wordpress will be created: 
* from latest <b>Amazon Linux 2</b>
* in <b>us-east-1</b>
* instance type: <b>t2.micro</b>




To build image run:
```
make build
```