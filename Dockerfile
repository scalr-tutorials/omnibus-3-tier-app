FROM scalr/factory:ubuntu-14.04

# Install dependencies
ADD ./Gemfile /builder/Gemfile
RUN bash --login -c "cd /builder && bundle install --binstubs"

# Make git happy
RUN git config --global user.email "builder@scalr.com" \
 && git config --global user.name "Scalr Builder"

# Expect the omnibus dir to be mounted as a volume (for speedups)
VOLUME ["/var/omnibus"]

# Expect the result to be mounted as a volume too
ENV OMNIBUS_PACKAGE_DIR /pkg
VOLUME ["/pkg"]

# We don't need an entrypoint, and our script is what we want the default target to be
ENTRYPOINT ["/builder/docker_entrypoint.sh"]
CMD ["/builder/docker_build.sh"]

# Add the rest of the builder repository
ADD . /builder
