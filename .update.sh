{
if [ -d "$HOME/C-F_Payloadgen2" ];
then
cd $HOME
rm -rf BillCipher 
elif [ -d "$HOME/C-F_Payloadgen2" ]
then
cd $HOME
rm -rf C-F_Payloadgen2 
else
echo 
exit 1
fi
cd $HOME
sleep 1
echo -e "         \e[96mUPDATING_▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓, PLEASE WAIT FOR A WHILE...!\e[0m" | pv -qL 10
echo
printf "\e[96m]\e[0m"
echo
echo
echo
printf "\e[96m          C-F_Payloadgen2 WAS UPDATED SUCCESSFULL (LATEST VERSION) by the Coding Family..!\e[0m" | pv -qL 10
sleep 2.0
printf "                     \e[96m["
# While process is running...
while git clone https://github.com/dan998/C-F_Payloadgen2 2> /dev/null; do 
    printf  "\e[92m▓▓▓▓▓▓▓▓▓▓▓▓▓\e[0m"
    sleep 1
done
cd $HOME
cd C-F_Payloadgen2y
pip install -r requirements.txt
pip3 install -r requirements.txt
}
vid(){
FILE=$HOME/C-F_Payloadgen2
if [ -f "$FILE" ]; then
pop
else
echo
