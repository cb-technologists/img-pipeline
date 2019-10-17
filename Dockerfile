FROM gcr.io/cloud-builders/gcloud-slim:latest AS gcloud

FROM r.j3ss.co/img:v0.5.7 AS img
USER root
RUN apk add python
COPY --from=gcloud /builder/google-cloud-sdk /home/user/google-cloud-sdk

USER user
# RUN export PATH=$PATH:/home/user/google-cloud-sdk/bin