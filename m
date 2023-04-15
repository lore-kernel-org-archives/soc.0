Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D805C77B76
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 232D8C4339C; Sat, 15 Apr 2023 10:43:25 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15AC6C4339B
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 15AC6C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5058181d58dso2757720a12.1
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555402; x=1684147402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOqB6Hh2cSpiNdbIkRosOrKqQ+RZFx7UN3jJlAfn/7k=;
        b=wOIFkjp98Oot9k1oi5lJxXgNJfK/wWjEj5CW+I6Suhrx9f7FAmmZ0U+gkd2j8pjya7
         PTBfIYHP43DDauhySLvsvTyvTiE+kvoiIzO4t/wrIHW3JUVSj73EF2AKut5rUXYkkIKE
         SpLt2AQDIu7Jb4i8YvXFwYLl0G6KmevFbc3cvcQemaNDpYGIubgFUHiGnyWSEXXVjYCI
         BowNq1zRGpC8udrcx1nx31t1u0KaZcp1NQZWSU5A7kBpWec8Lv6scsczZQyH5R9ljTAv
         WhmSFQb0Z/WLwMRvj24+vJqSpYORz62lvvivOeoYgeM8iV8dfvA3fChXrrc5c7THpyCk
         A6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555402; x=1684147402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOqB6Hh2cSpiNdbIkRosOrKqQ+RZFx7UN3jJlAfn/7k=;
        b=f2nEzgcFZdsm/t+VOtO+dlNId6ZM7+cztmxA7k5YYnWXcFtQmD/MNzgK4jalj7J+Oq
         xLRC9EBUSgYOTo786/jI2ONtFglYgtmNFekjD9jICUwk9mI/oCwb9mG9/zVJfKtsZPMM
         99lRR3woFYv0R4JG09vjBAQnRv/lZE/TrQkddp26EJyGTjLwiBFJOftDJzD5HIW3NddI
         +1sTdVxVTQGblLFyMHlNxgJVwebbQhIfyxh3iDP0EspI1EV1ZoefJVEap1PFUmk8W68q
         Q/H05nOkYCr4tFSpCJ6qMrkzPHqlhYIea7guXxUswnjzF9zLFVmDupjJGxmbtm2mzp7j
         QMXA==
X-Gm-Message-State: AAQBX9fYc1ZH9Snr7KChOEadq0zYInKxHy8S7NpTTlSjliD6pEVACT0J
	fJk0hqMBXx91EtDQzDobsn1z0g==
X-Google-Smtp-Source: AKy350Ypa5Fu8Ca+HIsIdof7rvkA01OBiRVW51R7F246z8aRdNC9/gILiVEQwvADspd8tMNUIMBgfw==
X-Received: by 2002:aa7:da0d:0:b0:506:8884:7f5 with SMTP id r13-20020aa7da0d000000b00506888407f5mr2820270eds.41.1681555402312;
        Sat, 15 Apr 2023 03:43:22 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/15] w1: use octal for file permissions
Date: Sat, 15 Apr 2023 12:42:54 +0200
Message-Id: <20230415104304.104134-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve code readability and checkpatch warnings:

  WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/masters/ds2482.c    | 2 +-
 drivers/w1/masters/omap_hdq.c  | 2 +-
 drivers/w1/slaves/w1_ds2406.c  | 4 ++--
 drivers/w1/slaves/w1_ds2413.c  | 2 +-
 drivers/w1/slaves/w1_ds2805.c  | 2 +-
 drivers/w1/slaves/w1_ds28e17.c | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
index 806e352c8292..90c0a33747db 100644
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@ -36,7 +36,7 @@ MODULE_PARM_DESC(active_pullup, "Active pullup (apply to all buses): " \
 
 /* extra configurations - e.g. 1WS */
 static int extra_config;
-module_param(extra_config, int, S_IRUGO | S_IWUSR);
+module_param(extra_config, int, 0644);
 MODULE_PARM_DESC(extra_config, "Extra Configuration settings 1=APU,2=PPM,3=SPU,8=1WS");
 
 /*
diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
index bf2ec59c1f9d..ae3e504cd543 100644
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -48,7 +48,7 @@
 static DECLARE_WAIT_QUEUE_HEAD(hdq_wait_queue);
 
 static int w1_id;
-module_param(w1_id, int, S_IRUSR);
+module_param(w1_id, int, 0400);
 MODULE_PARM_DESC(w1_id, "1-wire id for the slave detection in HDQ mode");
 
 struct hdq_data {
diff --git a/drivers/w1/slaves/w1_ds2406.c b/drivers/w1/slaves/w1_ds2406.c
index 3bb88b51fe2b..2f5926859b8b 100644
--- a/drivers/w1/slaves/w1_ds2406.c
+++ b/drivers/w1/slaves/w1_ds2406.c
@@ -99,7 +99,7 @@ static struct bin_attribute w1_f12_sysfs_bin_files[NB_SYSFS_BIN_FILES] = {
 	{
 		.attr = {
 			.name = "state",
-			.mode = S_IRUGO,
+			.mode = 0444,
 		},
 		.size = 1,
 		.read = w1_f12_read_state,
@@ -107,7 +107,7 @@ static struct bin_attribute w1_f12_sysfs_bin_files[NB_SYSFS_BIN_FILES] = {
 	{
 		.attr = {
 			.name = "output",
-			.mode = S_IRUGO | S_IWUSR | S_IWGRP,
+			.mode = 0664,
 		},
 		.size = 1,
 		.write = w1_f12_write_output,
diff --git a/drivers/w1/slaves/w1_ds2413.c b/drivers/w1/slaves/w1_ds2413.c
index bf4a72aae28a..739009806467 100644
--- a/drivers/w1/slaves/w1_ds2413.c
+++ b/drivers/w1/slaves/w1_ds2413.c
@@ -128,7 +128,7 @@ static ssize_t output_write(struct file *filp, struct kobject *kobj,
 	return bytes_written;
 }
 
-static BIN_ATTR(output, S_IRUGO | S_IWUSR | S_IWGRP, NULL, output_write, 1);
+static BIN_ATTR(output, 0664, NULL, output_write, 1);
 
 static struct bin_attribute *w1_f3a_bin_attrs[] = {
 	&bin_attr_state,
diff --git a/drivers/w1/slaves/w1_ds2805.c b/drivers/w1/slaves/w1_ds2805.c
index 6b5d12ba1b65..4c1a2c515317 100644
--- a/drivers/w1/slaves/w1_ds2805.c
+++ b/drivers/w1/slaves/w1_ds2805.c
@@ -264,7 +264,7 @@ static ssize_t w1_f0d_write_bin(struct file *filp, struct kobject *kobj,
 static struct bin_attribute w1_f0d_bin_attr = {
 	.attr = {
 		.name = "eeprom",
-		.mode = S_IRUGO | S_IWUSR,
+		.mode = 0644,
 	},
 	.size = W1_F0D_EEPROM_SIZE,
 	.read = w1_f0d_read_bin,
diff --git a/drivers/w1/slaves/w1_ds28e17.c b/drivers/w1/slaves/w1_ds28e17.c
index fdbaf77620ac..52261b54d842 100644
--- a/drivers/w1/slaves/w1_ds28e17.c
+++ b/drivers/w1/slaves/w1_ds28e17.c
@@ -31,12 +31,12 @@ MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_DS28E17));
 
 /* Default I2C speed to be set when a DS28E17 is detected. */
 static int i2c_speed = 100;
-module_param_named(speed, i2c_speed, int, (S_IRUSR | S_IWUSR));
+module_param_named(speed, i2c_speed, int, 0600);
 MODULE_PARM_DESC(speed, "Default I2C speed to be set when a DS28E17 is detected");
 
 /* Default I2C stretch value to be set when a DS28E17 is detected. */
 static char i2c_stretch = 1;
-module_param_named(stretch, i2c_stretch, byte, (S_IRUSR | S_IWUSR));
+module_param_named(stretch, i2c_stretch, byte, 0600);
 MODULE_PARM_DESC(stretch, "Default I2C stretch value to be set when a DS28E17 is detected");
 
 /* DS28E17 device command codes. */
-- 
2.34.1

