#!/bin/bash
eksctl create cluster --name=todo-app-cluster0009 \
                    --region=us-west-2 \
                    --version=1.30 \
                    --without-nodegroup