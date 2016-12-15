#
# Author Nick Farrow
#
# Initial Release: 0

yourname="Nick"

# List the current WiFi connections
        LISTZ()
        {
                       echo "Listing the current WiFi connections around you."
                nmcli device wifi list

        }



#Shows interface status for wlan0
        INTERFACEZ()
        {
                        echo "Shows interface status for wlan0"
                        nmcli -p -f general,wifi-properties device show wlan0

                }

# Check if your connection is working
        CHECK_CONNECTIONZ()
        {
		echo "Check if your connection is working"
        #nmcli con up id 'Wireless connection 1'
		nmcli d
		sudo ifconfig wlan0
                printf "\n"
        }

# Setup your Wireless connection
        SETUP_CONNECTIONZ()
        {
				echo "Setting up your Wireless connection"
                echo "Please enter your SSID name"
                read messageqqq
				echo "Please enter your SSID password"
                read messageqqq2
				sudo nmcli device wifi connect "$messageqqq" password "$messageqqq2" ifname wlan0
                printf "\n"
        }
		
# Setup your Open Wireless connection
        SETUP_CONNECTIONZ_OPEN()
        {
			echo "Setting up your Open Wireless connection"
                echo "Please enter your SSID name"
                read messageqqq
                sudo nmcli device wifi connect "$messageqqq" ifname wlan0
                printf "\n"
        }

# Disconnect an interface
        DISCONNECTIONZ()
        {
			echo "Disconnecting your interface"
				sudo nmcli device disconnect wlan0
                #sudo nmcli device wifi connect "$messageqqq" ifname wlan0
                printf "\n"
        }


# MAIN BODY OF SCRIPT
#
# Present the menu selection to the user

        echo " What would you like to do?"
        PS3="Please select a numeric option:  "

        select option in List_Networks  Interfaces Check_Connection Setup_Connection Setup_Connection_Open Disconnect Exit

        do
                case "$option"
                        in
                                List_Networks    )  LISTZ;;
                                Interfaces     )  INTERFACEZ;;
                                Check_Connection )  CHECK_CONNECTIONZ;;
                                Setup_Connection )  SETUP_CONNECTIONZ;;
								Setup_Connection_Open )  SETUP_CONNECTIONZ_OPEN;;
								Disconnect )  DISCONNECTIONZ;;
                                Exit         )  exit 0;;
                                *            )  echo "Invalid selection ! ";;
                       esac
       done




