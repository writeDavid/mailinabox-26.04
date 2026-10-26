#!/bin/bash
# test file for ALL hashes for all downloaded files,
# used throughout the setup
##########################

source ../setup/functions.sh # load our functions

function wget_verify_all {
    URL=$1
    HASH_SHA1=$2
    HASH_SHA256=$3
    DEST=$4
    # Future release of function will check against provided digest sidecars
    # These will be extremely basic (only available if .sha1 or .sha256)
    SIDECAR_SHA1_DIGEST_AVAILABLE=$5
    SIDECAR_SHA256_DIGEST_AVAILABLE=$6
    CHECKSUM_SHA1="$HASH_SHA1 $DEST"
    CHECKSUM_SHA256="$HASH_SHA256 $DEST"

    # Clear any previously downloaded files
    rm -f "$DEST"

    # Download, then verify both SHA1 and SHA256 hash against expected hash
    hide_output wget -O "$DEST" "$URL"

    echo "Computed hashes..."
    echo "SHA1:"
    sha1sum "$DEST"
    echo "SHA256:"
    sha256sum "$DEST"
    echo
    echo "Verifying hashes..."
    echo "SHA1:"
    if ! echo "$CHECKSUM_SHA1" | sha1sum --check --strict > /dev/null; then
        echo "------------------------------------------------------------"
        echo "FAILED! Expected:"
        echo "Expected:"
        echo "$CHECKSUM_SHA1"
    else
        echo "OK!"
    fi
    echo "SHA256:"
    if ! echo "$CHECKSUM_SHA256" | sha256sum --check --strict > /dev/null; then
        echo "------------------------------------------------------------"
        echo "FAILED! Expected:"
        echo "Expected:"
        echo "$CHECKSUM_SHA256"
    else
        echo "OK!"
    fi
    echo
}

# How to search these arrays using a version number
function get_nextcloud_version_hashes {
    VERSION=$1

    for index in "${!array_name[@]}"; do
        if [[ "${array_name[$index]}" == "$VERSION"]]; then
            echo "Found '$VERSION'"
            echo "$index"
        fi
    done

    # Now that we have the index number, we would just search each array
    # using the index, and pass the hashes back by setting a global variable
    #


    ## NEXTCLOUD_HASHES=$($hash_array)
}

## Nextcloud Server
#
# If we want to refactor the upgrade process
# We could just state the desired version number
# and it will determine the number of walks we need to do
# and provide the hashes for each step
# (more upfront work, but better reusability in the long run)
#
# Currently 15 versions (updated as of 10/26/2026) (only version 32 and above will ever change past this date)
declare -a nextcloud_version=("21.0.7" "22.2.6" "23.0.12" "24.0.12" "25.0.7" "26.0.13" "27.1.11" "28.0.14" "29.0.16" "30.0.17" "31.0.14" "32.0.15" "33.0.10" "34.0.5" "35.0.2")

# sha1 values
# Currently 15 versions
declare -a nextcloud_hash_sha1=("f5c7079c5b56ce1e301c6a27c0d975d608bb01c9" # 21.0.7
    "9d39741f051a8da42ff7df46ceef2653a1dc70d9" # 22.2.6
    "d138641b8e7aabebe69bb3ec7c79a714d122f729" # 23.0.12
    "7aa5d61632c1ccf4ca3ff00fb6b295d318c05599" # 24.0.12
    "a5a565c916355005c7b408dd41a1e53505e1a080" # 25.0.7
    "d5c10b650e5396d5045131c6d22c02a90572527c" # 26.0.13
    "9f30c01a021c2e5a9e7baff119955afb3c552ebc" # 27.1.11
    "8a9edcfd26d318eb7d1cfa44d69796f2d1098a80" # 28.0.14
    "ceb3014aaddc70d3074d2c69bc6afc76eb1aeff0" # 29.0.16
    "0494197f1984ce8a2f83084c0759a24d48474017" # 30.0.17
    "a891fede2cd4cb3347a406da3fb4f99cd62c89ce" # 31.0.14
    "f13d45819bf2ec3fe83c9c3078324144eff45568" # 32.0.15
    "debd92e9249192368108975433035e7b647563d9" # 33.0.10
    "dd2998ea28f8951cecab5e0e40eb44652686fa04" # 34.0.5
    "73b0fedd3c6c48c5ab26d8105cd8a928f9f8ca5e" # 35.0.2
)

# sha256 values
# Currently 15 versions
declare -a nextcloud_hash_sha256=("2be2c2eebe42b41fdbb53e82b1dffc82d3324baeff1ce5392de0fd804052404f" # 21.0.7
      "164c53eaa5ed6d45329935bd33266c16e8a0355541c3c92a39f01af3d359abae" # 22.2.6
      "fee74cff6fbe70c32ded247705c719aadc83d6d2d158e4fd9ce1b3a8945f7830" # 23.0.12
      "4d15c3e9c3c71b54c177d483b939101ac44c1a2cc002fe8dbf1cd700807f028b" # 24.0.12
      "f9552ea261910d993d3712ff9f85e1f48f6e276c7c7c12e78a25519c8ade344a" # 25.0.7
      "5fa3414784fc856cb4903cc2badd19d7baedd7e5ae1e3a17111d4e26f9ae2a20" # 26.0.13
      "ffbfd9857bcaaacaea97d709063b7d81132feb41051063ab6c171c95c6daf142" # 27.1.11
      "593f174f5098c793fb0314fd5847d891ed4e4db908ceba0d4e571544ac855c2d" # 28.0.14
      "6221c764b63369be6122bc414ee26a25bd9ce466f7d9ab29cd5ddb0c124c8eeb" # 29.0.16
      "da51e17762785a36c1cf3fe2dc96cb356870695e384485e5980395493c15caf9" # 30.0.17
      "6f34d623f7c24c5ecb3c165083ddb5d6a10186dbc2fa73a23efda26ec92091a7" # 31.0.14
      "33e7adbe81c1ad0be61123a0fadc63ae2e392759f0c2557e008863eb69c6453d" # 32.0.15
      "ff602a1f1ba202f2137f10eecd201d3e80c5d94fd17ab984c688fb1bcb290645" # 33.0.10
      "d077fdca3dc78ef60b5bbc51182f2a1737aa01e2044d6c23f4e7b72146f5239a" # 34.0.5
      "2f1dcec6a7cdab70346e80a823ccaaa2001a6085013d9f2ae0a2606fa38c2835" # 35.0.2
)

for i in "${!nextcloud_version[@]}"
do
    echo "Testing Nextcloud Server SHAs for version" "${nextcloud_version[$i]}"
    wget_verify_all "https://download.nextcloud.com/server/releases/nextcloud-${nextcloud_version[$i]}.zip" "${nextcloud_hash_sha1[$i]}" "${nextcloud_hash_sha256[$i]}" /tmp/nextcloud-${nextcloud_version[$i]}.zip "false" "false"
    rm -f /tmp/nextcloud-${nextcloud_version[$i]}.zip
done
