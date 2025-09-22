FROM rust:1.90-alpine AS build
COPY . /app
RUN ls -laR /app
WORKDIR /app
RUN cargo install --path . --root dest --no-track

FROM scratch
COPY --from=build /app/dest /
ENTRYPOINT ["/bin/hello"]
