echo -e "run\tUsers/$(whoami)/run" | sudo tee -a /etc/syntheic.conf
echo -e "vault\tUsers/$(whoami)/vault" | sudo tee -a /etc/synthetic.conf

mkdir ~/run
mkdir ~/vault