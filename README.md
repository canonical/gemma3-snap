# Gemma3 snap
[![gemma3](https://snapcraft.io/gemma3/badge.svg)](https://snapcraft.io/gemma3)

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
