#!/usr/bin/env bash

export BASH_IT_LOG_LEVEL_ERROR=1
export BASH_IT_LOG_LEVEL_WARNING=2
export BASH_IT_LOG_LEVEL_ALL=3

function _has_colors()
{
  # Check that stdout is a terminal
  test -t 1 || return 1

  ncolors=$(tput colors)
  test -n "$ncolors" && test "$ncolors" -ge 8 || return 1
  return 0
}

function _log_general()
{
  _about 'Internal function used for logging, uses BASH_IT_LOG_PREFIX as a prefix'
  _param '1: color of the message'
  _param '2: message to log'
  _group 'log'

  message=${BASH_IT_LOG_PREFIX}$2
  _has_colors && echo -e "$1${message}${echo_normal}" || echo -e "${message}"
}

function _log_debug()
{
  _about 'log a debug message by echoing to the screen. needs BASH_IT_LOG_LEVEL >= BASH_IT_LOG_LEVEL_ALL'
  _param '1: message to log'
  _example '$ _log_debug "Loading plugin git..."'
  _group 'log'

  [[ "$BASH_IT_LOG_LEVEL" -ge $BASH_IT_LOG_LEVEL_ALL ]] || return
  _log_general "${echo_green}" "DEBUG: $1"
}

function _log_warning()
{
  _about 'log a message by echoing to the screen. needs BASH_IT_LOG_LEVEL >= BASH_IT_LOG_LEVEL_WARNING'
  _param '1: message to log'
  _example '$ _log_warning "git binary not found, disabling git plugin..."'
  _group 'log'

  [[ "$BASH_IT_LOG_LEVEL" -ge $BASH_IT_LOG_LEVEL_WARNING ]] || return
  _log_general "${echo_yellow}" " WARN: $1"
}

function _log_error()
{
  _about 'log a message by echoing to the screen. needs BASH_IT_LOG_LEVEL >= BASH_IT_LOG_LEVEL_ERROR'
  _param '1: message to log'
  _example '$ _log_error "Failed to load git plugin..."'
  _group 'log'

  [[ "$BASH_IT_LOG_LEVEL" -ge $BASH_IT_LOG_LEVEL_ERROR ]] || return
  _log_general "${echo_red}" "ERROR: $1"
}
