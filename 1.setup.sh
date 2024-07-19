#!/bin/bash

setup_system() {

    # Set keyboard layout to French (AZERTY) and make it primary
    setxkbmap -layout fr -variant azerty
    # Make the change permanent for X session
    gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fr')]"
    echo "Keyboard layout set to French (AZERTY) and made primary."

    # Set automatic suspend settings
    TIME=180  # Time in minutes

    # Convert time to seconds
    TIME_SECONDS=$((TIME * 60))

    # Configure systemd to suspend after the specified time
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout $TIME_SECONDS
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout $TIME_SECONDS

    echo "Automatic suspend set to $TIME minutes."

    # Night-Light Setting
    start_time=$(date -d "21:00" +%s)
    end_time=$(date -d "20:00" +%s)
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
    gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 3000
    gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from $start_time
    gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to $end_time


    # Open Web Session
    google-chrome "https://github.com/login"
    google-chrome "https://learn.zone01oujda.ma/"
    google-chrome "https://auth.openai.com/authorize?client_id=TdJIcbe16WoTHtN95nyywh5E4yOo6ItG&scope=openid%20email%20profile%20offline_access%20model.request%20model.read%20organization.read%20organization.write&response_type=code&redirect_uri=https%3A%2F%2Fchatgpt.com%2Fapi%2Fauth%2Fcallback%2Flogin-web&audience=https%3A%2F%2Fapi.openai.com%2Fv1&device_id=80ee945e-9b60-4ada-801c-4e0124ff0624&prompt=login&screen_hint=login&ext-statsig-tier=production&ext-oai-did=80ee945e-9b60-4ada-801c-4e0124ff0624&flow=control&state=3dRYWdF0UuNNDoexTRDYJ6_8smYIPUtNQRxdLk9QCAg&code_challenge=Wr5hUWjnYMVO7YBMbu2rGBBjBzDKepk9ltbXxlFe2-Q&code_challenge_method=S256"
    google-chrome "https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Fgemini.google.com%2Fadvanced%3Fhl%3Dfr&ec=GAZAkgU&followup=https%3A%2F%2Fgemini.google.com%2Fadvanced%3Fhl%3Dfr&hl=fr&ifkv=AdF4I75BBIzUeRfLMDdvxbzEfNYhbQgHH6YdJ-cuxi9EyjT1mHPZapqGlY1LfmVVTpBqRsrzkNg_-w&passive=1209600&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S1929448932%3A1721347670936296&ddm=0"

    echo "kinoz01"
    echo "ayoub-ammar@protonmail.com"
    echo "singthatmoments"

}


# Function to set up the git alias
setup_git_alias() {
    # 1. Define the function and alias
    GIT_ALIAS_CONTENT="
    # Function to handle git commit and push with a message
    git_push() {
        if [ -z \"\$1\" ]; then
            echo \"You must provide a commit message.\"
        else
            git add .
            git commit -m \"\$1\"
            git push
        fi
    }

    # Alias to call the git_push function
    alias push='git_push'
    "

    # 2. Check if already present in .bashrc
    if grep -q "git_push()" ~/.bashrc; then
        echo "The 'git_push' alias is already present in your ~/.bashrc file."
    else
        # 3. Append to .bashrc
        echo "$GIT_ALIAS_CONTENT" >> ~/.bashrc
        echo "The 'git_push' alias has been added to your ~/.bashrc file."

        # 4. Source .bashrc
        source ~/.bashrc
        echo "Your ~/.bashrc file has been sourced."
    fi
}

alias setpush='setup_git_alias && source ~/.bashrc'
alias setup='setup_system'





