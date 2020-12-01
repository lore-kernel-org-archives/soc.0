Return-Path: <SRS0=dBqm=FF=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C071C64E7B
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 13:43:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0352E20770; Tue,  1 Dec 2020 13:43:56 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81849207FF
	for <soc@kernel.org>; Tue,  1 Dec 2020 13:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="t6q6uhfF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81849207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pl1-f196.google.com with SMTP id p6so1149827plr.7
        for <soc@kernel.org>; Tue, 01 Dec 2020 05:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZmXMtKJx+N4tYwcvtUovyBiKEQa6t+IIEkwiQ3K9Kyk=;
        b=t6q6uhfFqDAV+Gpt9MD0/6YR8au50Pju9fWCyH2hnyNEP9wJiJPqna+SH1c5DoAYUX
         s1a+2RKgaD8aqVVp2TFcKKf2+RYPuIlugkr+VezgnCx+YhZ1uLSoBB7vL1bU9e5NRnO2
         1EoptdP+uf1iEIO00tkEZQeXawKJ0PGcHCViQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZmXMtKJx+N4tYwcvtUovyBiKEQa6t+IIEkwiQ3K9Kyk=;
        b=GSgynnSTBrptosAMrYbhbvuam96T2mSTBgL6wfB62toV824P3alde3Mw0i7O2YLhSl
         LMR5CJLivFRMI3tZCgjkQWrj2If0ErbuYlgKoH0A6SjfEOvZMrQk5kSO0sp/5JeZKVSe
         yGTZ0iK/pAgTTDb3P+p5vEr0DP52jzLpQx4d4uOGqg3LNgiG+xkTMYiUVs22GJRwOSgB
         1RfiOD3UeXtKwJ3FDAHXmu+40iMSja4H0LNM+/Q3gra1WooanQLWu/T05JhFTnshRq3u
         JIqcMb6Fcc1LdnEe70t5P5UC9hFw+ne66e+0tQDD5zNQ6tbGJZtyTg6CI0n1Jp7/CoDd
         w4xQ==
X-Gm-Message-State: AOAM5327ulJtoDdUEgljXfj/gW5RKGYb1Mk7g9+3aG3LTWIbUTwaBjLw
	2FXsBn18rclqNdzcu+SPId4Q5w==
X-Google-Smtp-Source: ABdhPJzL6sz8FhzIj/VnR2T4URGqVwifM9uOLkrsNrYxoV7xuyu2esfcbIqT9WWHFPe7wKzSDADh3w==
X-Received: by 2002:a17:902:7b97:b029:d8:ec6e:5c28 with SMTP id w23-20020a1709027b97b02900d8ec6e5c28mr2848453pll.40.1606830234662;
        Tue, 01 Dec 2020 05:43:54 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:43:54 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	olof@lixom.net,
	arnd@arndb.de,
	robh@kernel.org,
	w@1wt.eu,
	daniel@0x0f.com
Subject: [PATCH v2 06/10] ARM: mstar: Add chip level dtsi for SSD202D
Date: Tue,  1 Dec 2020 22:43:26 +0900
Message-Id: <20201201134330.3037007-7-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a chip level dtsi for the SigmaStar SSD202D

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi b/arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi
new file mode 100644
index 000000000000..176e10a29896
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "mstar-infinity2m-ssd20xd.dtsi"
+
+/ {
+	memory {
+		device_type = "memory";
+		reg = <0x20000000 0x8000000>;
+	};
+};
-- 
2.29.2

