sudo tee -a /etc/synthetic.conf <<EOF
run	Users/$(whoami)/run
vault	Users/$(whoami)/vault
EOF

mkdir ~/run
mkdir ~/vault

# A restart is needed after this step