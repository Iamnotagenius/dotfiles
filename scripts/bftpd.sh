#!/bin/bash
  
  case "$1" in
    'start')
      echo "Starting bftpd Server"
      /usr/sbin/bftpd -d
      ;;
    'stop')
      echo "Stopping bftpd Server"
      killall bftpd
      ;;
    'restart')
      $0 stop
      sleep 1
      $0 start
      ;;
    *)
  echo "usage: $0 {start|stop|restart}"
  esac