#!/bin/sh

# Create the log directory if it doesn't exist
mkdir -p /tmp/disk-test

# Get the current time
current_time=$(date "+%Y-%m-%d_%H-%M-%S")

# Define the log file path
log_file="/tmp/disk-test/${current_time}.log"

# Write test
echo "Running write test..." | tee -a "$log_file"
fio --name=write_test --ioengine=libaio --iodepth=1 --rw=write --bs=1M --direct=1 --size=1G --numjobs=1 --runtime=60 --group_reporting | tee -a "$log_file"

# Read test
echo "Running read test..." | tee -a "$log_file"
fio --name=read_test --ioengine=libaio --iodepth=1 --rw=read --bs=1M --direct=1 --size=1G --numjobs=1 --runtime=60 --group_reporting | tee -a "$log_file"

# Random Read/Write test
echo "Running random read/write test..." | tee -a "$log_file"
fio --name=randrw_test --ioengine=libaio --iodepth=1 --rw=randrw --rwmixread=70 --bs=4k --direct=1 --size=1G --numjobs=1 --runtime=60 --group_reporting | tee -a "$log_file"

# Sequential Read test
echo "Running sequential read test..." | tee -a "$log_file"
fio --name=seqread_test --ioengine=libaio --iodepth=1 --rw=read --bs=1M --direct=1 --size=1G --numjobs=1 --runtime=60 --group_reporting | tee -a "$log_file"

# Sequential Write test
echo "Running sequential write test..." | tee -a "$log_file"
fio --name=seqwrite_test --ioengine=libaio --iodepth=1 --rw=write --bs=1M --direct=1 --size=1G --numjobs=1 --runtime=60 --group_reporting | tee -a "$log_file"

# IOPS test
echo "Running IOPS test..." | tee -a "$log_file"
fio --name=iops_test --ioengine=libaio --iodepth=64 --rw=randread --bs=4k --direct=1 --size=1G --numjobs=1 --runtime=60 --group_reporting | tee -a "$log_file"

echo "All tests completed. Log file saved at $log_file"
