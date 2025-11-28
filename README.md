# Gemma3 snap
[![gemma3](https://snapcraft.io/gemma3/badge.svg)](https://snapcraft.io/gemma3) [![Snap CI](https://github.com/canonical/gemma3-snap/actions/workflows/snap-ci.yaml/badge.svg)](https://github.com/canonical/gemma3-snap/actions/workflows/snap-ci.yaml)


This snap installs a hardware-optimized engine for inference with the [Gemma 3](https://deepmind.google/models/gemma/gemma-3/) multimodal language model.

Install:
```
sudo snap install gemma3 --beta
```

Get help:
```
gemma3 --help
```

## Resources

📚 **[Documentation](https://documentation.ubuntu.com/inference-snaps/)**, learn how to use inference snaps

💬 **[Discussions](https://github.com/canonical/inference-snaps/discussions)**, ask questions and share ideas

🐛 **[Issues](https://github.com/canonical/inference-snaps/issues)**, report bugs and request features

## Build and install from source

Clone this repo with its submodules:
```shell
git clone --recurse-submodules https://github.com/canonical/gemma3-snap.git
```

Prepare the required models by following the instructions for each model, under the [components](./components) directory. 

Build the snap and its component:
```shell
snapcraft pack -v
```

Refer to the `./dev` directory for additional development tools.
