def restart_varnish
  # Change me..
  cmd = `ssh -o "StrictHostKeyChecking no" user@server.com "service varnish restart"`
  puts cmd
  cmd
end

def validate_start cmd
  if cmd.include?("Starting HTTP accelerator varnishd\n   ...done.\n")
    true
  else
    false
  end
end

def validate_stop cmd
  if cmd.include?("Stopping HTTP accelerator varnishd\n   ...done.\n")
    true
  else
    false
  end
end

def validate_restart cmd
  if validate_stop(cmd) && validate_start(cmd)
    true
  else
    false
  end
end
