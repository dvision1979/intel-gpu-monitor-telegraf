# intel_gpu_top to extract GPU usage in JSON mode
RAW_JSON=$(/usr/bin/timeout -k 3 3 /usr/bin/intel_gpu_top -J)

# Extract the latest "busy" percentage using grep, sort, and cut
VIDEO_UTIL=$(echo "$RAW_JSON" | grep busy | sort | tail -1 | cut -d ":" -f2 | cut -d "," -f1 | cut -d " " -f2)

# Fallback to 0 if parsing failed
VIDEO_UTIL=${VIDEO_UTIL:-0}

# Current timestamp in seconds
TIMESTAMP=$(date +%s)

# Output JSON in Telegraf's expected format
cat <<EOF
{
  "name": "intel_gpu",
  "timestamp": $TIMESTAMP,
  "intel_gpu_util": $VIDEO_UTIL,
  "gpu": "Intel GPU"
}
EOF

exit 0
