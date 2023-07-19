url_default="https://www.w3schools.com/"
downloadFolder_default="/media/redacerubuntu/files/downloads/httrack/test2"

url="${1:-$url_default}"
downloadFolder="${2:-$downloadFolder_default}"

# url="https://www.w3schools.com/"
# downloadFolder="/media/redacerubuntu/files/downloads/httrack/test"

clean() {
    local a=${1//[^[:alnum:]]/}
    echo "${a,,}"
}

folderUrl=$(clean $url)
echo "folderUrl = ${folderUrl}"

folderDate="$(date +"%d_%m_%Y")"

downloadWebsiteFolder="${downloadFolder}/${folderUrl}/${folderDate}/";

echo "downloading ${url}"
echo "saving at path ${downloadWebsiteFolder}"
httrack $url -O "${downloadWebsiteFolder}"


