#!/bin/bash

setup_system() {

    # Set keyboard layout to French (AZERTY) and add English and Arabic layouts
    setxkbmap -layout fr,us,ar -variant azerty, , -option 'grp:win_space_toggle'
    # Make the change permanent for X session
    gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fr'), ('xkb', 'us'), ('xkb', 'ar')]"
    echo "Keyboard layout set to French (AZERTY) as primary, with English and Arabic added. Switch using Windows key + Space."

    # Set automatic suspend settings
    TIME=180  # Time in minutes

    # Convert time to seconds
    TIME_SECONDS=$((TIME * 60))

    # Configure systemd to suspend after the specified time
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout $TIME_SECONDS
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout $TIME_SECONDS

    echo "Automatic suspend set to $TIME minutes."


    # Open Web Session
    google-chrome "https://discord.com/login"
    google-chrome "https://github.com/login"
    google-chrome "https://learn.zone01oujda.ma/"
    google-chrome "https://auth.openai.com/authorize?client_id=TdJIcbe16WoTHtN95nyywh5E4yOo6ItG&scope=openid%20email%20profile%20offline_access%20model.request%20model.read%20organization.read%20organization.write&response_type=code&redirect_uri=https%3A%2F%2Fchatgpt.com%2Fapi%2Fauth%2Fcallback%2Flogin-web&audience=https%3A%2F%2Fapi.openai.com%2Fv1&device_id=80ee945e-9b60-4ada-801c-4e0124ff0624&prompt=login&screen_hint=login&ext-statsig-tier=production&ext-oai-did=80ee945e-9b60-4ada-801c-4e0124ff0624&flow=control&state=3dRYWdF0UuNNDoexTRDYJ6_8smYIPUtNQRxdLk9QCAg&code_challenge=Wr5hUWjnYMVO7YBMbu2rGBBjBzDKepk9ltbXxlFe2-Q&code_challenge_method=S256"
    google-chrome "https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Fgemini.google.com%2Fadvanced%3Fhl%3Dfr&ec=GAZAkgU&followup=https%3A%2F%2Fgemini.google.com%2Fadvanced%3Fhl%3Dfr&hl=fr&ifkv=AdF4I75BBIzUeRfLMDdvxbzEfNYhbQgHH6YdJ-cuxi9EyjT1mHPZapqGlY1LfmVVTpBqRsrzkNg_-w&passive=1209600&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S1929448932%3A1721347670936296&ddm=0"

    echo "kinoz01"
    echo "ayoub-ammar@protonmail.com"
    echo "singthatmoments"

}

# Function to set up all your aliases
setup_aliases() {
    # Define a function to easily create new aliases
    add_alias() {
        local alias_name="$1"
        local alias_command="$2"

        # Check if the alias already exists
        if grep -q "^alias $alias_name='.*'" ~/.bashrc; then
            echo "Alias '$alias_name' already exists."
            return
        fi

        # Append the new alias to .bashrc
        echo "alias $alias_name='$alias_command'" >> ~/.bashrc
        echo "Added alias '$alias_name'."
    }

    # Create your desired aliases
    add_alias push 'git_push() {
        if [ -z "$1" ]; then
            echo "You must provide a commit message."
        else
            git add .
            git commit -m "$1"
            git push
        fi
    }'

    add_alias gg 'go run .'
    
    add_alias gm 'go run main.go'

    add_alias gbb 'go build -o zapp . && ./zapp'

    # Add more aliases here in the same format:
    # add_alias <alias_name> '<alias_command>'
}

# Call the function to set up the aliases
alias setal='setup_aliases && source ~/.bashrc'
alias setup='setup_system'



