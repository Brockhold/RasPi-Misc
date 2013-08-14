#!/bin/bash
nmap -T5 -n -p 22 --open --min-parallelism 200 10.1.1.0/24