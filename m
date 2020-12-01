Return-Path: <SRS0=dBqm=FF=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4583C64E7B
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 13:43:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7C795207FF; Tue,  1 Dec 2020 13:43:50 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2E1B20770
	for <soc@kernel.org>; Tue,  1 Dec 2020 13:43:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="WF6NTtrl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2E1B20770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pl1-f172.google.com with SMTP id bj5so1171067plb.4
        for <soc@kernel.org>; Tue, 01 Dec 2020 05:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hOB84R26CoZQA91b93xytogHngTBkirbQivQiUAvSZ8=;
        b=WF6NTtrljoUI8VDrrXKRQNZMUo3sZpPtwXncI77Eh5b/yLWbwXVVDd2e5GxzmBehWM
         iLJgca6ShKHyZ+hteIe0wcmc4NmhcpaYU4vdpEt3HE20RVTDJDvtId2319wiU4s7OuST
         cywS02e7AegSTmHZMU4BhxjYvObD7HE5zCKOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hOB84R26CoZQA91b93xytogHngTBkirbQivQiUAvSZ8=;
        b=ETIROSBO5w09xSH5cs6wiyHgvwKn0BWabUBZEljPHXQKr4InMgR7Qr/wibzIB90H21
         Vo2/0a+Q99oESqhJ38BkCeSlXNKywlVyx0h9MnmBsDWoe1s6+HBTBzSdFupdCQPBNPAq
         mQm3roku5IidKnK8o8+qNaQlKbBcmZerRYdDUnxzUv0moBfgItV7vzQnF93en526Swpx
         kIU2FaCYDVIANN30mu4WgssAL1YoUpw1SmH65OMBkEgOPspqSjsexz2naWUTss2wkhoH
         jrZ8SKZqaNb3OYEuekK7ZhfUqOm0Hl3im94Y5mIiI7JTd2BywZoXRAc3mO/BBuyHyrqn
         UOdw==
X-Gm-Message-State: AOAM532pCB3zvvYnOSbYUFuXMZXBWSLoZWYnemQB03kdNhTZ4PtueSAf
	fzwAvtWhnZCXX8xaqPaSHAWtWA==
X-Google-Smtp-Source: ABdhPJwc0NvZ68gepyb5EB381x8XYKBVMFc2+YBBRdd8e2c6Zew+ZunZVzKA2CFEiB5+u1J7MgYlAw==
X-Received: by 2002:a17:90b:4b11:: with SMTP id lx17mr2824634pjb.154.1606830229035;
        Tue, 01 Dec 2020 05:43:49 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:43:48 -0800 (PST)
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
Subject: [PATCH v2 04/10] ARM: mstar: Add infinity2m support
Date: Tue,  1 Dec 2020 22:43:24 +0900
Message-Id: <20201201134330.3037007-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The infinity2m series of chips are like the other Mstar/Sigmastar
chips in that they have a Cortex A7 system with DDR memory integrated
in a single package.

The infinity2m chips are intended for recording the incoming streams
from IP cameras. So instead of video encoders they have video decoders,
instead of a camera interface they have display hardware and so on.

Aside from the above points the big difference about these chips is that
they include a second Cortex A7 core.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m.dtsi | 15 +++++++++++++++
 arch/arm/boot/dts/mstar-v7.dtsi         |  2 +-
 arch/arm/mach-mstar/mstarv7.c           |  1 +
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m.dtsi

diff --git a/arch/arm/boot/dts/mstar-infinity2m.dtsi b/arch/arm/boot/dts/mstar-infinity2m.dtsi
new file mode 100644
index 000000000000..02adb9fe9d3c
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "mstar-infinity.dtsi"
+
+&cpus {
+	cpu1: cpu@1 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a7";
+		reg = <0x1>;
+	};
+};
diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 07fc46c7b4d4..2862b32c7f63 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -13,7 +13,7 @@ / {
 	#size-cells = <1>;
 	interrupt-parent = <&gic>;
 
-	cpus {
+	cpus: cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/mach-mstar/mstarv7.c b/arch/arm/mach-mstar/mstarv7.c
index 81a4cbcab206..1aa748fa006e 100644
--- a/arch/arm/mach-mstar/mstarv7.c
+++ b/arch/arm/mach-mstar/mstarv7.c
@@ -35,6 +35,7 @@ static void __iomem *l3bridge;
 
 static const char * const mstarv7_board_dt_compat[] __initconst = {
 	"mstar,infinity",
+	"mstar,infinity2m",
 	"mstar,infinity3",
 	"mstar,mercury5",
 	NULL,
-- 
2.29.2

