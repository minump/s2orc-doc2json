FROM python:3-alpine3.12

RUN apk --update add python3 py3-pip && rm -rf /var/lib/apt/lists/*

COPY doc2json ./doc2json
COPY tests ./tests
COPY build_run.sh ./
COPY setup.py ./


CMD build_run.sh

WORKDIR /
CMD ["python","doc2json/grobid2json/process_pdf.py -i tests/pdf/N18-3011.pdf -t temp_dir/ -o output_dir/"]
