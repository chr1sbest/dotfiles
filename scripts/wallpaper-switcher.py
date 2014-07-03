import os
import random

def switcher(path):
    """
    Switches background image on Cinnamon 2.0+ to a random file from 
    the specified directory.
    """
    filename = random.choice(os.listdir(path))
    filepath = "file://{0}{1}".format(path, filename)
    command = 'gsettings set org.cinnamon.desktop.background picture-uri'
    full_command = '{0} "{1}"'.format(command, filepath)
    os.system(full_command)
    print 'Wallpaper switched to {0}'.format(filename)

if __name__ == "__main__":
    path = '/home/chris/Pictures/wallpapers/desktopography/'
    switcher(path)
