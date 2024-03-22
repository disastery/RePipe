# Build Repipe
default: linux

.PHONY: repipe_linux
linux:
	@echo "Building repipe binary to './builds/repipe'"
	@(cd cmd/; CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build --ldflags "-s -w" -o ../builds/repipe)

.PHONY: repipe_osx
osx:
	@echo "Building repipe(osx) m1 binary to './builds/repipe_osx'"
	@(cd cmd/; CGO_ENABLED=1 GOOS=darwin GOARCH=arm64 go build --ldflags "-s -w" -o ../builds/repipe_osx)

.PHONY: repipe_osx_x86
osx_x86:
	@echo "Building repipe(osx) x86 binary to './builds/repipe_osx_x86'"
	@(cd cmd/; CGO_ENABLED=1 GOOS=darwin GOARCH=amd64 go build --ldflags "-s -w" -o ../builds/repipe_osx_x86)

.PHONY: repipe_win
windows:
	@echo "Building repipe(windows) binary to './builds/repipe_win.exe'"
	@(cd cmd/; CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build --ldflags "-s -w" -o ../builds/repipe_win.exe)

clean:
	@echo "Cleaning up all the generated files"
	@find . -name '*.test' | xargs rm -fv
	@find . -name '*~' | xargs rm -fv
	@rm -rvf repipe_win.exe repipe_osx repipe_osx_m1 repipe
 
install: install_linux

.PHONY: repipe_install_linux
install_linux:
	@echo "Installing Repipe Proxy to /usr/sbin/repipe directory"
	@cp -f builds/repipe /usr/sbin/repipe
	@mkdir -p /etc/repipe
	@mkdir -p /etc/repipe/ssl
	@mkdir -p /var/log/repipe
	@mkdir -p /var/www/html
	@cp -n app.yaml.example /etc/repipe
	@cp -n certgen.sh /etc/repipe/ssl
	@printf "[Unit]\nDescription=Repipe the Reverse Proxy\n\n[Service]\nType=simple\nRestart=always\n\RestartSec=5s\nExecStart=/usr/sbin/repipe\n\n[Install]\nWantedBy=multi-user.target\n" > /lib/systemd/system/repipe.service
	@echo "Start Repipe service using"
	@echo "-----------------------------------"
	@echo " $> sudo service repipe start"
	@echo "-----------------------------------"
	@echo "Enabling Service"
	@systemctl enable repipe.service


