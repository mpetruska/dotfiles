#!/usr/bin/env bash

df -hT -x tmpfs -x devtmpfs || true
