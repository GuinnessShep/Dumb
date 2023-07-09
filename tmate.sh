sudo apt-get update
sudo apt-get install tmate
tmate -S $TMATE_SOCK new-session -d
tmate -S $TMATE_SOCK wait tmate-ready
echo "TMATE_SSH=$(tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}')"
echo "TMATE_WEB=$(tmate -S /tmp/tmate.sock display -p '#{tmate_web}')"
echo "SSH connection: $TMATE_SSH"
echo "Web connection: $TMATE_WEB"
