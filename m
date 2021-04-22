Return-Path: <SRS0=vqev=JT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24C5C43461
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Apr 2021 14:12:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01C4461404
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Apr 2021 14:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01C4461404
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iLanFnZiGSrfmhtnUr0b7lfm2ROx8i1rDTBh2Gboa/o=; b=msG69H7iZv0sUKSM69/US0GA4
	8vSIDzsh5s61Rrtw9NRhnc1JD29W4Rk+0n0xUcDcL+tA9l+82J2jhFTjXu3Qb2XXYesDOe/+hpWYK
	uaNBSeaVynmKMjxbEz+dWfG0APaXNwVFk7mX/g6vIC4Zxzbw7vu1rE0JlAOf8gguP3DlBJP6qf2Zh
	Ib6jWz7vcw8ZJsVKVNomG+ZfrJwcsKIHKb5h5SljypyCUkRj7zmsOtcD3C028zzkxNX3eLS38SZ47
	p5sGrowURLfW0a/dViX93URXK30NcPtu7h9Nx3DdjwdDwzvpawfJGhVsOTqyqOxKe//zD4QJ+FwTn
	4Caq+QRlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZa2H-00GqyP-PM; Thu, 22 Apr 2021 14:10:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZa1u-00GqwZ-Gm
 for linux-arm-kernel@desiato.infradead.org; Thu, 22 Apr 2021 14:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XI2YCUz+44Zy3orKtb7KsqGSJx1mxyhuJPFi/bk0Zs0=; b=dcxqnQDFaAmOlMT0D7ObWsO9ST
 r35TtMm/UYQBGxkgzT2ZOQNr12u+5r4YGYrU+8vptmU6xF4Yetr2BXYzubb1TZX9s0pL13a2u2dWz
 iY4ibyJziuO5Y6hA1Sp4019OoAm7Vp0nwujbBJ+gk1QL5t7agdjV8P0pW4ESGUj3DnZwQ6kheW2Rr
 vBaEkm9ZCcZOzA2qcF/DZb1VFY2rIcVGnWGtOnGhGO3wRcGCZ3SAGPVU/xrCvFZVBE33JJEgO3wWH
 xxz7JhwundSwBJ+lOAz2YZ3VpoTTuZtod/mZCIIGgisRjvUjCWa757zjinTP6rGgbaqQ2nS+ZR4Iq
 3G/6eTLw==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZa1s-00DkIR-2L
 for linux-arm-kernel@lists.infradead.org; Thu, 22 Apr 2021 14:10:05 +0000
Received: by mail-pf1-x429.google.com with SMTP id p67so26824685pfp.10
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 22 Apr 2021 07:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
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
 b=e09EhHMTX3zyB+UOeoWIK17a3NiHj5sI3r0egjemhPnfzlSBJVaiaGeAQANBjAOoWd
 lRmvuYOS11R7AqTFlvJmcDoRAVTXnDMy25BZEuWtlJIMpmYd8LJe9J3Q/NXGwYgOF6Pe
 bgPTJWqHhxBKo8sWSVNV+90hCn1ayR9JqMvQiYqMH1R2xNNHJZtLeOhjSEMVY0DFFmsi
 w2HbhYrwqeajyGry5D4a0ec7zbnVee/e2ta+HCgF6jicaKtKU/Y+NXCEuN3MM+OJoDpa
 o4hOxJq9Ihbi8bLejJ5N4LR9uJm304Mk97CW0IYvgipnpkznYR0JMVqkrd06G6tlES9N
 +z6g==
X-Gm-Message-State: AOAM53031Uu6REFlLMrpat+zyW6tpMbAlLe1bOiEt4NE8TFZZyHleNc2
 SpJKrA6yPa/NiBDnT6xVO0Gxdg==
X-Google-Smtp-Source: ABdhPJxbqXR3mq6opveJ55gQ9DzentSPq3ekpWCG3BOngL0oH1sTNoSfTn7mZGttpyiuDUHFb0Ds2Q==
X-Received: by 2002:a62:7d46:0:b029:247:baa2:d95c with SMTP id
 y67-20020a627d460000b0290247baa2d95cmr3635339pfc.15.1619100602037; 
 Thu, 22 Apr 2021 07:10:02 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id p12sm5278968pjo.4.2021.04.22.07.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 07:10:01 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: olof@lixom.net, arnd@kernel.org, w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 2/2] ARM: mstar: Add header with macros for XIU register
 access
Date: Thu, 22 Apr 2021 23:09:45 +0900
Message-ID: <20210422140945.4131092-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210422140945.4131092-1-daniel@0x0f.com>
References: <20210422140945.4131092-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_071004_129494_B7C736B9 
X-CRM114-Status: GOOD (  18.05  )
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
Message-ID: <20210422140945.g6IjLNO5AacuZfhZCsj8kKOeiamdrUTBPwtZzkHVaSo@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
