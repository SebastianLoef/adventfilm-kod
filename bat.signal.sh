# step 1
while true; do

read -p "Har du fått en oförklarig signal? (yn) " yn

case $yn in 
    [yY] ) break;;
    [nN] ) exit;;
    * ) echo Invalid svar;;
esac

done

# Step 2
while true; do

read -p "Är du helt säker? (yn) " yn

case $yn in 
    [yY] ) break;;
    [nN] ) exit;;
    * ) echo Invalid svar;;
esac

done

while true; do

read -p "Heeeeeeeeelt säker? (yn) " yn

case $yn in 
    [yY] ) break;;
    [nN] ) exit;;
    * ) echo Invalid svar;;
esac

done

for i in $(seq 1 9)
do
    echo -n "."
    sleep 0.33s
    if [ $(($i % 3)) -eq 0 ]; then
        echo -e "\r"
    fi

done

echo "Skriv en kort motivering på varför du är säker."

sleep 1s

MOTIVATION=$(cat motivation)
for ((i=0; i<${#MOTIVATION}; i++))
do
  # Print the current character in the string
  echo -n "${MOTIVAITON:$i:1}"
  sleep 0.1s
done

for i in $(seq 1 9)
do
    echo -n "."
    sleep 0.33s
    if [ $(($i % 3)) -eq 0 ]; then
        echo -e "\r"
    fi

done

echo "Okej, fine."
sleep 2s

echo "Krypterar meddelande med SK-128..."
sleep 2s

echo "Hittar VPNer..."
sleep 2s

echo "Skickar krypterat meddelande till team..."
sleep 2s

echo "Färdig."
sleep 2s
