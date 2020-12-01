Return-Path: <SRS0=dBqm=FF=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7655EC64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 13:43:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3203A20857; Tue,  1 Dec 2020 13:43:42 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A8A72080A
	for <soc@kernel.org>; Tue,  1 Dec 2020 13:43:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="mrbeoE9E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A8A72080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pf1-f181.google.com with SMTP id y7so1125094pfq.11
        for <soc@kernel.org>; Tue, 01 Dec 2020 05:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plvQeaUD9wIIwbJapMgxHoz9Nu1G0OxoMzRow/yYT1o=;
        b=mrbeoE9Eh+XfdYw5G5mGNFmFb6DualPxipg3j34VULsY5vvlx0f86/9u7So6M5fPcK
         Ah0c4EN/OHfQqaHSrJ+93s7QOmADJNuZX4X5XDU18uSXKQBf7AmCsaQNx4C3d519+0MB
         Ybu/T+58N1UvvhXJ6BdtanFw3QUy4wJSvIlFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plvQeaUD9wIIwbJapMgxHoz9Nu1G0OxoMzRow/yYT1o=;
        b=taJzxSK3GcDVmtmvN75aRt6X7HtourRL1hVFm3l/nazh0uFneK0ujw/KbttUtC201N
         PopwNm4sa9AmHcGBSxiHP7KmsCZC6Kl0N+NYj0nJo9VOFD5v40bxYmD6O55tRcT05izK
         1fpk/zmUYvyXbbXQLr0KZTobSs5LyaP3jAkDpmXhdGmAdQ3OY4cRCgyLaprzv+mGYy/W
         BVbw/NYJhIs399Mldzv8TOpoHm0anmKx/5tk8VUs9TsTQMsaaWIm0DmddWUYNnSYDs6x
         Zs9d1nVptvOowSxzroQq4/+721McPmydhaV8BXth7btHcUD5SWgivGr1mBkU8lDZRWNW
         VUVg==
X-Gm-Message-State: AOAM533BaGXC8bephUqd9YvEE9SunM/uIDPw0BMkSY0Wt0ldq4d77Dzp
	/K+0In3h0knhPI/1LZ+WpbOLT67innuMjw==
X-Google-Smtp-Source: ABdhPJzxeEuwbvL+1kRV6+uUT7mx09UASek8f5bclJNvTywXMbmSqEQERWDw7AskMIvw+oaxcr+v9g==
X-Received: by 2002:aa7:96ca:0:b029:19a:8ccd:895 with SMTP id h10-20020aa796ca0000b029019a8ccd0895mr2498359pfq.61.1606830220296;
        Tue, 01 Dec 2020 05:43:40 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:43:39 -0800 (PST)
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
Subject: [PATCH v2 01/10] dt-bindings: mstar: Add binding details for mstar,smpctrl
Date: Tue,  1 Dec 2020 22:43:21 +0900
Message-Id: <20201201134330.3037007-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a YAML description of the smpctrl node needed by the
platform code for the MStar/SigmaStar Armv7 SoCs to boot secondary cpus.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../bindings/arm/mstar/mstar,smpctrl.yaml     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml

diff --git a/Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml b/Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
new file mode 100644
index 000000000000..599c65980f5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 thingy.jp.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mstar/mstar,smpctrl.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MStar/SigmaStar Armv7 SoC SMP control registers
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+description: |
+  MStar/SigmaStar's Armv7 SoCs that have more than one processor
+  have a region of registers that allow setting the boot address
+  and a magic number that allows secondary processors to leave
+  the loop they are parked in by the boot ROM.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sstar,ssd201-smpctrl # SSD201/SSD202D
+      - const: mstar,smpctrl
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    smpctrl@204000 {
+        compatible = "sstar,ssd201-smpctrl", "mstar,smpctrl";
+        reg = <0x204000 0x200>;
+    };
-- 
2.29.2

