BEGIN;

--
-- Class EmailFeature as table email_features
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
-- Class Email as table emails
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
-- Class Exclusion as table exclusions
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
-- Class MlModel as table ml_models
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
-- Class Sender as table senders
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
-- Class Summary as table summaries
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
-- Class SummaryItem as table summary_items
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
-- Class UnsubscribeQueue as table unsubscribe_queue
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
-- Class User as table users
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
-- Class WebhookLog as table webhook_logs
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
-- Class AuthKey as table serverpod_auth_key
--
CREATE TABLE "serverpod_auth_key" (
    "id" serial PRIMARY KEY,
    "userId" integer NOT NULL,
    "hash" text NOT NULL,
    "scopeNames" json NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_auth_key_userId_idx" ON "serverpod_auth_key" USING btree ("userId");

--
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" serial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" serial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" serial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" integer NOT NULL,
    "closing" integer NOT NULL,
    "idle" integer NOT NULL,
    "granularity" integer NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" integer NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" serial PRIMARY KEY,
    "sessionLogId" integer NOT NULL,
    "messageId" integer,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" integer NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" integer NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" serial PRIMARY KEY,
    "sessionLogId" integer NOT NULL,
    "serverId" text NOT NULL,
    "messageId" integer NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" integer NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" serial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" serial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" serial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" integer NOT NULL,
    "messageId" integer,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" integer,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" integer NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" serial PRIMARY KEY,
    "number" integer NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" serial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" serial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" integer,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" integer,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Foreign relations for "email_features" table
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
-- Foreign relations for "emails" table
--
ALTER TABLE ONLY "emails"
    ADD CONSTRAINT "emails_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "exclusions" table
--
ALTER TABLE ONLY "exclusions"
    ADD CONSTRAINT "exclusions_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "ml_models" table
--
ALTER TABLE ONLY "ml_models"
    ADD CONSTRAINT "ml_models_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "senders" table
--
ALTER TABLE ONLY "senders"
    ADD CONSTRAINT "senders_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "summaries" table
--
ALTER TABLE ONLY "summaries"
    ADD CONSTRAINT "summaries_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "summary_items" table
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
-- Foreign relations for "unsubscribe_queue" table
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
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
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
