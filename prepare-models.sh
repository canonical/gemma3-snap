#!/bin/bash

# gemma-3-4b-it-ov-int4-fq
pushd components/model-4b-it-int4-fq-ov
git clone --depth 1 https://huggingface.co/llmware/gemma-3-4b-it-ov-int4-fq
git -C gemma-3-4b-it-ov-int4-fq lfs prune --force
ln -s /tmp/graph.pbtxt ./gemma-3-4b-it-ov-int4-fq/graph.pbtxt
popd
