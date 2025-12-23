BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "email_features" (
    "id" serial PRIMARY KEY,
    "emailId" integer NOT NULL,
    "userId" integer NOT NULL,
    "senderFrequency" integer NOT NULL,
    "senderOpenRate" double precision NOT NULL,
    "keywordVector" text,
    "hasUnsubscribeLink" boolean NOT NULL,
    "contentLength" integer NOT NULL,
    "imageCount" integer NOT NULL,
    "linkCount" integer NOT NULL,
    "hourReceived" integer NOT NULL,
    "dayOfWeek" integer NOT NULL,
    "wasOpened" boolean,
    "wasClicked" boolean,
    "interactionTime" integer
);

-- Indexes
CREATE UNIQUE INDEX "feature_email_idx" ON "email_features" USING btree ("emailId");
CREATE INDEX "feature_user_idx" ON "email_features" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "emails" (
    "id" serial PRIMARY KEY,
    "userId" integer NOT NULL,
    "gmailId" text NOT NULL,
    "threadId" text,
    "sender" text NOT NULL,
    "senderEmail" text NOT NULL,
    "subject" text NOT NULL,
    "snippet" text,
    "bodyPlain" text,
    "bodyHtml" text,
    "receivedAt" timestamp without time zone NOT NULL,
    "isRead" boolean NOT NULL,
    "isSubscription" boolean NOT NULL,
    "priorityScore" double precision NOT NULL,
    "labels" json,
    "category" text,
    "hasImages" boolean NOT NULL,
    "valuableImageUrl" text,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "email_gmail_idx" ON "emails" USING btree ("gmailId");
CREATE INDEX "email_user_received_idx" ON "emails" USING btree ("userId", "receivedAt");
CREATE INDEX "email_user_unread_idx" ON "emails" USING btree ("userId", "isRead");
CREATE INDEX "email_user_subscription_idx" ON "emails" USING btree ("userId", "isSubscription");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "exclusions" (
    "id" serial PRIMARY KEY,
    "userId" integer NOT NULL,
    "type" text NOT NULL,
    "value" text NOT NULL,
    "reason" text,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "exclusion_user_type_idx" ON "exclusions" USING btree ("userId", "type");
CREATE UNIQUE INDEX "exclusion_user_value_idx" ON "exclusions" USING btree ("userId", "type", "value");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ml_models" (
    "id" serial PRIMARY KEY,
    "userId" integer NOT NULL,
    "version" integer NOT NULL,
    "modelPath" text NOT NULL,
    "trainingSize" integer NOT NULL,
    "accuracy" double precision,
    "trainedAt" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL
);

-- Indexes
CREATE INDEX "model_user_active_idx" ON "ml_models" USING btree ("userId", "isActive");

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
    "totalEmails" integer NOT NULL,
    "openedEmails" integer NOT NULL,
    "lastEmailAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "sender_user_email_idx" ON "senders" USING btree ("userId", "email");
CREATE INDEX "sender_user_excluded_idx" ON "senders" USING btree ("userId", "isExcluded");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "summaries" (
    "id" serial PRIMARY KEY,
    "userId" integer NOT NULL,
    "title" text NOT NULL,
    "content" text NOT NULL,
    "audioUrl" text,
    "emailCount" integer NOT NULL,
    "generatedAt" timestamp without time zone NOT NULL,
    "periodStart" timestamp without time zone NOT NULL,
    "periodEnd" timestamp without time zone NOT NULL,
    "isRead" boolean NOT NULL
);

-- Indexes
CREATE INDEX "summary_user_generated_idx" ON "summaries" USING btree ("userId", "generatedAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "summary_items" (
    "id" serial PRIMARY KEY,
    "summaryId" integer NOT NULL,
    "emailId" integer NOT NULL,
    "sender" text NOT NULL,
    "subject" text NOT NULL,
    "summaryText" text NOT NULL,
    "imageUrl" text,
    "priorityScore" double precision NOT NULL,
    "order" integer NOT NULL
);

-- Indexes
CREATE INDEX "summary_item_summary_idx" ON "summary_items" USING btree ("summaryId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "unsubscribe_queue" (
    "id" serial PRIMARY KEY,
    "userId" integer NOT NULL,
    "emailId" integer NOT NULL,
    "senderEmail" text NOT NULL,
    "unsubscribeLink" text,
    "status" text NOT NULL,
    "action" text,
    "processedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "unsub_user_status_idx" ON "unsubscribe_queue" USING btree ("userId", "status");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" serial PRIMARY KEY,
    "googleId" text NOT NULL,
    "email" text NOT NULL,
    "accessToken" text,
    "refreshToken" text,
    "tokenExpiresAt" timestamp without time zone,
    "historyId" text,
    "summarySchedule" text,
    "timezone" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_google_idx" ON "users" USING btree ("googleId");
CREATE UNIQUE INDEX "user_email_idx" ON "users" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "webhook_logs" (
    "id" serial PRIMARY KEY,
    "messageId" text NOT NULL,
    "historyId" text,
    "payload" text NOT NULL,
    "status" text NOT NULL,
    "error" text,
    "receivedAt" timestamp without time zone NOT NULL,
    "processedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "webhook_message_idx" ON "webhook_logs" USING btree ("messageId");
CREATE INDEX "webhook_status_idx" ON "webhook_logs" USING btree ("status", "receivedAt");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "email_features"
    ADD CONSTRAINT "email_features_fk_0"
    FOREIGN KEY("emailId")
    REFERENCES "emails"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "email_features"
    ADD CONSTRAINT "email_features_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "emails"
    ADD CONSTRAINT "emails_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "exclusions"
    ADD CONSTRAINT "exclusions_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "ml_models"
    ADD CONSTRAINT "ml_models_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "summaries"
    ADD CONSTRAINT "summaries_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "summary_items"
    ADD CONSTRAINT "summary_items_fk_0"
    FOREIGN KEY("summaryId")
    REFERENCES "summaries"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "summary_items"
    ADD CONSTRAINT "summary_items_fk_1"
    FOREIGN KEY("emailId")
    REFERENCES "emails"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "unsubscribe_queue"
    ADD CONSTRAINT "unsubscribe_queue_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "unsubscribe_queue"
    ADD CONSTRAINT "unsubscribe_queue_fk_1"
    FOREIGN KEY("emailId")
    REFERENCES "emails"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR hushflow
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('hushflow', '20251223193710692', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251223193710692', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
