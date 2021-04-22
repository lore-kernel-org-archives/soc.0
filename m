Return-Path: <SRS0=ZbGo=JT=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C01CC433ED
	for <soc@archiver.kernel.org>; Thu, 22 Apr 2021 14:10:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C722C6142F; Thu, 22 Apr 2021 14:10:00 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 636F6613DC
	for <soc@kernel.org>; Thu, 22 Apr 2021 14:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 636F6613DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pj1-f52.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so1027770pja.5
        for <soc@kernel.org>; Thu, 22 Apr 2021 07:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BUQtN/I+EDS4RtvAAmZnEOQmRyFVPsDaWOFvWef9gus=;
        b=m405sN+jsIKKqYpelEt0LNiff9JTDxA9Eel+hymId7NuhOeBSniqqwsAJnLNdtlY8I
         GzwY7TnfQYG6tdhZsF9PnG/g64ql7vxy28mWXS+G0TEFfft8EbW+3Mo+oqhbodfNetqJ
         e33ijCit5j4TesiVTu/CSZxQeZPtkbDL8Sv1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BUQtN/I+EDS4RtvAAmZnEOQmRyFVPsDaWOFvWef9gus=;
        b=pBB4AZvKA7bUl0kkUtoaDAE6VSXNZDGPlPvs5c+tOjq0+5an0c4K3M80AWJcvj3WTW
         1w71PFlhTExb921Rndu4zZqdNV3Fq7AGEv9eIzbj8OB52aFk/2iqIiHt0laf0Jm+OoIY
         zyPAm6AoXTTfOkpCWmCV1IaGqkxt/0Pko5egwvYnKO2ESLcf7opE2AjuBSIcnfcAm0AV
         KzVFOB+zpkv3MC0zkCsA+c8T0Qz3CwmVkFyRymMiuuxHsifCl7cBTSaewmBvJIz+E5+Y
         HgqLN7XR68i11L2GO+toUbkO0VKzK3ZjX8pwqum3pCieg1Nb31xVntDsZ9wf66xmrVow
         edYQ==
X-Gm-Message-State: AOAM532kbQ7NLYubxcSbsrivBqC+umrLEtYJ6W1DuBwyb8E4GPvMcy2x
	+M1F2MB0rZ2PcJpTcokjAd+3nKHhyAh5fg==
X-Google-Smtp-Source: ABdhPJw3kSgPde9ZOzM0kdFE70SeNfH0jf8NhTpk/jrK2Bo1OaaYS2GMKA4tRypu1GDE76E+p/tTOg==
X-Received: by 2002:a17:90a:f309:: with SMTP id ca9mr239059pjb.200.1619100599585;
        Thu, 22 Apr 2021 07:09:59 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id p12sm5278968pjo.4.2021.04.22.07.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 07:09:59 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: olof@lixom.net,
	arnd@kernel.org,
	w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 1/2] ARM: mstar: Add header with macros for RIU register access
Date: Thu, 22 Apr 2021 23:09:44 +0900
Message-Id: <20210422140945.4131092-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210422140945.4131092-1-daniel@0x0f.com>
References: <20210422140945.4131092-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Registers connected to the CPU via "RIU" (Maybe Register Interface
Unit) are 16bits wide with a 32bit stride.

For IPs that came from 3rd parties that have natively 32bit
registers they are annoyingly mapped with the 32bit register
split into two 16bit registers.

This means that any existing driver (i.e. the usb and ethernet)
cannot be used as is and needs to use a special readl()/writel()
to fix up the address of the register that needs to be accessed,
do two readw()/writel()s and stitch the values together.

To avoid having this code in every driver add a header with an
implementation of readl()/writel() that patches over the insanity.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 MAINTAINERS             |  1 +
 include/soc/mstar/riu.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 include/soc/mstar/riu.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 19dc2eb0d93b..9600291e73a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2155,6 +2155,7 @@ F:	drivers/gpio/gpio-msc313.c
 F:	drivers/pinctrl/pinctrl-msc313.c
 F:	include/dt-bindings/clock/mstar-*
 F:	include/dt-bindings/gpio/msc313-gpio.h
+F:	include/soc/mstar/
 
 ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
 M:	Michael Petchkovsky <mkpetch@internode.on.net>
diff --git a/include/soc/mstar/riu.h b/include/soc/mstar/riu.h
new file mode 100644
index 000000000000..5aeea9c1e7eb
--- /dev/null
+++ b/include/soc/mstar/riu.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _SOC_MSTAR_RIU_H_
+#define _SOC_MSTAR_RIU_H_
+
+#include <linux/io.h>
+
+static inline u32 riu_readl(__iomem void *base, unsigned int offset)
+{
+	__iomem void *reg = base + (offset * 2);
+
+	return readw_relaxed(reg + 4) << 16 | readw_relaxed(reg);
+}
+
+static inline void riu_writel(__iomem void *base, unsigned int offset, u32 value)
+{
+	__iomem void *reg = base + (offset * 2);
+
+	/*
+	 * Do not change this order. For EMAC at least
+	 * the write order must be the lower half and then
+	 * the upper half otherwise it doesn't work.
+	 */
+	writew_relaxed(value, reg);
+	writew_relaxed(value >> 16, reg + 4);
+}
+
+#endif
-- 
2.31.0

