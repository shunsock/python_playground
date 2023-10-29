FROM ubuntu:latest

# Setting Timezone
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dev essentials
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev


ENV HOME="/root"
WORKDIR ${HOME}

# Install pyenv
RUN apt-get install -y git
RUN git clone --depth=1 https://github.com/pyenv/pyenv.git .pyenv
ENV PYENV_ROOT="${HOME}/.pyenv"
ENV PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}"

ENV PYTHON_VERSION=3.12
RUN pyenv install ${PYTHON_VERSION}
RUN pyenv global ${PYTHON_VERSION}

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | \
    POETRY_HOME=/etc/poetry python3 - && \
    echo 'export PATH="$PATH:/etc/poetry/bin"' >> ~/.bashrc
