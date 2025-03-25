FROM loupe-base:latest

RUN apt update
RUN apt install -y build-essential git


# Copy ASM file
COPY dockerfile_data/test /root/test


COPY dockerfile_data/asm-test /root/asm-test
RUN chmod a+x /root/asm-test

# And finally the invocation of Loupe within the container it will run in:
CMD /root/explore.py --output-csv -t /root/asm-test --timeout 30 \
		     -b /root/test --test-sequential --disable-static \
     -- --name=test --size=4K --time_based --runtime=2s
