#!/usr/bin/env ruby

require 'json'

marathon_url = ARGV[0]
app_id = ARGV[1]

tasks_url = "#{marathon_url}/v2/apps/#{app_id}/tasks"
json = `curl -L #{tasks_url} 2>/dev/null`
data = JSON.parse(json)
print data['tasks'].map { |t| "#{t['host']}:#{t['ports'].first}" }.join(',')
