sudo cp ./services/bollettini-dotnet.service /etc/systemd/system/bollettini-dotnet.service
sudo systemctl enable bollettini-dotnet.service
sudo systemctl start bollettini-dotnet.service