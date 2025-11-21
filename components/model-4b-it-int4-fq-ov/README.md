# Gemma3 3b optimized for Intel CPU and Intel GPU

The model is optimized for Intel hardware and distributed in Intermediate Representation (IR) on Huggingface.

Install Git and Git LFS:
```
sudo apt install git git-lfs
```

Clone:
```
git clone --depth 1 https://huggingface.co/llmware/gemma-3-4b-it-ov-int4-fq
git -C gemma-3-4b-it-ov-int4-fq lfs prune --force
```

At startup OVMS (single model mode) creates the mediapipe graph file inside the model directory.
This directory is read-only when it is inside a component.
By adding a symlink with the file's name inside the model directory, pointing to /tmp, OVMS will follow the symlink during runtime and instead create the file in /tmp:
```
ln -s /tmp/graph.pbtxt ./gemma-3-4b-it-ov-int4-fq/graph.pbtxt
```
