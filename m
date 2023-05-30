Return-Path: <SRS0=K2iS=BT=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55166C7EE2F
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 07:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2FE25C433A7; Tue, 30 May 2023 07:45:04 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5D0EC43446;
	Tue, 30 May 2023 07:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5D0EC43446
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ae3fe67980so36867445ad.3;
        Tue, 30 May 2023 00:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685432570; x=1688024570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lQgRTbL4lTQDPfHV5KDSXk3n/APm71Tse6u2f9wX4A=;
        b=qu30e1RffjD/wFga4tBmkHlv+DLQlB9D2CDBz9VHEzWrqOP+fBQOobnTMHSD7fgSJC
         oDdl/2zaU5wAtZBBOIt1hqg3wvnp9UoFR9loMT6OSUfyNjl2aS3REvoqOCrKHLVOYQlj
         f9a3Jy6VAE0ZZSxtDYCoXw/URh/H0e/lXva3SD1xK149XJWUyKhUARO+vIYo8gIW1dFb
         9z05wWUZE//k7gg9NgeMPwJ+Q3YVLeZrqf2NeWr2mAB7AT2942BpFTfvuFh3BIhUXTbI
         y1RjZaYc2NVT9HLqRrFJJxI9A0Qrsr0j9piQUGsNXuz8WcAFMVyN5WUdowunU27k09+q
         TfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432570; x=1688024570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lQgRTbL4lTQDPfHV5KDSXk3n/APm71Tse6u2f9wX4A=;
        b=XgfkKRvJOx0Idqu4M4lVc47alB2iiLJDCmEQ4zD9Bdwlr/NO2GDh0K4opktLQ0zVta
         OOMj9ByMgrTGRZeHZsgNRn0jsMnBmeOm2A6Ukn881EnXsDCjtGNk14O7Ue3QVQmD4/Ov
         VQQUYyDbBWS8t1YgjzrGD5pi+NER1XDXhq5nCzGYDuvjnnCqKyn5TNlkojAh1jDDgDko
         M3m1/ti+Wsf8qpr0VivltgB48Dzol9fDF98hKWTpPkh503lf2eFM6CFFcnbMHr+Bd2++
         Hu61GjR5qN71T4T1rn/3Mz61xUHE7LlK5AfbEp71oljEezuhl4yOpVXc3T0pL/Xi2ytn
         0maQ==
X-Gm-Message-State: AC+VfDx6pJNjZJUGge2h+H6GRU4/AfVbphqYldWerHZtamq6vX1Et1IP
	V9iVkoygfFNMw9K3lp8/IslGXDC8YzU=
X-Google-Smtp-Source: ACHHUZ5sK2ogRI88/MHKhkLWqWAjIbOZXvvYLg7nC8AgoyzK4Kloj/wBWpy/XtJnNGttJjnMX4wJaw==
X-Received: by 2002:a17:902:758e:b0:1b0:25ab:a9eb with SMTP id j14-20020a170902758e00b001b025aba9ebmr1575580pll.8.1685432569846;
        Tue, 30 May 2023 00:42:49 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id a14-20020a170902ecce00b001afb96f4b90sm5930793plh.274.2023.05.30.00.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:42:49 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	tmaimon77@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	arnd@arndb.de,
	soc@kernel.org,
	schung@nuvoton.com,
	mjchen@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v12 06/10] dt-bindings: serial: Document ma35d1 uart controller
Date: Tue, 30 May 2023 07:42:17 +0000
Message-Id: <20230530074221.1031011-7-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530074221.1031011-1-ychuang570808@gmail.com>
References: <20230530074221.1031011-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Add documentation that describes the nuvoton ma35d1 UART driver bindings.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../serial/nuvoton,ma35d1-serial.yaml         | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/nuvoton,ma35d1-serial.yaml

diff --git a/Documentation/devicetree/bindings/serial/nuvoton,ma35d1-serial.yaml b/Documentation/devicetree/bindings/serial/nuvoton,ma35d1-serial.yaml
new file mode 100644
index 000000000000..a76af0f6009b
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/nuvoton,ma35d1-serial.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/nuvoton,ma35d1-serial.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Universal Asynchronous Receiver/Transmitter (UART)
+
+maintainers:
+  - Min-Jen Chen <mjchen@nuvoton.com>
+  - Jacky Huang <ychuang3@nuvoton.com>
+
+allOf:
+  - $ref: serial.yaml
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-uart
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    serial@40700000 {
+        compatible = "nuvoton,ma35d1-uart";
+        reg = <0x40700000 0x100>;
+        interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk UART0_GATE>;
+    };
+...
-- 
2.34.1

