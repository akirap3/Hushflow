BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "senders" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "senders" (
    "id" serial PRIMARY KEY,
    "userId" integer NOT NULL,
    "email" text NOT NULL,
    "name" text,
    "isExcluded" boolean NOT NULL,
    "isBlocked" boolean NOT NULL,
    "isWhitelisted" boolean NOT NULL,
    "isSubscription" boolean NOT NULL,
    "totalEmails" integer NOT NULL,
    "openedEmails" integer NOT NULL,
    "lastEmailAt" timestamp without time zone,
    "detectedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "sender_user_email_idx" ON "senders" USING btree ("userId", "email");
CREATE INDEX "sender_user_excluded_idx" ON "senders" USING btree ("userId", "isExcluded");
CREATE INDEX "sender_user_whitelist_idx" ON "senders" USING btree ("userId", "isWhitelisted");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "senders"
    ADD CONSTRAINT "senders_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR hushflow
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('hushflow', '20260125210408910', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260125210408910', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
