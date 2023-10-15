FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y git git-lfs openjdk-11-jre-headless ca-certificates curl gnupg

RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce-cli docker-compose

RUN mkdir -p /app && \
    cd /app && \
    curl https://product-downloads.atlassian.com/software/bitbucket/pipelines/atlassian-bitbucket-pipelines-runner-1.512.tar.gz --output atlassian-bitbucket-pipelines-runner.tar.gz && \
     mkdir atlassian-bitbucket-pipelines-runner && tar -xzvf atlassian-bitbucket-pipelines-runner.tar.gz -C atlassian-bitbucket-pipelines-runner

COPY ./run.sh /app/atlassian-bitbucket-pipelines-runner/bin
RUN chmod +x /app/atlassian-bitbucket-pipelines-runner/bin/run.sh

WORKDIR /app/atlassian-bitbucket-pipelines-runner/bin

VOLUME ["/app/atlassian-bitbucket-pipelines-runner/temp"]


ENV ACCOUNT_UUID="" \
    REPOSITORY_UUID="" \
    RUNNER_UUID="" \
    OAUTH_CLIENT_ID="" \
    OAUTH_CLIENT_SECRET="" \
    WORKING_DIRECTORY="/app/atlassian-bitbucket-pipelines-runner/temp" \
    RUNNER_ENVIRONMENT="PRODUCTION" \
    RUNTIME="linux-shell" \
    DOCKER_URI="unix:///var/run/docker.sock" \
    SCHEDULED_STATE_UPDATE_INITIAL_DELAY_SECONDS="0" \
    SCHEDULED_STATE_UPDATE_PERIOD_SECONDS="30" \
    CLEANUP_PREVIOUS_FOLDERS="false" \
    LOGBACK_CONFIGURATION_FILE="logback.xml"

CMD ["/app/atlassian-bitbucket-pipelines-runner/bin/run.sh"]
