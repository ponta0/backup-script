echo "backup start"

cat backup_dir.txt | xargs -I AAAA sh -c "tar czvf - AAAA/ | openssl enc -e -aes-256-cbc -k password -in - -out AAAA_backup_`date +%Y%m%d_%H-%M-%S`.tar.gz.aes | tee AAAA_backup_log_`date +%Y%m%d_%H-%M-%S`.log"
echo "upload start"
mv *_backup_* /home/user/drive/backup
cp dec.txt /home/user/drive/backup
echo "upload done"

echo "all done"