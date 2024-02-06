FROM redis:7.2.4
ARG REDIS_CLUSTER_PORT=6379
RUN echo $REDIS_CLUSTER_PORT
COPY ./redis/redis.conf /usr/local/etc/redis/redis.conf
COPY ./redis/create-cluster.sh /create-cluster.sh
WORKDIR /usr/local/etc/redis
RUN sed -i "s/{{REDIS_CLUSTER_PORT}}/$REDIS_CLUSTER_PORT/g" redis.conf
EXPOSE $REDIS_CLUSTER_PORT
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf"]