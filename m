Return-Path: <SRS0=AN+G=JO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1208CC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Apr 2021 01:14:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 842AB60233
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Apr 2021 01:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 842AB60233
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bRrOYcaGWOEiCp8LVewXFhkaRLnf+dGXPazSeIhZ10w=; b=Q8HWCNObdovleBRgSFNAbwA/s
	m6gvmNcAn5EmK5G3Io7eNoGK/YF3Djdp+F1m4iSHEDM5OBPE8k3wyPZIbUg9tvPhsy617nlwqu6Me
	+LiPg+l2dLp1gJxYFlWkJqnagnXxmpCFSvkMTykAf+fwOIckJ4rl5HZATXj/CnnRfBAIJZ+I0+4tV
	l26ylnnlfxjY5NrPO213v8EiSPCWV5dt7gQWSmkbNkqPQ0Rwem8kzgsUbsm8LbNZW5lZYvFxsbXRI
	Sv8E7ujJhHR8eW6WUfjqkSEgpPkOzcEslqqFiq8iiTDGfcg9Kg5qK+7Iv1vsZOhdP6TUW1hKEU493
	NAPqlhyow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXZVX-003w7o-1u; Sat, 17 Apr 2021 01:12:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZUs-003vyJ-Fm
 for linux-arm-kernel@desiato.infradead.org; Sat, 17 Apr 2021 01:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DjE5M9M5jRthI7V37X8gqi/YzZYKLarjADVCR4EpqlU=; b=ctv5j5cgovb40McaslpPsMeh2Q
 fNZ0hLy3HsyJ1onD4BhbWV9NV05NG7naDLPGXo3Y1Zhc5mwcNzxXpjcUEWJ/6rCj4SwAPDTDhNXVO
 g/1SRqSYial52+tFJ7I4XJAPg95UKOrg51kE9IJKOlADznrYbVfFBNhnQPOroXibnnOByJPzYbC1u
 T6lpORMSnyQHpKntnsiKLZIZYLnYHNmr/yf68TOv6+mgsjYu8vyCnOMGXPTJ6waMC21lKA+i2Bfzm
 tNZ5vDufINcOChnt834ctHUiRLhEEI0cAquT2uLzF4+bjXGfQt5vPLYp2l6ewD4VRwFegWtYxwEib
 BVO9sgbQ==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZUo-009p2L-0d
 for linux-arm-kernel@lists.infradead.org; Sat, 17 Apr 2021 01:11:41 +0000
Received: by mail-pf1-x42f.google.com with SMTP id o123so19439816pfb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 16 Apr 2021 18:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DjE5M9M5jRthI7V37X8gqi/YzZYKLarjADVCR4EpqlU=;
 b=rIkha+FoUYvB7CL0e1okwuoTh16BMF5NzOjcugAU5HxEkojxwQX0EYuq+NnFI9uSD5
 Fk2ta2jZp/LDO1mbohtJ6mKrSBb+P8cTDHXl5Nht2hEvgRR7/dHzZXJkVb23lpJC9ww+
 TLGMUPy1+ngmU+rJdKkX5SeP6E/7PNSHPdAeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DjE5M9M5jRthI7V37X8gqi/YzZYKLarjADVCR4EpqlU=;
 b=L8yH7NHtGIh9M9eWLg6YwjLYZTlhpqYms8lHnN/iZv+rYA6yJHMrNrJBR2EfL7u2jS
 WHcmi65YrZ8uh+Bu+W4g3//iX1VLZi4djwxeSKy2tzuyOfRUSG0X9XxBPGHBJbrtYtqZ
 F5gnmx1uOVqXWFdcGZCURwFlCZAyeK//k2HMWrqU360G9RpXObZrwdZ3yTbocjcjlIok
 IcLTMRY+/tVvfPxhhmxTKfAgt+T8G7hIBSPSqnhtoVUMRI+h1JOwb7QzawsXd2MAEeBg
 YTotegAkwAf7zkFLdWeU43kVIbNBEH2AQpxL66oZo3AKuKjS5IwUQRoBGmD81LM/24Tm
 3axA==
X-Gm-Message-State: AOAM5332Ox4NXKP680GrPVmq61IBmkBKE8p+tH81eSzBlxzFprKO4LHA
 DQ7YaTjMnwQrGmwWqaPq/blbQA==
X-Google-Smtp-Source: ABdhPJxYL4jwj2wr5/CUQx0LynwDfVQMtuuKB+roDjT7Tn79/nRKrbabWXhRKM4RNtQReyLD/qFe3A==
X-Received: by 2002:a62:cf83:0:b029:24a:935:e2f1 with SMTP id
 b125-20020a62cf830000b029024a0935e2f1mr10149297pfg.8.1618621897269; 
 Fri, 16 Apr 2021 18:11:37 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id x17sm2181515pjr.0.2021.04.16.18.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 18:11:37 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, olof@lixom.net, arnd@kernel.org
Cc: w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 3/3] ARM: dts: mstar: Add a dts for M5Stack UnitV2
Date: Sat, 17 Apr 2021 10:10:15 +0900
Message-ID: <20210417011015.2105280-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210417011015.2105280-1-daniel@0x0f.com>
References: <20210417011015.2105280-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_181138_071395_D4622DB0 
X-CRM114-Status: GOOD (  15.97  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210417011015.MjUBt7MYP5WnO8O3fl5jhaigLA6ruETjP9T31VSut4Y@z>

M5Stack are releasing a new widget based on the
SigmaStar SSD202D. We have some support for the
SSD202D so lets add a dts for it.

Link: https://m5stack-store.myshopify.com/products/unitv2-ai-camera-gc2145
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../dts/mstar-infinity2m-ssd202d-unitv2.dts   | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8e5d4ab4e75e..66ddc7d0bd03 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1397,6 +1397,7 @@ dtb-$(CONFIG_ARCH_MILBEAUT) += milbeaut-m10v-evb.dtb
 dtb-$(CONFIG_ARCH_MSTARV7) += \
 	mstar-infinity-msc313-breadbee_crust.dtb \
 	mstar-infinity2m-ssd202d-ssd201htv2.dtb \
+	mstar-infinity2m-ssd202d-unitv2.dtb \
 	mstar-infinity3-msc313e-breadbee.dtb \
 	mstar-mercury5-ssc8336n-midrived08.dtb
 dtb-$(CONFIG_ARCH_ASPEED) += \
diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
new file mode 100644
index 000000000000..a81684002e45
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+/dts-v1/;
+#include "mstar-infinity2m-ssd202d.dtsi"
+
+/ {
+	model = "UnitV2";
+	compatible = "m5stack,unitv2", "mstar,infinity2m";
+
+	aliases {
+		serial0 = &pm_uart;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&pm_uart {
+	status = "okay";
+};
-- 
2.31.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
