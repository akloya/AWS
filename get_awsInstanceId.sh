#!/bin/bash
# Author: Ajaya Kumar Loya
# This script will give you the instanceID when executed.
# Note this need be running on a Instance of which you need Instance ID.

export INSTANCE_ID=`curl --silent http://169.254.169.254/latest/meta-data/instance-id`
echo "Instance ID => "${INSTANCE_ID}
