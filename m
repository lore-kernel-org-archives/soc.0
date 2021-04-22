Return-Path: <SRS0=ZbGo=JT=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFD1C43460
	for <soc@archiver.kernel.org>; Thu, 22 Apr 2021 14:10:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6E375613F6; Thu, 22 Apr 2021 14:10:03 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D33FE6145D
	for <soc@kernel.org>; Thu, 22 Apr 2021 14:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D33FE6145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pg1-f174.google.com with SMTP id f29so32887374pgm.8
        for <soc@kernel.org>; Thu, 22 Apr 2021 07:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XI2YCUz+44Zy3orKtb7KsqGSJx1mxyhuJPFi/bk0Zs0=;
        b=MuN9hvNrvNcaR2Q0CvGD3fjuOLDw3jSpv+b/lcondYlgWvEhQoK13ZyYYwnoNuNKhW
         CANvDi0TQlBXbQQ7fu6/gfqdiZO+AERaSLLULgxsLdTtmRoGBEg7+PypOV3c1mo0n3wI
         nr3vPRFWEyNzINgfF58HLykvl0iioGHIOlpuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XI2YCUz+44Zy3orKtb7KsqGSJx1mxyhuJPFi/bk0Zs0=;
        b=UF7CeuqZN/GmDU6er0CpK37WadrPi91G7mIRp8IvDwVP047On7F9nErhK8rDR339Ur
         +x3RzJcNUL1bE0B3+5ihKC9jYjC4clvAGIFw7LpehnvLb0QYwpUplpJ8oyjhlvLBSMQY
         NqgNj93MhdiHSMRj78ovtqrE6JgyJoFhdC33Bho7FuUlbqnjuzK20o/NmjDhspHdlppP
         n7Q4CPkEx0CLlQbSVIIdFdFeJ1SKVXfwVCCz3H9Sod7BvMrH4pcV7r3bT5q9pM+2FROj
         QbadOLhgqH8aZnKwC7/KaPzqssmNoKVINimBcimMd0r0uQ9akODUKUA3pNh8a+qYkz78
         CiBg==
X-Gm-Message-State: AOAM532mJ1CyObUe3pu4UO0sfWmGYMJW6MKvQt0DtWDpwKf2FfWNw9h2
	6Ws5dY4mWGurBP7RKY6B90NvZWfS2AjSBA==
X-Google-Smtp-Source: ABdhPJxbqXR3mq6opveJ55gQ9DzentSPq3ekpWCG3BOngL0oH1sTNoSfTn7mZGttpyiuDUHFb0Ds2Q==
X-Received: by 2002:a62:7d46:0:b029:247:baa2:d95c with SMTP id y67-20020a627d460000b0290247baa2d95cmr3635339pfc.15.1619100602037;
        Thu, 22 Apr 2021 07:10:02 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id p12sm5278968pjo.4.2021.04.22.07.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 07:10:01 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: olof@lixom.net,
	arnd@kernel.org,
	w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 2/2] ARM: mstar: Add header with macros for XIU register access
Date: Thu, 22 Apr 2021 23:09:45 +0900
Message-Id: <20210422140945.4131092-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210422140945.4131092-1-daniel@0x0f.com>
References: <20210422140945.4131092-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Registers connected to the CPU via "XIU" (Maybe eXtended Interface
Unit) are 32bits wide with a 64bit stride.

Apparently someone realised that splitting 32bit registers into
two 16bit ones was silly but at the same time didn't want to
fix all of the register offsets used for "RIU" in their code.

This means that any existing driver (i.e. the usb and ethernet)
cannot be used as is and needs to use a special readl()/writel()
to fix up the address of the register that needs to be accessed.

To avoid having this code in every driver add a header with an
implementation of readl()/writel() that patches over the insanity.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 include/soc/mstar/xiu.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 include/soc/mstar/xiu.h

diff --git a/include/soc/mstar/xiu.h b/include/soc/mstar/xiu.h
new file mode 100644
index 000000000000..d658338b8006
--- /dev/null
+++ b/include/soc/mstar/xiu.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _SOC_MSTAR_XIU_H_
+#define _SOC_MSTAR_XIU_H_
+
+#include <linux/io.h>
+
+static inline u32 xiu_readl(__iomem void *base, unsigned int offset)
+{
+	__iomem void *reg = base + (offset * 2);
+
+	return readl_relaxed(reg);
+}
+
+static inline void xiu_writel(__iomem void *base, unsigned int offset, u32 value)
+{
+	__iomem void *reg = base + (offset * 2);
+
+	writel_relaxed(value, reg);
+}
+
+#endif
-- 
2.31.0

