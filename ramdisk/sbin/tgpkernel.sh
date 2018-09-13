#!/system/bin/sh
#
# Created by @djb77. Code snippets from @Tkkg1994, and @Morogoku
#

# Set Variables
BB="/sbin/busybox"
RESETPROP="/sbin/magisk resetprop -v -n"

# Mount
$BB mount -t rootfs -o remount,rw rootfs
$BB mount -o remount,rw /system
$BB mount -o remount,rw /data
$BB mount -o remount,rw /

# Set KNOX to 0x0 on running /system
$RESETPROP ro.boot.warranty_bit "0"
$RESETPROP ro.warranty_bit "0"

# Fix Safetynet flags
$RESETPROP ro.build.fingerprint "samsung/dream2ltexx/dream2lte:8.0.0/R16NW/G955FXXU3CRH3:user/release-keys"

# Fix Samsung Related Flags
$RESETPROP ro.fmp_config "1"
$RESETPROP ro.boot.fmp_config "1"

# SELinux (0 / 640 = Permissive, 1 / 644 = Enforcing)
echo "0" > /sys/fs/selinux/enforce
chmod 640 /sys/fs/selinux/enforce

# Stop secure_Storage
stop secure_storage

# SafetyNet
chmod 440 /sys/fs/selinux/policy

# Deepsleep fix (@Chainfire)
for i in `ls /sys/class/scsi_disk/`; do
	cat /sys/class/scsi_disk/$i/write_protect 2>/dev/null | grep 1 >/dev/null
	if [ $? -eq 0 ]; then
		echo 'temporary none' > /sys/class/scsi_disk/$i/cache_type
	fi
done

# Google play services wakelock fix
su -c "pm enable com.google.android.gms/.update.SystemUpdateActivity"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService$ActiveReceiver"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService$Receiver"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService$SecretCodeReceiver"

# Fix personalist.xml
if [ ! -f /data/system/users/0/personalist.xml ]; then
	$BB touch /data/system/users/0/personalist.xml
	$BB chmod 600 /data/system/users/0/personalist.xml
	$BB chown system:system /data/system/users/0/personalist.xml
fi

# init.d
if [ ! -d /system/etc/init.d ]; then
	mkdir -p /system/etc/init.d
fi
chown -R root.root /system/etc/init.d
chmod -R 755 /system/etc/init.d
for FILE in /system/etc/init.d/*; do
	sh $FILE >/dev/null
done;

# Unmount
$BB mount -t rootfs -o remount,ro rootfs;
$BB mount -o remount,ro /system;
$BB mount -o remount,rw /data;
$BB mount -o remount,ro /;

