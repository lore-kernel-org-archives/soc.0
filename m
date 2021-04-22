Return-Path: <SRS0=vqev=JT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADC8C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Apr 2021 14:12:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A48F7613FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Apr 2021 14:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A48F7613FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JHF+iy5Hy2oNZWp0X6iVnFoQYxd7x0ArgdyCP9duSJ8=; b=rfx1E35xZLj4rsLMFWjTg1vYm
	gCgq83a7LtaxTG+wIVj9eTmMdsAkfGioogv2MduWLB8a6cR8+j2aPNzr0Rf/fZLLzJ1Yq2w4YX2eY
	K7QwSpcYm1c3Mx5zLinvF7XhuDfFbjkxe6dw71uMex1DXxgQUUaQr4YzOyk1qboEGFA65+TyPpaq8
	XYNYypxLO9lSQMCxic2szGufjVn8yeKTfYFZNuy4DSia1Umr9o5fgJijVTglnTjOo0oLJI0MTihE0
	r3w9e3vguDLxrFXswu7iez/EyjlZxHAZ84/cLZdwfyyd75y6Us+DmC409r2CuDRU0kN8jRiPmEmEe
	P67KQAfKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZa25-00Gqx9-2q; Thu, 22 Apr 2021 14:10:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZa1r-00GqwD-6G
 for linux-arm-kernel@desiato.infradead.org; Thu, 22 Apr 2021 14:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=BUQtN/I+EDS4RtvAAmZnEOQmRyFVPsDaWOFvWef9gus=; b=hBeijn5SIAqQQVjSCk9jW3swNQ
 9jHP+VdRKil3k3I7aj4DTMF7/w4GTCuE7HbiGdwqp731BY+GNAeRL66zN7MqzRv0OWfrgn8/NR1ta
 u5brJG/cDSYXFAtaZrT2P5ucO18Y+4pKQ+HY1+V88oKfKkeSSAItUljBZc6lzw4Xj9uq8JKxIhWo0
 p3iSGjaiRKJ1cv2fAHnlfAmggdF6DRWR4Bzyu0OsfwEO/261jZA1hRquMCCtiRjHCgedfq/355Er4
 wApK5rHT9ZGgLpnNtQyERqRet5UAJL9L9i+nIhiADTI9+p3qMc8SCzo6Ocy3iH2KX56+l3cQZ/9Py
 BG2F1fnQ==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZa1o-00DkHp-Lx
 for linux-arm-kernel@lists.infradead.org; Thu, 22 Apr 2021 14:10:02 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 nm3-20020a17090b19c3b029014e1bbf6c60so1027498pjb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 22 Apr 2021 07:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
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
 b=Q0tAwx4vfnlnx27yeghAc6VjEsvU+Q1vIituLEzp7Ewbp/OwF9+c9I0gC0umqtWpbL
 VzmN9weGCuWqa/fLhwCTGPg7Fz8VywpQ73a0WnGgW+B38L8hxDEOJrF6Plh+OAlpmp3h
 FrHqLTgw8lCNYnB/wqzoEy6GCUXLSpilNDqyaoIAPWX2loXkenLmWT89ykCIz+XmPwVN
 4yIliEJXFkuYQZxNQt3YwV0kEtS+jS3qU7fFtiYRnUAdrjSl81mzBWX6mYNX/uKEPdX7
 hBFDaFT46uv8LsomyXZpYzBTmTt9e+VFuWxMWV262X/yjxvm7RtH6myN1QikFqZcjk/3
 KN7g==
X-Gm-Message-State: AOAM531wg7Dm0otOS8r3u/02Y04TQwV5K+MNMFz98IEvGvCNeNVJuVJW
 +acdGlR6cMfR8vm8FtaCbxGU9Q==
X-Google-Smtp-Source: ABdhPJw3kSgPde9ZOzM0kdFE70SeNfH0jf8NhTpk/jrK2Bo1OaaYS2GMKA4tRypu1GDE76E+p/tTOg==
X-Received: by 2002:a17:90a:f309:: with SMTP id
 ca9mr239059pjb.200.1619100599585; 
 Thu, 22 Apr 2021 07:09:59 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id p12sm5278968pjo.4.2021.04.22.07.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 07:09:59 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: olof@lixom.net, arnd@kernel.org, w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 1/2] ARM: mstar: Add header with macros for RIU register
 access
Date: Thu, 22 Apr 2021 23:09:44 +0900
Message-ID: <20210422140945.4131092-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210422140945.4131092-1-daniel@0x0f.com>
References: <20210422140945.4131092-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_071000_737277_CE5E2C29 
X-CRM114-Status: GOOD (  20.64  )
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
Message-ID: <20210422140944.-7X0gnPSQ19CtuO-gXUj-drZL10dW9HDlUVMV_EoUyw@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
