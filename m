Return-Path: <SRS0=TN87=FD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3F1C5519F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Nov 2020 11:09:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3887A20771
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Nov 2020 11:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aoKX2vmh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="tKakT/Gi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3887A20771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BLfZA9ijTCyefW1X9bXU0lzkdRe/UvLqWGmcCZUCj0I=; b=aoKX2vmhLgzZf8mMgS5Ut4iHo
	Sjdxw9qF3ZgaiNSIcJm0Byfg5j5K7+Ph94LxYXBa593JR790kvt6GzlYCuQEjOKOjqaT0ZVZrPK8r
	ifCxWVodwO7vc2wVQCtz+GucYyum9+0Kcc0MtuoKnATfSchMg4vRlt6T14MW/vb6ic+EAE013c4S5
	ul6D1ddt3hvHT0InwEoeP6GjJBxHvQ6r5yGtX/Uldu7NC6C6QzpkGFXSVAEji2pXAAAE131/b7ZsL
	K8+yyNPdvvib46UFNZMwSqPnLOUJT0rzGxXSwCY9p/3iOg/o5T/aae0ZtiMFlqg33Fv6z7Q+7A+1+
	Sfqs3Qqog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjKZJ-0006GK-63; Sun, 29 Nov 2020 11:08:37 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjKZ3-0006CW-2F
 for linux-arm-kernel@lists.infradead.org; Sun, 29 Nov 2020 11:08:22 +0000
Received: by mail-pg1-x532.google.com with SMTP id e23so3198910pgk.12
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 29 Nov 2020 03:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
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
 b=H4KEJA6a4J2yNlnv69kuJwOSRsv8a/Dm7IHrP1M3qqZlYLloizIgstFSvAm0AIEkRL
 6WO7u1jQhfNfxzRIFlgj+/B2hHocGY1NUxBexxOMoB1P4m3avHyBm3HLUw+m59iCG1jx
 EdwNpdGIwcvvtasgLgbyUgfZ8+WyfxN+0UrZyqat8I4sJlhgJZYSgkKUwmrqvk07osji
 aBLu5Av87MD38cC/xleLGLomlBfY9i+Cw6TA/TW43Fu/tac5fMwD7Lb/NmkthYJxas+d
 c0JAEQbNh3COwvj4eebuWXrJLDt4bbwCKKknPcD/2PpxF4+oBko2eGBfywGV4AsheXMg
 63hA==
X-Gm-Message-State: AOAM531F2NSgxikeRuQa6H5h23EVrFGZ901uTCcwRjWyNHTglKkMslcO
 d6ZlzttZLAzG6+JdGoriPVNEFA==
X-Google-Smtp-Source: ABdhPJw9O/+Bnbpyka7o6mMKKMIxJQacADxuTHuFzjU6ocHHZU1ilPkY2XOtLZdg8FugIYAfUZQn/g==
X-Received: by 2002:a17:90a:5901:: with SMTP id
 k1mr20203212pji.7.1606648098954; 
 Sun, 29 Nov 2020 03:08:18 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id 21sm13095653pfw.105.2020.11.29.03.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 03:08:18 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 2/5] dt-bindings: gpio: Binding for MStar MSC313 GPIO
 controller
Date: Sun, 29 Nov 2020 20:07:59 +0900
Message-ID: <20201129110803.2461700-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
References: <20201129110803.2461700-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_060821_166302_58332ED7 
X-CRM114-Status: GOOD (  15.45  )
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
Message-ID: <20201129110759._ovE7aHaQ38J7cw2DD0y8zRx3H-pl9bwopkEFacYQt4@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
