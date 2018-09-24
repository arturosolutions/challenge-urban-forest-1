FROM jupyter/all-spark-notebook

USER root

# Ensure we overwrite the kernel config so that toree connects to cluster
RUN jupyter toree install --sys-prefix --spark_opts="--master yarn --deploy-mode client --driver-memory 512m  --executor-memory 512m  --executor-cores 1 --driver-java-options -Dhdp.version=2.5.3.0-37 --conf spark.hadoop.yarn.timeline-service.enabled=false"

COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}