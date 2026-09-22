# Gemma 3 inference snap
[![gemma3](https://snapcraft.io/gemma3/badge.svg)](https://snapcraft.io/gemma3)

Gemma 3 is a multimodal language model from [Google DeepMind](https://deepmind.google/models/gemma/gemma-3/).

Use this snap to quickly install an optimized environment for local inference with Gemma 3.

The snap includes the following hardware-optimized inference engines:

* cpu: Optimized for various CPUs
* nvidia-gpu: CUDA-optimized for NVIDIA GPUs
* amd-gpu: ROCm-optimized for AMD GPUs
* intel-cpu: Optimized for Intel CPUs using OpenVINO Model Server
* intel-gpu: Optimized for Intel GPUs using OpenVINO Model Server

The most suitable engine is automatically selected based on the available hardware.

#### Install
```shell
sudo snap install gemma3
```

#### Run
```shell
gemma3
```

> [!TIP]
> Some accelerators require extra [drivers](https://documentation.ubuntu.com/inference-snaps/how-to/setup/drivers/) to be usable with this snap.

## Resources

📚 **[Documentation](https://documentation.ubuntu.com/inference-snaps/)**, learn how to use inference snaps

💬 **[Discussions](https://github.com/canonical/inference-snaps/discussions)**, ask questions and share ideas

🐛 **[Issues](https://github.com/canonical/inference-snaps/issues)**, report bugs and request features

## Build and install from source

Clone the repo:
```shell
git clone https://github.com/canonical/gemma3-snap
cd gemma3-snap
```

Initialize the development environment:
```shell
make init
```

Build and install snap:
```shell
make build
make install
```
