Return-Path: <SRS0=LVh9=FD=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB7FC5519F
	for <soc@archiver.kernel.org>; Sun, 29 Nov 2020 11:08:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 46789207CD; Sun, 29 Nov 2020 11:08:20 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B772920809
	for <soc@kernel.org>; Sun, 29 Nov 2020 11:08:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="tKakT/Gi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B772920809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pg1-f170.google.com with SMTP id k11so8071149pgq.2
        for <soc@kernel.org>; Sun, 29 Nov 2020 03:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m3CLQN+ezeIxnbMRaBRw4YQenTKKZRkGSbveTTi9L6A=;
        b=tKakT/Gi981eqCPGuBJFPcI6EcUbr1Y2VzccCCP+ADnzJqroljWwLuBe8XR9S+Y7Np
         3SFJMUrOgH7JqJKg3kc/KlQwg7yd0V3R28MFfrSVDbvJgbUAubsoUcMMcGrsypSrEfDY
         VW0mRaR0fvAyyI/m1TAOKDqBBBz5DZgJCrIEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m3CLQN+ezeIxnbMRaBRw4YQenTKKZRkGSbveTTi9L6A=;
        b=gAPIZRnwR1oA0sRQ9ollkm6fcvmICRTsn4ToSxCZwnFsxHm7o+bseBQ7SizOZuoKKf
         RbhmJV0fRTy+QQUNW1/hY6ObHORQKxIHMMys1L8rNl3l29peOBOWlE0XmV9z4/+y7dw6
         +S68LFLF8HSj3UxKlq/3HO8mdmJACHkUCzrFwjrHbr1yrKPKLNYaiL3Bc39qEfwo3uAW
         Zbwwp9RFG3m7bfoRH7neNzmz11UqQSHWZ/PByy8AgeA5WgdOcaoGQAtLiYKnxcHbP9Kb
         IsUms8EKAMJ6p3ZlYr+FZzAyRCPtORrrNV1VwITZKb24SezM7e9+gKnm9Jl2kpHpljEU
         fqkA==
X-Gm-Message-State: AOAM532l8F0nxqTOOXWxOaJLy5qLpUN5DShC4gzJJzDr182bujq5zczy
	/cfL07bM14z/eMz9Dwso0OgYF5qwMrjHxQ==
X-Google-Smtp-Source: ABdhPJw9O/+Bnbpyka7o6mMKKMIxJQacADxuTHuFzjU6ocHHZU1ilPkY2XOtLZdg8FugIYAfUZQn/g==
X-Received: by 2002:a17:90a:5901:: with SMTP id k1mr20203212pji.7.1606648098954;
        Sun, 29 Nov 2020 03:08:18 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id 21sm13095653pfw.105.2020.11.29.03.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 03:08:18 -0800 (PST)
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
Subject: [PATCH v4 2/5] dt-bindings: gpio: Binding for MStar MSC313 GPIO controller
Date: Sun, 29 Nov 2020 20:07:59 +0900
Message-Id: <20201129110803.2461700-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
References: <20201129110803.2461700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding description for the MStar/SigmaStar GPIO controller
found in the MSC313 and later ARMv7 SoCs.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../bindings/gpio/mstar,msc313-gpio.yaml      | 59 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
new file mode 100644
index 000000000000..1f2ef408bb43
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/mstar,msc313-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar/SigmaStar GPIO controller
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    const: mstar,msc313-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/msc313-gpio.h>
+
+    gpio: gpio@207800 {
+      compatible = "mstar,msc313e-gpio";
+      #gpio-cells = <2>;
+      reg = <0x207800 0x200>;
+      gpio-controller;
+      gpio-ranges = <&pinctrl 0 36 22>,
+                    <&pinctrl 22 63 4>,
+                    <&pinctrl 26 68 6>;
+      #interrupt-cells = <2>;
+      interrupt-controller;
+      interrupt-parent = <&intc_fiq>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9e7d12b2d403..56a5392b88aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2133,6 +2133,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar/*
+F:	Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
 F:	arch/arm/boot/dts/mstar-*
 F:	arch/arm/mach-mstar/
 F:	include/dt-bindings/gpio/msc313-gpio.h
-- 
2.29.2

