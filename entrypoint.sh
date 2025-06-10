#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

echo "qBittorrent MCP Service: Initializing..."

# Validate required environment variables
if [ -z "$QBITTORRENT_URL" ]; then
    echo "Error: QBITTORRENT_URL environment variable is required"
    exit 1
fi

if [ -z "$QBITTORRENT_USER" ]; then
    echo "Error: QBITTORRENT_USER environment variable is required"
    exit 1
fi

if [ -z "$QBITTORRENT_PASS" ]; then
    echo "Error: QBITTORRENT_PASS environment variable is required"
    exit 1
fi

# Set defaults for MCP server configuration
export QBITTORRENT_MCP_HOST=${QBITTORRENT_MCP_HOST:-"0.0.0.0"}
export QBITTORRENT_MCP_PORT=${QBITTORRENT_MCP_PORT:-"9154"}
export QBITTORRENT_MCP_TRANSPORT=${QBITTORRENT_MCP_TRANSPORT:-"sse"}
export QBITTORRENT_LOG_LEVEL=${QBITTORRENT_LOG_LEVEL:-"INFO"}

echo "qBittorrent MCP Service: Configuration validated"
echo "  - QBITTORRENT_URL: $QBITTORRENT_URL"
echo "  - QBITTORRENT_USER: $QBITTORRENT_USER"
echo "  - QBITTORRENT_PASS: ***SET***"
echo "  - MCP_HOST: $QBITTORRENT_MCP_HOST"
echo "  - MCP_PORT: $QBITTORRENT_MCP_PORT"
echo "  - MCP_TRANSPORT: $QBITTORRENT_MCP_TRANSPORT"
echo "  - LOG_LEVEL: $QBITTORRENT_LOG_LEVEL"

# Change to app directory (important for relative path handling)
cd /app

echo "qBittorrent MCP Service: Starting server..."
exec python3 qbittorrent-mcp-server.py 