FROM python:3.8-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    && pip install --no-cache-dir \
    jupyter \
    matplotlib \
    pandas \
    numpy \
    tensorflow \
    plotly \
    scikit-learn \
    livelossplot



# Copy the local files into the container
COPY ner_farsi.ipynb /app
COPY Persian_NER.csv /app

# Expose port 8888 for Jupyter Notebook
EXPOSE 8080

# Start Jupyter Notebook
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]

