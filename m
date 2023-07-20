Return-Path: <SRS0=98Po=DG=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4631C001B0
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 01:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 890E3C433C9; Thu, 20 Jul 2023 01:28:37 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A919C433C7;
	Thu, 20 Jul 2023 01:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A919C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b89cfb4571so1862515ad.3;
        Wed, 19 Jul 2023 18:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689816516; x=1690421316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PknmXnQirEOnubVOauabc0cJvIl8m6tNpWyxQZCD0N0=;
        b=HlYK066kywXFDcqXfpN2MS//uTAgfYqt5W28/6QC2VM5BWYvB9bkuxwbgRlpf1fMew
         Tm/pCbdMEnTe3tOBySqaUMHvkByNcNOlFFGdNmLrhU4bFI4TOTJGS2knR7XmWOHKbpoW
         /I+38ci00HljLjTLHrsLSNgjGqduuZlVU25broSFKNElvothWFoMJ0GGG4N9GDbZa/Zl
         nZGOHUmJPM8x9+tnsBOBKYEu8HcGaSGhp/4V5d/wjxEjYWzo8jZMH04YE/zRlgl3UbQc
         vLFf+m/2YS5qKN7Nf8ri2iyYAeRf+BcDIcQidasUU4L9RVBAyNJoZIwQUS7dcD5JOiAr
         rtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689816516; x=1690421316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PknmXnQirEOnubVOauabc0cJvIl8m6tNpWyxQZCD0N0=;
        b=N0c+nAKGVsZgxmG/aiByJpkR+ijq7KNx+oB6sYY2KxkWCLFirsIXxUwqCAYAdKEnms
         ThtNIc/dOPGH96m31A/irX6d44pkvhJ4fSt4yDda0bR3hzYQTv1FY48jxwAYkw85vMwE
         avGLdzUr5u2SnyCKWBQ6qrZ2+2zXhrg4htumuJzkPmX7Mz48Mu3WHdVFD4BvknRV9+qy
         eZ7pHYvykkONGYgDgvcXp+ofFa9pM2Nr2v8czIOinKLhwpXwpvYH6ounGuSfDiyqjG4V
         7k39mBahjGwUmC734+XL6oN3uvjubyU7YAvjOb5/3B9b2NouWtxdIEAwmOYS0th2AnaM
         HZcw==
X-Gm-Message-State: ABy/qLYdDkKoHfxSpPIpI47X+ROWFQ1Ct37szGn/Hs7uXDfGXzSIb2Ih
	LNs1grMvBBpeO6Gnls9sipo=
X-Google-Smtp-Source: APBJJlGSks9Rg5tIlI14bZPE81Pyz9Tcv/KMpi5HUYJgRIUzBSJhe/UXuN78EoamwuQ5FKB1bcIDJw==
X-Received: by 2002:a17:902:e548:b0:1b8:b29e:b47b with SMTP id n8-20020a170902e54800b001b8b29eb47bmr5402474plf.44.1689816515718;
        Wed, 19 Jul 2023 18:28:35 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id jc18-20020a17090325d200b001b1a2c14a4asm4673998plb.38.2023.07.19.18.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 18:28:35 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@kernel.org,
	mjchen@nuvoton.com,
	schung@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>
Subject: [PATCH 1/3] dt-bindings: rtc: Document nuvoton ma35d1 rtc driver
Date: Thu, 20 Jul 2023 01:28:24 +0000
Message-Id: <20230720012826.430026-2-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230720012826.430026-1-ychuang570808@gmail.com>
References: <20230720012826.430026-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Add documentation to describe nuvoton ma35d1 rtc driver.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 .../bindings/rtc/nuvoton,ma35d1-rtc.yaml      | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
new file mode 100644
index 000000000000..08c30f3018fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nuvoton,ma35d1-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Read Time Clock
+
+maintainers:
+  - Min-Jen Chen <mjchen@nuvoton.com>
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    rtc@40410000 {
+        compatible = "nuvoton,ma35d1-rtc";
+        reg = <0x40410000 0x200>;
+        interrupts = <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clk RTC_GATE>;
+    };
+
+...
-- 
2.34.1

