Return-Path: <SRS0=dBqm=FF=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516DDC64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 13:43:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 13C1A2080A; Tue,  1 Dec 2020 13:43:53 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8192F20770
	for <soc@kernel.org>; Tue,  1 Dec 2020 13:43:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Mg4In0e7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8192F20770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pl1-f193.google.com with SMTP id s2so1145002plr.9
        for <soc@kernel.org>; Tue, 01 Dec 2020 05:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6DwCQ27nNXwfD9t5ZQW62DZJZaYrd0rxE1o52EO0bsI=;
        b=Mg4In0e76C/nyOIQGBgSdZl64D3A5Tu74H2xv0kJ901QHWVsL5TL8tVTtZg/sH4otm
         h08twifw/lCN9tVt0w9xD2MFXAh+K1zUtSH8GfB1vti2Dx9NcjBDFZSKfHYscKwxCRye
         JrTYcYc5xcZ1au/5IwyjW9PTMsc+zVXnNnUwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6DwCQ27nNXwfD9t5ZQW62DZJZaYrd0rxE1o52EO0bsI=;
        b=PvDCycHfqF1h1DBciTl43LGrXnTsTHifFOtdiAyXBDNCku+284DYWOLoGGWHuZOBdA
         TLJQ/z3Rn2duTNVt77MhdZjl+ffqp2mU1/gqXlI8IHKl0KWp1Ig3kQGFUhX3TZ9FYLMo
         Nl1QzuWdKTtpGuZa9xEvmeV/YCUQthLokzPVFV2JqpYX83K38G3CUbGW5FKTCb8FEX4W
         NR45tNrHcsH5gmh9Bw46s4yYXltwpPRb1yu2EMac30UJr/p59d7hQz3u1ovzJr9AiDMH
         W7zu8Gcj7bT5prV53IVIFdPMIXdLSpK/MbjSBss1OxC9EX4d5EuTkxRVBxPUO00ZiX9e
         aHAg==
X-Gm-Message-State: AOAM5300OTEiX8HgO4ltnqw2LZNb+yWaZqaJoKCx2xFhlzA7lWsDxQDQ
	iNj59gRYAtw0Z411VK4aWsG8DRHOa+pSrw==
X-Google-Smtp-Source: ABdhPJxpaiILhXu389YSGSADviATIWQrbxVZK/JiCYSOrTtXFyfERdUSo5vjfna+xlbCHCirxfOyNw==
X-Received: by 2002:a17:90a:ee8c:: with SMTP id i12mr2774956pjz.33.1606830231857;
        Tue, 01 Dec 2020 05:43:51 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:43:51 -0800 (PST)
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
Subject: [PATCH v2 05/10] ARM: mstar: Add common dtsi for SSD201/SSD202D
Date: Tue,  1 Dec 2020 22:43:25 +0900
Message-Id: <20201201134330.3037007-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SSD201 and SSD202D are basically the same chip with a different DDR die
packaged (64MB DDR2 or 128MB DDR3).

This patch adds a shared dtsi for the common parts of these chips like
gpio, pinctrl etc.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi b/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
new file mode 100644
index 000000000000..0811220f0a79
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "mstar-infinity2m.dtsi"
-- 
2.29.2

