#!/bin/bash
# Run from the root of a synced LineageOS 14.1 source tree.
R="$(cd "$(dirname "$0")/.." && pwd)"
T="$PWD"
[ -d "$T/.repo" ] || { echo "Run this from the root of the synced source tree."; exit 1; }
while read -r path sha; do
  [ -z "$path" ] && continue
  echo "== $path"
  [ -e "$T/$path/.git" ] || { echo "Missing project: $path"; exit 1; }
  git -C "$T/$path" checkout -q -B techzaster-14.1 "$sha" < /dev/null || exit 1
  git -C "$T/$path" -c user.name=TechzasterUI -c user.email=techzaster@localhost am -q --3way "$R"/patches/"$path"/*.patch < /dev/null || { echo "Patch failed in $path (undo with: git -C $path am --abort)"; exit 1; }
done < "$R/scripts/base-revisions.txt"
mkdir -p "$T/vendor"
rm -rf "$T/vendor/techzaster"
cp -r "$R/vendor/techzaster" "$T/vendor/techzaster"
echo "Done. Next: export WITH_SU=true && source build/envsetup.sh && lunch lineage_<codename>-userdebug && brunch <codename>"
