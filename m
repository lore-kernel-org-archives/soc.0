Return-Path: <SRS0=TN87=FD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948EBC64E7D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Nov 2020 11:09:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44DB320771
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Nov 2020 11:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jVVXzNVn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="DL4wQJzu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44DB320771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=34yRFpHFCT9DIOA9YvgqsMKDscbAoWiT8Y43M64Pmps=; b=jVVXzNVnimSwCbITr6NnVU0bA
	2W6hLYdzrtXrDBEx16JPMrH/Sq6LBqGPF29CeEjlEUBR/lJ4CIjWzD8rYslnh+yvCMyW00TxzoePW
	xBoCY00GAaY3M7U4RtsXiXHeBpXmg1+DP5XHV7PJZN2579Ma/XYPCMP69uKv+pIYHeUezH7+vS3qz
	mxF1Bo+L8aL3uu2fDDk9fnsbWIiJR+y3k41P31VvBUpSfR4hd3uvFNRqUPKJnDN1QmGl0DP0lmPt8
	liydpHd2GfWqgVESg6VYDtp/jN4OmYyOpC5yHYhB/QNa1/RHz5+VgKpVnUfOB+15FNxWcO+OpdgQt
	+TZRDP0Ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjKZ7-0006E1-K3; Sun, 29 Nov 2020 11:08:25 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjKZ1-0006CI-NS
 for linux-arm-kernel@lists.infradead.org; Sun, 29 Nov 2020 11:08:20 +0000
Received: by mail-pf1-x442.google.com with SMTP id t8so8388507pfg.8
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 29 Nov 2020 03:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=16VMX6uM7lI5S9V41IUHUt9op6rpkiAjlSaJJsAQ7s8=;
 b=DL4wQJzuGSyc/hlkegBa0pq5K3TU3n2zBMmkXqZ4wM2M99zRp6wSLEP0Poj+cYTgot
 VyPe49qecPtFyiHYDktXNKKkR7I42NfSz276Ns2XVBVZLdaUT+08FpqeX8IXfvNhswNk
 feV5UVSTXChJvtPACKOseztZ8P6hOWLwkHkFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=16VMX6uM7lI5S9V41IUHUt9op6rpkiAjlSaJJsAQ7s8=;
 b=Vyf57e/i6Of+mS0AZTKpQu8yCI4GDG/Wu0PdzBNZW7MlH8tbjuiFL5FUZ6/r5INcKX
 MdRbCGvNLHL+XcN2EuM44mlaaQ9d7oVZtvH8YMTPNjPNSHfhGo+ITjlcV5nQUAxZ5gOh
 DHSowDmo8GpX+udQKfm0kdJmqYb2w3f03LzHKQkRxKtRXigXTCFN0P1yQPNdEjObUfiL
 nVWT1+sUMjWFkEcbx2KuXVxYfOmHaVg/OpbRPDDpSRFHmcVukprHE9j2KWVDAujpUJPA
 qNszip9q2F++VdvE9oMt/woX3xZUf7fGpcpYsOOSV++jb+xfqYOfog4logzqRGvnpClX
 WdRw==
X-Gm-Message-State: AOAM530EAwUwZX+scsIKfzCBlCbsFS917KI0w3QpTjjQUnYNeoOKPWsw
 Y8zJaDX7nnrsQRGRyFK3boGLksv+3LsYJA==
X-Google-Smtp-Source: ABdhPJyfynF8n9FCKgQOL73Kj9LIi27mnjeS+Z6lGrlpwqVSgrOxcVS6Gp1+3xzUFXP83s4amDBZJA==
X-Received: by 2002:a62:7e4f:0:b029:18c:9322:739b with SMTP id
 z76-20020a627e4f0000b029018c9322739bmr14216395pfc.7.1606648096288; 
 Sun, 29 Nov 2020 03:08:16 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id 21sm13095653pfw.105.2020.11.29.03.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 03:08:15 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 1/5] dt-bindings: gpio: Add a binding header for the MSC313
 GPIO driver
Date: Sun, 29 Nov 2020 20:07:58 +0900
Message-ID: <20201129110803.2461700-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
References: <20201129110803.2461700-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_060819_859444_494AB501 
X-CRM114-Status: GOOD (  18.65  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linus.walleij@linaro.org,
 daniel@0x0f.com, linux-kernel@vger.kernel.org, w@1wt.eu,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201129110758.Q37zEWi5zJYipTXa6-LSocw2HBmYASUt10HALQ0_ies@z>

Header adds defines for the gpio number of each pad from the driver view.

The gpio block seems to have enough registers for 128 lines but what line
is mapped to a physical pin depends on the chip. The gpio block also seems
to contain some registers that are not related to gpio but needed somewhere
to go.

Because of the above the driver itself uses the index of a pin's offset in
an array of the possible offsets for a chip as the gpio number.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 MAINTAINERS                            |  1 +
 include/dt-bindings/gpio/msc313-gpio.h | 53 ++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 include/dt-bindings/gpio/msc313-gpio.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2daa6ee673f7..9e7d12b2d403 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2135,6 +2135,7 @@ W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar/*
 F:	arch/arm/boot/dts/mstar-*
 F:	arch/arm/mach-mstar/
+F:	include/dt-bindings/gpio/msc313-gpio.h
 
 ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
 M:	Michael Petchkovsky <mkpetch@internode.on.net>
diff --git a/include/dt-bindings/gpio/msc313-gpio.h b/include/dt-bindings/gpio/msc313-gpio.h
new file mode 100644
index 000000000000..2dd56683d3c1
--- /dev/null
+++ b/include/dt-bindings/gpio/msc313-gpio.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * GPIO definitions for MStar/SigmaStar MSC313 and later SoCs
+ *
+ * Copyright (C) 2020 Daniel Palmer <daniel@thingy.jp>
+ */
+
+#ifndef _DT_BINDINGS_MSC313_GPIO_H
+#define _DT_BINDINGS_MSC313_GPIO_H
+
+#define MSC313_GPIO_FUART	0
+#define MSC313_GPIO_FUART_RX	(MSC313_GPIO_FUART + 0)
+#define MSC313_GPIO_FUART_TX	(MSC313_GPIO_FUART + 1)
+#define MSC313_GPIO_FUART_CTS	(MSC313_GPIO_FUART + 2)
+#define MSC313_GPIO_FUART_RTS	(MSC313_GPIO_FUART + 3)
+
+#define MSC313_GPIO_SR		(MSC313_GPIO_FUART_RTS + 1)
+#define MSC313_GPIO_SR_IO2	(MSC313_GPIO_SR + 0)
+#define MSC313_GPIO_SR_IO3	(MSC313_GPIO_SR + 1)
+#define MSC313_GPIO_SR_IO4	(MSC313_GPIO_SR + 2)
+#define MSC313_GPIO_SR_IO5	(MSC313_GPIO_SR + 3)
+#define MSC313_GPIO_SR_IO6	(MSC313_GPIO_SR + 4)
+#define MSC313_GPIO_SR_IO7	(MSC313_GPIO_SR + 5)
+#define MSC313_GPIO_SR_IO8	(MSC313_GPIO_SR + 6)
+#define MSC313_GPIO_SR_IO9	(MSC313_GPIO_SR + 7)
+#define MSC313_GPIO_SR_IO10	(MSC313_GPIO_SR + 8)
+#define MSC313_GPIO_SR_IO11	(MSC313_GPIO_SR + 9)
+#define MSC313_GPIO_SR_IO12	(MSC313_GPIO_SR + 10)
+#define MSC313_GPIO_SR_IO13	(MSC313_GPIO_SR + 11)
+#define MSC313_GPIO_SR_IO14	(MSC313_GPIO_SR + 12)
+#define MSC313_GPIO_SR_IO15	(MSC313_GPIO_SR + 13)
+#define MSC313_GPIO_SR_IO16	(MSC313_GPIO_SR + 14)
+#define MSC313_GPIO_SR_IO17	(MSC313_GPIO_SR + 15)
+
+#define MSC313_GPIO_SD		(MSC313_GPIO_SR_IO17 + 1)
+#define MSC313_GPIO_SD_CLK	(MSC313_GPIO_SD + 0)
+#define MSC313_GPIO_SD_CMD	(MSC313_GPIO_SD + 1)
+#define MSC313_GPIO_SD_D0	(MSC313_GPIO_SD + 2)
+#define MSC313_GPIO_SD_D1	(MSC313_GPIO_SD + 3)
+#define MSC313_GPIO_SD_D2	(MSC313_GPIO_SD + 4)
+#define MSC313_GPIO_SD_D3	(MSC313_GPIO_SD + 5)
+
+#define MSC313_GPIO_I2C1	(MSC313_GPIO_SD_D3 + 1)
+#define MSC313_GPIO_I2C1_SCL	(MSC313_GPIO_I2C1 + 0)
+#define MSC313_GPIO_I2C1_SDA	(MSC313_GPIO_I2C1 + 1)
+
+#define MSC313_GPIO_SPI0	(MSC313_GPIO_I2C1_SDA + 1)
+#define MSC313_GPIO_SPI0_CZ	(MSC313_GPIO_SPI0 + 0)
+#define MSC313_GPIO_SPI0_CK	(MSC313_GPIO_SPI0 + 1)
+#define MSC313_GPIO_SPI0_DI	(MSC313_GPIO_SPI0 + 2)
+#define MSC313_GPIO_SPI0_DO	(MSC313_GPIO_SPI0 + 3)
+
+#endif /* _DT_BINDINGS_MSC313_GPIO_H */
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
