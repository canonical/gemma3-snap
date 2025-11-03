# Gemma3 snap

This snap installs a hardware-optimized engine for inference with the [Gemma 3](https://deepmind.google/models/gemma/gemma-3/) multimodal language model.

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
