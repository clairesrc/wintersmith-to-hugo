#!/usr/bin/bash
mkdir img
for articledir in ./*; do
  if [ "$articledir" != "./img" ]; then
    # Move images if present
    for articlefile in ./"$articledir"/*; do
      articlefileext=${articlefile: -4}
      echo "$articlefileext"
      if [ "$articlefileext" == ".jpg" ] || [ "$articlefileext" == "jpeg" ]; then
        mkdir "./img/$articledir" || true
        mv "$articlefile" "./img/$articlefile"
      fi
    done
  
    # Copy text content and replace the garbage
    findme="template: article.pug"
    sed -e "s/${findme}//g" "$articledir/index.md" > "$articledir.md"

    # Remove other dir
    rm -rf "$articledir"
  fi
done



