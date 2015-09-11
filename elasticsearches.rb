#!/usr/bin/env ruby

marathon_url = ARGV[0]
app_id = ARGV[1]

tasks_url = "#{marathon_url}/v2/apps/#{app_id}/tasks"
data = `curl -L #{tasks_url} 2>/dev/null`.split("\n")
transport_lines = []
data.each_with_index { |line, i| transport_lines << line if i % 2 == 0 }
print transport_lines.map { |t| t.split(/\s/).last }.join(',')
