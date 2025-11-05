#!/bin/bash
# =========================================
# Script: mysql_backup.sh
# Description:
#   Takes a MySQL database backup with timestamp
#   and creates a daily log file
# =========================================

# ---- CONFIGURATION ----
MYSQL_USER="root"
MYSQL_PASSWORD="Test@123"
MYSQL_HOST="localhost"
MYSQL_DATABASE="myappdb"

# Backup and log locations
BACKUP_DIR="/home/ubuntu/backups/mysql"
LOG_DIR="/var/log/mysql_backups"

# Timestamp variables
DATE=$(date +%F_%H-%M-%S)
DAY=$(date +%F)
BACKUP_FILE="${BACKUP_DIR}/${MYSQL_DATABASE}_${DATE}.sql.gz"
LOG_FILE="${LOG_DIR}/mysql_backup_${DAY}.log"

# ---- CREATE DIRECTORIES ----
mkdir -p "$BACKUP_DIR"
sudo mkdir -p "$LOG_DIR"
sudo touch "$LOG_FILE"
sudo chmod 666 "$LOG_FILE"

# ---- START LOGGING ----
{
echo "=============================================="
echo "Backup started at: $(date)"
echo "Database: $MYSQL_DATABASE"
echo "Backup file: $BACKUP_FILE"

# ---- RUN BACKUP ----
echo "Running backup..."
mysqldump -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" | gzip > "$BACKUP_FILE"

# ---- VERIFY BACKUP ----
if [ $? -eq 0 ]; then
  echo "Backup successful!"
  echo "Backup stored at: $BACKUP_FILE"
else
  echo "Backup failed!"
  exit 1
fi
