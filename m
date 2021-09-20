Return-Path: <SRS0=hDLm=OK=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDA2C4332F
	for <soc@archiver.kernel.org>; Mon, 20 Sep 2021 12:42:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C87FC61019; Mon, 20 Sep 2021 12:42:12 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABEF660FA0
	for <soc@kernel.org>; Mon, 20 Sep 2021 12:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABEF660FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f54.google.com with SMTP id b20so8605921lfv.3
        for <soc@kernel.org>; Mon, 20 Sep 2021 05:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aD0ZimcpDdMwxxDkok8INnwAF4L8JkxKG7hlNjJNuc4=;
        b=ROkKUP5Wti0ZceJVkqlAW1hw9pw2rtGO+UYdzPbSZg0ZsAEcFmWUy5DNCnc2MIrx4b
         BYp0RUGvkHwf934xqPgpQ6UUwcdgw6xDoe22pz4EAJzNIkulRo31v++TUs9ymGhu5K5u
         tFmeYg86tBZ7B0TP8fKKkgwBNWF29JNbAnbvAilubZMvvjqh33+omk3tgv1z+6L1bSvw
         FCli+M02Sz/IhIHZXabClzluGQtQlRj9xfOIJWpPK6WGTy5EPC3C9NjyvqDaeSeKSJCU
         Vakycw1Ed8PiorDWqI1+IUXUUnKX7kJZHW55ViIYHRIy6ZFT8OOia60WSN3/sQxWirf6
         jpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aD0ZimcpDdMwxxDkok8INnwAF4L8JkxKG7hlNjJNuc4=;
        b=JDrK+qJmtBG8diQqSgeSTGm/poUkSm/03gNW5wRe9YmYAQeducP1x0SdWvIyRhA9UY
         4i8OsGXuWObharxvbERdFKpkqcYZE+WK/HPKIF96r29El5rt1/ypPsLZJqggZ9JwbLD2
         f4yPkVjrpeBVV+XdpR/AEHKNIsq5TwRU9sGjUnzQCGGCHbGV0wvCBmqlhmGH6l0EiASi
         Xrmxs2g5CkZDYyK4vhsEc+hCrDyPrCnIvvEWIDngfWnVg7nMCGQw9vP2fsUMRj9mQbMw
         cLoyQybWPfGyGrcS/s45DeapC3Z1ZEcgGXPMOxAgUzsojGzxjGXzRAZUKTdYRDT6NdoR
         jmaw==
X-Gm-Message-State: AOAM5332pHu/BHauuF/cmHKwOCcmJRiGkVXEzZuANGXNH2npK2B/iAUI
	hyr8euOVoU5yEX3XQHe96RQX2Q==
X-Google-Smtp-Source: ABdhPJzdjJvEESBsRijWxynJclTM1jLd3jz584eIX1nzT8MgbP4/OcLKY9ulXqJbDoTj+2jHr5+kVA==
X-Received: by 2002:a2e:9a07:: with SMTP id o7mr6991825lji.125.1632141730817;
        Mon, 20 Sep 2021 05:42:10 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id v1sm630944lfo.308.2021.09.20.05.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:42:10 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	dinguyen@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tn@semihalf.com,
	ka@semihalf.com,
	jam@semihalf.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH 3/3] reset: socfpga: add empty driver allowing consumers to probe
Date: Mon, 20 Sep 2021 14:41:41 +0200
Message-Id: <20210920124141.1166544-4-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920124141.1166544-1-pan@semihalf.com>
References: <20210920124141.1166544-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The early reset driver doesn't ever probe, which causes consuming
devices to be unable to probe. Add an empty driver to set this device
as available, allowing consumers to probe.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 drivers/reset/reset-socfpga.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/reset/reset-socfpga.c b/drivers/reset/reset-socfpga.c
index 2a72f861f798..8c6492e5693c 100644
--- a/drivers/reset/reset-socfpga.c
+++ b/drivers/reset/reset-socfpga.c
@@ -92,3 +92,29 @@ void __init socfpga_reset_init(void)
 	for_each_matching_node(np, socfpga_early_reset_dt_ids)
 		a10_reset_init(np);
 }
+
+/*
+ * The early driver is problematic, because it doesn't register
+ * itself as a driver. This causes certain device links to prevent
+ * consumer devices from probing. The hacky solution is to register
+ * an empty driver, whose only job is to attach itself to the reset
+ * manager and call probe.
+ */
+static const struct of_device_id socfpga_reset_dt_ids[] = {
+	{ .compatible = "altr,rst-mgr", },
+	{ /* sentinel */ },
+};
+
+static int reset_simple_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver reset_socfpga_driver = {
+	.probe	= reset_simple_probe,
+	.driver = {
+		.name		= "socfpga-reset",
+		.of_match_table	= socfpga_reset_dt_ids,
+	},
+};
+builtin_platform_driver(reset_socfpga_driver);
-- 
2.25.1

