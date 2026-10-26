#!/bin/bash
# test file for ALL hashes for all downloaded files,
# used throughout the setup
##########################

source setup/functions.sh # load our functions
source /etc/mailinabox.conf # load global vars

## Nextcloud
nextcloud_ver=27.1.11
nextcloud_hash=9f30c01a021c2e5a9e7baff119955afb3c552ebc

# Always ensure the versions are supported, see https://apps.nextcloud.com/apps/contacts
contacts_ver=5.5.4
contacts_hash=c4e3f2183a0088b829f8aa1b3af1f87c9a4c46a2

# Always ensure the versions are supported, see https://apps.nextcloud.com/apps/calendar
calendar_ver=4.7.20
calendar_hash=12d876904e227156e39ca4335b18481b42a6d00f

# Always ensure the versions are supported, see https://apps.nextcloud.com/apps/user_external
user_external_ver=3.4.0
user_external_hash=7f9d8f4dd6adb85a0e3d7622d85eeb7bfe53f3b4

wget_verify "https://download.nextcloud.com/server/releases/nextcloud-$version.zip" "$hash" /tmp/nextcloud.zip
rm -f /tmp/nextcloud.zip

wget_verify "https://github.com/nextcloud-releases/contacts/releases/download/v$version_contacts/contacts-v$version_contacts.tar.gz" "$hash_contacts" /tmp/contacts.tgz
rm /tmp/contacts.tgz

wget_verify "https://github.com/nextcloud-releases/calendar/releases/download/v$version_calendar/calendar-v$version_calendar.tar.gz" "$hash_calendar" /tmp/calendar.tgz
rm /tmp/calendar.tgz

wget_verify "https://github.com/nextcloud-releases/user_external/releases/download/v$version_user_external/user_external-v$version_user_external.tar.gz" "$hash_user_external" /tmp/user_external.tgz
rm /tmp/user_external.tgz


if [[ ${CURRENT_NEXTCLOUD_VER} =~ ^20 ]]; then
	InstallNextcloud 21.0.7 f5c7079c5b56ce1e301c6a27c0d975d608bb01c9 4.0.7 45e7cf4bfe99cd8d03625cf9e5a1bb2e90549136 3.0.4 d0284b68135777ec9ca713c307216165b294d0fe
	CURRENT_NEXTCLOUD_VER="21.0.7"
fi
if [[ ${CURRENT_NEXTCLOUD_VER} =~ ^21 ]]; then
	InstallNextcloud 22.2.6 9d39741f051a8da42ff7df46ceef2653a1dc70d9 4.1.0 697f6b4a664e928d72414ea2731cb2c9d1dc3077 3.2.2 ce4030ab57f523f33d5396c6a81396d440756f5f 3.0.0 0df781b261f55bbde73d8c92da3f99397000972f
	CURRENT_NEXTCLOUD_VER="22.2.6"
fi
if [[ ${CURRENT_NEXTCLOUD_VER} =~ ^22 ]]; then
	InstallNextcloud 23.0.12 d138641b8e7aabebe69bb3ec7c79a714d122f729 4.1.0 697f6b4a664e928d72414ea2731cb2c9d1dc3077 3.2.2 ce4030ab57f523f33d5396c6a81396d440756f5f 3.0.0 0df781b261f55bbde73d8c92da3f99397000972f
	CURRENT_NEXTCLOUD_VER="23.0.12"
fi
if [[ ${CURRENT_NEXTCLOUD_VER} =~ ^23 ]]; then
	InstallNextcloud 24.0.12 7aa5d61632c1ccf4ca3ff00fb6b295d318c05599 4.1.0 697f6b4a664e928d72414ea2731cb2c9d1dc3077 3.2.2 ce4030ab57f523f33d5396c6a81396d440756f5f 3.0.0 0df781b261f55bbde73d8c92da3f99397000972f
	CURRENT_NEXTCLOUD_VER="24.0.12"
fi
if [[ ${CURRENT_NEXTCLOUD_VER} =~ ^24 ]]; then
	InstallNextcloud 25.0.7 a5a565c916355005c7b408dd41a1e53505e1a080 5.3.0 4b0a6666374e3b55cfd2ae9b72e1d458b87d4c8c 4.4.2 21a42e15806adc9b2618760ef94f1797ef399e2f 3.2.0 a494073dcdecbbbc79a9c77f72524ac9994d2eec
	CURRENT_NEXTCLOUD_VER="25.0.7"
fi
if [[ ${CURRENT_NEXTCLOUD_VER} =~ ^25 ]]; then
	InstallNextcloud 26.0.13 d5c10b650e5396d5045131c6d22c02a90572527c 5.5.3 b234ab410480a4106176a28f39c9b27f471d0473 4.7.6 cf8e68e7d945ee71933f5bb71a969faf152da55c 3.3.0 280d24eb2a6cb56b4590af8847f925c28d8d853e
	CURRENT_NEXTCLOUD_VER="26.0.13"
fi
