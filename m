Return-Path: <SRS0=7X9i=55=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A4AC38142
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 05:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0747DC4339C; Wed,  1 Feb 2023 05:17:30 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AE91C433EF
	for <soc@kernel.org>; Wed,  1 Feb 2023 05:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6AE91C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so866650pjb.1
        for <soc@kernel.org>; Tue, 31 Jan 2023 21:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TiMf0OJqBSa7ctCNlzH1FXYJRohEDjy9yGiuOzM/lnI=;
        b=SoUk2Crq0Y6CaouPRbO1tFxWvzkuA3+X62KRjGIi/wZWgGJy1UOryjG51GfdurCx7C
         ZjQxAgY6Qz/aBkQkR8BMuSxuV9giDMUIf9RhyUrKt6k4Iyce6ipjNSKJIaYX7ZNZwA7e
         8Yv/uvliSj8/JPg4HfIxOiCM/ErOV+3NIU1PUtNmH1wXLiTR3zvr/NGYYv9CbguAWfCV
         siyLOBxJiils5nYKMadUaYoxWxLe8WhZeTGIw/CbATj6XCFF2hweXtKUtkboiljx9EZS
         L44LRjp2yR5q9UWPNdxwWFJR8VhCepLaOQ0G4RxROuZ8z5A8tT5GcMHVbEEsWKBAlxAZ
         WcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiMf0OJqBSa7ctCNlzH1FXYJRohEDjy9yGiuOzM/lnI=;
        b=0tsH6zMhinAlzTQjOZjPm8uFVX1NFHdtyHfQYOkxS+UUQBU+PE5MWgZdbemTpMFVtq
         5m1SA4L1dUiezPJol46ayXuSiMQQidVQexUtTMoUEwI5o6+xXUl9Opwfy0Y6PdH2nrF1
         uRy5oa+DRopFmoZeV4exwb3MVn0i7aYEIT0O5hfDMThd9lJ6gRF7kEs4cDkH/+fnIdyl
         SiAhbVnNV4c5PoxgvStnYp5O9EaS6I3pYYsEJoB2CH2jgAhGJHnYgLDfNPZc+rRG4+zE
         EVpNLZw9WDF3Gqi5TNx1Mqfb9iaLvuVaHnpCHCrPLasoWPAlKlJh/BpBfSb68O2LhPkv
         u5nQ==
X-Gm-Message-State: AO0yUKWDLtxxQvvm2jBDKH/YRFxNvGkYYmdSn6IzWrgTCct2FQGAl+TU
	22jIoT9tCpa58dmzu2DF7BCI/A1dxx8=
X-Google-Smtp-Source: AK7set9ZVqYGSrw2SQDIGz7C7IgkXMmq+ONyj3eK/r6keXWlo8f/8J4tbKG04/Ge2aGwVSrAIGPiTg==
X-Received: by 2002:a17:902:da92:b0:196:5839:b36a with SMTP id j18-20020a170902da9200b001965839b36amr1951115plx.8.1675228647134;
        Tue, 31 Jan 2023 21:17:27 -0800 (PST)
Received: from voyager.ibm.com ([125.63.148.35])
        by smtp.gmail.com with ESMTPSA id iw6-20020a170903044600b00189f2fdbdd0sm10712798plb.234.2023.01.31.21.17.25
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 21:17:26 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] soc: nuvoton: Add SoC info driver for WPCM450
Date: Wed,  1 Feb 2023 15:47:17 +1030
Message-Id: <20230201051717.1005938-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Add a SoC information driver for Nuvoton WPCM450 SoCs. It provides
information such as the SoC revision.

Usage example:

  # grep . /sys/devices/soc0/*
  /sys/devices/soc0/family:Nuvoton NPCM
  /sys/devices/soc0/revision:A3
  /sys/devices/soc0/soc_id:WPCM450

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Link: https://lore.kernel.org/r/20221031223926.241641-1-j.neuschaefer@gmx.net
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Soc maintainers, this has been in -next since the last merge window. I
think any changes can be done as follow up patches by Jonathan.

Please apply for v6.3.

 drivers/soc/nuvoton/wpcm450-soc.c | 109 ++++++++++++++++++++++++++++++
 drivers/soc/Kconfig               |   1 +
 drivers/soc/Makefile              |   1 +
 drivers/soc/nuvoton/Kconfig       |  11 +++
 drivers/soc/nuvoton/Makefile      |   2 +
 5 files changed, 124 insertions(+)
 create mode 100644 drivers/soc/nuvoton/wpcm450-soc.c
 create mode 100644 drivers/soc/nuvoton/Kconfig
 create mode 100644 drivers/soc/nuvoton/Makefile

diff --git a/drivers/soc/nuvoton/wpcm450-soc.c b/drivers/soc/nuvoton/wpcm450-soc.c
new file mode 100644
index 000000000000..c5e0d11c383b
--- /dev/null
+++ b/drivers/soc/nuvoton/wpcm450-soc.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton WPCM450 SoC Identification
+ *
+ * Copyright (C) 2022 Jonathan Neuschäfer
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
+
+#define GCR_PDID	0
+#define PDID_CHIP(x)	((x) & 0x00ffffff)
+#define CHIP_WPCM450	0x926450
+#define PDID_REV(x)	((x) >> 24)
+
+struct revision {
+	u8 number;
+	const char *name;
+};
+
+static const struct revision revisions[] __initconst = {
+	{ 0x00, "Z1" },
+	{ 0x03, "Z2" },
+	{ 0x04, "Z21" },
+	{ 0x08, "A1" },
+	{ 0x09, "A2" },
+	{ 0x0a, "A3" },
+	{}
+};
+
+static const char * __init get_revision(unsigned int rev)
+{
+	int i;
+
+	for (i = 0; revisions[i].name; i++)
+		if (revisions[i].number == rev)
+			return revisions[i].name;
+	return NULL;
+}
+
+static struct soc_device_attribute *wpcm450_attr;
+static struct soc_device *wpcm450_soc;
+
+static int __init wpcm450_soc_init(void)
+{
+	struct soc_device_attribute *attr;
+	struct soc_device *soc;
+	const char *revision;
+	struct regmap *gcr;
+	u32 pdid;
+	int ret;
+
+	if (!of_machine_is_compatible("nuvoton,wpcm450"))
+		return 0;
+
+	gcr = syscon_regmap_lookup_by_compatible("nuvoton,wpcm450-gcr");
+	if (IS_ERR(gcr))
+		return PTR_ERR(gcr);
+	ret = regmap_read(gcr, GCR_PDID, &pdid);
+	if (ret)
+		return ret;
+
+	if (PDID_CHIP(pdid) != CHIP_WPCM450) {
+		pr_warn("Unknown chip ID in GCR.PDID: 0x%06x\n", PDID_CHIP(pdid));
+		return -ENODEV;
+	}
+
+	revision = get_revision(PDID_REV(pdid));
+	if (!revision) {
+		pr_warn("Unknown chip revision in GCR.PDID: 0x%02x\n", PDID_REV(pdid));
+		return -ENODEV;
+	}
+
+	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
+	if (!attr)
+		return -ENOMEM;
+
+	attr->family = "Nuvoton NPCM";
+	attr->soc_id = "WPCM450";
+	attr->revision = revision;
+	soc = soc_device_register(attr);
+	if (IS_ERR(soc)) {
+		kfree(attr);
+		pr_warn("Could not register SoC device\n");
+		return PTR_ERR(soc);
+	}
+
+	wpcm450_soc = soc;
+	wpcm450_attr = attr;
+	return 0;
+}
+module_init(wpcm450_soc_init);
+
+static void __exit wpcm450_soc_exit(void)
+{
+	if (wpcm450_soc) {
+		soc_device_unregister(wpcm450_soc);
+		wpcm450_soc = NULL;
+		kfree(wpcm450_attr);
+	}
+}
+module_exit(wpcm450_soc_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jonathan Neuschäfer");
+MODULE_DESCRIPTION("Nuvoton WPCM450 SoC Identification driver");
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 5dbb09f843f7..cd8dba0d316a 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -16,6 +16,7 @@ source "drivers/soc/litex/Kconfig"
 source "drivers/soc/loongson/Kconfig"
 source "drivers/soc/mediatek/Kconfig"
 source "drivers/soc/microchip/Kconfig"
+source "drivers/soc/nuvoton/Kconfig"
 source "drivers/soc/pxa/Kconfig"
 source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index fff513bd522d..a4582afa0c8f 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_LITEX_SOC_CONTROLLER) += litex/
 obj-y				+= loongson/
 obj-y				+= mediatek/
 obj-y				+= microchip/
+obj-y				+= nuvoton/
 obj-y				+= pxa/
 obj-y				+= amlogic/
 obj-y				+= qcom/
diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
new file mode 100644
index 000000000000..df46182088ec
--- /dev/null
+++ b/drivers/soc/nuvoton/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+menuconfig WPCM450_SOC
+	tristate "Nuvoton WPCM450 SoC driver"
+	default y if ARCH_WPCM450
+	select SOC_BUS
+	help
+	  Say Y here to compile the SoC information driver for Nuvoton
+	  WPCM450 SoCs.
+
+	  This driver provides information such as the SoC model and
+	  revision.
diff --git a/drivers/soc/nuvoton/Makefile b/drivers/soc/nuvoton/Makefile
new file mode 100644
index 000000000000..e30317b4e829
--- /dev/null
+++ b/drivers/soc/nuvoton/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_WPCM450_SOC)	+= wpcm450-soc.o
-- 
2.39.1

