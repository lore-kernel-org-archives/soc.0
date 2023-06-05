Return-Path: <SRS0=QcdD=BZ=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71912C7EE24
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 04:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55147C433A4; Mon,  5 Jun 2023 04:08:19 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60362C4339C;
	Mon,  5 Jun 2023 04:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60362C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b04949e5baso37958895ad.0;
        Sun, 04 Jun 2023 21:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685938097; x=1688530097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lQgRTbL4lTQDPfHV5KDSXk3n/APm71Tse6u2f9wX4A=;
        b=dePX/Fs6SmVQCdiOmkjLuhimVD6fEzVIh30IzYMPDTNhFZltF/qwW07BJaDWAPdqM0
         B0yNrWY8TYKqUGoX0y2knTRPi3ophb5kyhxD575VrT8MJl1BhnVasITzUz/hsCUkuJVs
         w/wszy099EjstL7tm3lsaTx8Cgd3AAMaHhr0EUXHuvxadCdTty0t/tOnj+EU1upN4BPd
         cBGxr4uvGqmydhWMxar43LczeQ5PpFYXjlAnWOvX0nrjTLYqOnkWFiEFutl265WR6nb7
         CCcAFICJIWtF0ky8JZpaWvqOBBEwZ5OE/OOvQnDKvtu5LoCXqT+fKkUGwEE4n7jmq59W
         oeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685938097; x=1688530097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lQgRTbL4lTQDPfHV5KDSXk3n/APm71Tse6u2f9wX4A=;
        b=ALuKozZpCkcGS6kIfxa6fziZnCZtPJq7T7mNtOQGXXNGfH4dQ6Hnj9+7jU6qSHdmrc
         5M1Z2AUFkS/6yEZ6EFDrv8koIclFqHwu4kx1kuAt4rVU28C4QSpJG++P+bUPIYqySMQC
         C/Eqj2hkbzhF57fQs1znem8c7KgtIfue0Zsb3MxoPyVetnWeqvjL4O0NcaT8GfnH95iV
         ekF8u3x+jbyG3cghulPD6byK2AERSNnm2emGtilRrFZreahvXCtzdBTeJIPAJGrVMbJT
         516aQ70QSdBcqs7dLQKQWN0W3VX73/3VXDNPO9doqa3mWQC+Y2ZMbj/IXWqPQyK0XiJq
         +LSg==
X-Gm-Message-State: AC+VfDwQrzNnydMkfYK4u+nGVtGLYa0HAOS+9omiGK/XFdU/OByJE1G1
	G3HhKAS4b6mo87PIwR+UOQt8rQAjtc4=
X-Google-Smtp-Source: ACHHUZ6a9mPQ09ZJ0HL4XfYWr8oWVVJy0eIuUMW9lwnXPhZ1Bz+z6Er369wEga+rjf70ZrreLSRujg==
X-Received: by 2002:a17:903:32c6:b0:1ad:cba5:5505 with SMTP id i6-20020a17090332c600b001adcba55505mr7308298plr.14.1685938097524;
        Sun, 04 Jun 2023 21:08:17 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id b4-20020a170903228400b001b21bcea439sm206164plh.170.2023.06.04.21.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 21:08:17 -0700 (PDT)
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
Subject: [PATCH v13 06/10] dt-bindings: serial: Document ma35d1 uart controller
Date: Mon,  5 Jun 2023 04:07:45 +0000
Message-Id: <20230605040749.67964-7-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230605040749.67964-1-ychuang570808@gmail.com>
References: <20230605040749.67964-1-ychuang570808@gmail.com>
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

