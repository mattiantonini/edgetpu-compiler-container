# EdgeTPU Compiler Docker container
This project allows you to convert quantized TFLite models in order to execute them on the [Coral Accelerator](https://coral.withgoogle.com/products/accelerator) or [Coral Dev Board](https://coral.withgoogle.com/products/dev-board/) even if you do not have the [EdgeTPU Compiler](https://coral.withgoogle.com/docs/edgetpu/compiler/) installed on your machine or if it is not supported like on MacOs X.

## Requirements
The only requirement is a Docker runtime on your machine. You can install it by following [this link](https://docs.docker.com/install/)!

## How to install EdgeTPU Compiler with Docker
1. Make sure you installed Docker by typing
```
$ docker version
```
This container has been tested with
  - Docker CE 18.09.0 on Ubuntu 16.04.1.
  - Docker CE 19.03.1 on MacOs X 10.14.5.
2. Clone this repository
```
$ git clone git@github.com:mattiantonini/edgetpu-compiler-container.git
```

3. Enter in the directory
```
$ cd edgetpu-compiler-container
```

4. Build the container
```
$ docker build -t edgetpu-compiler .
```
This step will take a few minutes.

5. Run the container and convert a model
```
$ docker run --rm -it -v $(pwd):/home/edgetpu-compiler edgetpu-compiler edgetpu_compiler <MODEL>_quant.tflite
```
This command converts the file `<MODEL>_quant.tflite` in the current directory to `<MODEL>_quant_edgetpu.tflite` that can be executed on the EdgeTPU.
A working example is the following
```
$ docker run --rm -it -v $(pwd):/home/edgetpu-compiler edgetpu-compiler edgetpu_compiler squeezenet_quant.tflite
```
