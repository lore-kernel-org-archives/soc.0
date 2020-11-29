Return-Path: <SRS0=LVh9=FD=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2B3C5519F
	for <soc@archiver.kernel.org>; Sun, 29 Nov 2020 11:08:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2BE7D20809; Sun, 29 Nov 2020 11:08:28 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2DBC207BC
	for <soc@kernel.org>; Sun, 29 Nov 2020 11:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="ffUK02op"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2DBC207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pl1-f193.google.com with SMTP id l11so4903777plt.1
        for <soc@kernel.org>; Sun, 29 Nov 2020 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sSxJk69Cd2LemrQN9ehPZlO0F43/6TrspTvKZvZYbs0=;
        b=ffUK02opWwOFvHW21tRs0l4+Mo38eIrN56iqqYVXgFwGevSQSh8qK2fv8dEfQTxpvJ
         mpiJo9gnnIfv/ntuqs6s0NG0qUrvjYXlDFghdoqhaG3hqTkM8uFe2cLgJnABDDQbqk+b
         JqmG4htvg0K3vSGvdkAruDhmMg4CU4VXpXRUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sSxJk69Cd2LemrQN9ehPZlO0F43/6TrspTvKZvZYbs0=;
        b=juz4mhSrFepB0y7v4kStv3CePvMBxltQ2kXaZSW67+ujLixIqK2PGJkTU96QdtGCDs
         DOYFibNWL1C67F42fI1n+XvO01u8Gaq8PvLrDHWt+eZlcCdw+QIHzhU1RPXhhyF/JqE+
         I2qRaIxUR+bdJpW9bCHCn+UFRxt2Vi5HB1FCRkhgaYPpiGYenlKXV1NK/wD9GWQ8WGgX
         uNPSywATILvXZ2P5OLoZfr0mnL+ZUhcRC75PuIMyK7NF8u9Fj1rxBh6uuiEWTo1P9QzY
         EETyDmSPdcvFLg6+rsTG6X5Rjd1QCgj2/pEkKR6g8782PNb94YHFZYgAttUJPUYPsyCb
         V/2Q==
X-Gm-Message-State: AOAM530JIk96zWjdXWNXflcKOLF39ZNHz55BN5tBOAGNBAEkVYGC2IOr
	KdA3YAGKSwwx3FL8csM6vu+VXlMbaOVJdw==
X-Google-Smtp-Source: ABdhPJzib+nYFpwBxldfEI+z6vafVcrbaAPzvzvDZh07vXmrjbJ1TdqRII3WABzDnjub/RJWE7p+rA==
X-Received: by 2002:a17:902:8691:b029:d7:e0f9:b1b with SMTP id g17-20020a1709028691b02900d7e0f90b1bmr14505268plo.37.1606648107325;
        Sun, 29 Nov 2020 03:08:27 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id 21sm13095653pfw.105.2020.11.29.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 03:08:26 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org,
	robh@kernel.org,
	w@1wt.eu,
	daniel@0x0f.com
Subject: [PATCH v4 5/5] ARM: mstar: Fill in GPIO controller properties for infinity
Date: Sun, 29 Nov 2020 20:08:02 +0900
Message-Id: <20201129110803.2461700-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
References: <20201129110803.2461700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fill in the properties needed to use the GPIO controller
in the infinity and infinity3 chips.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/mstar-infinity.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity.dtsi b/arch/arm/boot/dts/mstar-infinity.dtsi
index cd911adef014..0bee517797f4 100644
--- a/arch/arm/boot/dts/mstar-infinity.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity.dtsi
@@ -6,6 +6,13 @@
 
 #include "mstar-v7.dtsi"
 
+#include <dt-bindings/gpio/msc313-gpio.h>
+
 &imi {
 	reg = <0xa0000000 0x16000>;
 };
+
+&gpio {
+	compatible = "mstar,msc313-gpio";
+	status = "okay";
+};
-- 
2.29.2

