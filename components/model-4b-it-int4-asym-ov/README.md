# Gemma 3 for OpenVINO

Source: https://huggingface.co/Echo9Zulu/gemma-3-4b-it-OpenVINO

Only keep `gemma-3-4b-it-int4_asym-ov` subdirectory.


At startup OVMS (single model mode) creates the mediapipe graph file inside the model directory.
This directory is read-only when it is inside a component.
By adding a symlink with the file's name inside the model directory, pointing to /tmp, OVMS will follow the symlink during runtime and instead create the file in /tmp:
```
ln -s /tmp/graph.pbtxt ./gemma-3-4b-it-int4_asym-ov/graph.pbtxt
```
