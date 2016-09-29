echo "EVENT: ${SERF_EVENT}" >> serf.log

if [[ $SERF_EVENT == "user" ]]; then
    echo "USER EVENT: ${SERF_USER_EVENT}" >> serf.log
fi

if [[ $SERF_EVENT == "query" ]]; then
    echo "QUERY NAME: ${SERF_QUERY_NAME}" >> serf.log
fi

echo "BODY:" >> serf.log
cat /dev/stdin >> serf.log
echo "" >> serf.log
