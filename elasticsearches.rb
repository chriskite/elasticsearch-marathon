#!/usr/bin/env ruby

marathon_url = ARGV[0]
app_id = ARGV[1]

tasks_url = "#{marathon_url}/v2/apps/#{app_id}/tasks"
data = `curl -L #{tasks_url} 2>/dev/null`.split("\n").first
print data.split(/\s/)[2..-1].join(",")
