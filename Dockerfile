# Python Based Docker
FROM python:latest

# Installing Packages
RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y

# Updating Pip Packages
RUN pip3 install -U pip

# Copying Requirements
COPY requirements.txt /requirements.txt

# Installing Requirements
RUN cd /
RUN pip3 install -U -r requirements.txt
RUN mkdir /MessageSearchBot
WORKDIR /MessageSearchBot
COPY start.sh /start.sh

# Running MessageSearchBot
# CMD gunicorn app:app & python3 main.py
CMD ["/bin/bash", "/start.sh", "gunicorn app:app & python3 main.py"]

# # Python Based Docker
# FROM python:latest

# # Installing Packages
# RUN apt update && apt upgrade -y
# RUN apt install git curl python3-pip ffmpeg -y

# # Updating Pip Packages
# RUN pip3 install -U pip

# # Copying Requirements
# COPY requirements.txt /requirements.txt

# # Installing Requirements
# RUN pip3 install -U -r /requirements.txt

# # Create the application directory
# RUN mkdir /MessageSearchBot
# WORKDIR /MessageSearchBot

# # Copy the application code
# COPY main.py /MessageSearchBot/main.py
# COPY configs.py /MessageSearchBot/configs.py
# COPY TeamTeleRoid /MessageSearchBot/TeamTeleRoid
# COPY start.sh /MessageSearchBot/start.sh

# # Ensure the script is executable
# RUN chmod +x /MessageSearchBot/start.sh

# # Running MessageSearchBot
# CMD ["python3", "main.py"]
