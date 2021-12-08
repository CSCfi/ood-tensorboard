# wait for the Tensorboard server to start
echo "$(date): waiting for Tensorboard server to open port ${app_port}..."

if wait_until_port_used "${host}:${port}" 300; then
    echo "$(date): discovered Tensorboard server listening on port ${app_port}!"
else
  echo "$(date): timed out waiting for Tensorboard server to open port ${app_port}!"
  echo "- wait ended at: $(date)"
  pkill -P ${SCRIPT_PID}
  clean_up 1
fi

sleep 5
