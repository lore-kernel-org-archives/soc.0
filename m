Return-Path: <SRS0=w88Z=DL=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2718EC001E0
	for <soc@archiver.kernel.org>; Tue, 25 Jul 2023 09:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E224C433C9; Tue, 25 Jul 2023 09:40:42 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B3A6C433C7;
	Tue, 25 Jul 2023 09:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1B3A6C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6862842a028so2946977b3a.0;
        Tue, 25 Jul 2023 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690278040; x=1690882840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jtmgg1Ul52XyBeA44Um0gDLsoyDM5m9GSMdFf61R4o=;
        b=TjBnxI1H4mPYSC/luID974TQJUoerHRcbkMmbUBrfOl06tSJ2z1jze7+VHCyydasfc
         grrNHXhCjqlxmPEXv2fg0R8CgTeaAdEQcB/+MVmJDrPb4/POKyDF7qBOOyxHkWrIz89E
         iiK0hurojvVndZfzhAnnAxgM32FNcV/RM2ZDfwpj0hysq6oDkgZDSAVfkvAi1sLAMRwR
         ZNsdldfQGcHe/NpleP7Xp1QoR0fYO0vhcFIgHoD5E5IF/47iRRfbvcP3tPemi9YW+C0x
         Cyx2KOobjKT9CFgICQsvmBFtcMEbSrQgT9rcMfDhD97zOPhw3cIV1X/hf/F/COzDJIuk
         y2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690278040; x=1690882840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jtmgg1Ul52XyBeA44Um0gDLsoyDM5m9GSMdFf61R4o=;
        b=JCtQeGH4vxZE7HxJtFBixYb8rsf/rAH5v3XLsGV/5i0CXoGaPDSn/HCB8KuEZpTj1v
         jwVVl/DwmTgSqVrR4EDWbc6kK14hUk/JSwXIc9HFr8OSeyIEn6cT1FGl3iRIYxGJfz1F
         HulFbfr1QfV6sxALgq5OPxvfHKea+6ZUl1U5F+50M87HXINY3sFEVSgZgEnNNORxntkg
         1EQLGs1dur1o2/kQILGe+2w+Zr/AbP+BnqyOQz2B800sON+Gug9YXxpQt5YMBO202gtv
         txARynyFhshroFFx7oeCXvEIuVjwRPfb8vhUbUtjNDMA2oq7awb6g4grEW2nyEBX4uOJ
         hsKw==
X-Gm-Message-State: ABy/qLa53Eni/OeNcoCChkMRpOc0f4tzODHUF+i514MDcbDDnVDJJmcZ
	CS2iruSRP5hS/35pZwubntw=
X-Google-Smtp-Source: APBJJlFaZleiC0lP8KIns1t7a+vAaiVfELM/adM4AwdT65RfuXj3FIo5olSLXatRA9kENM0O49l/3g==
X-Received: by 2002:a05:6a20:7d87:b0:10f:f672:6e88 with SMTP id v7-20020a056a207d8700b0010ff6726e88mr13581013pzj.4.1690278040274;
        Tue, 25 Jul 2023 02:40:40 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id l24-20020a62be18000000b0064f7c56d8b7sm9121132pff.219.2023.07.25.02.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 02:40:40 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: rtc: Add Nuvoton ma35d1 rtc
Date: Tue, 25 Jul 2023 09:40:28 +0000
Message-Id: <20230725094030.32877-2-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725094030.32877-1-ychuang570808@gmail.com>
References: <20230725094030.32877-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Add documentation describing the Nuvoton ma35d1 rtc controller.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 .../bindings/rtc/nuvoton,ma35d1-rtc.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
new file mode 100644
index 000000000000..5e4ade803eed
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nuvoton,ma35d1-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Real Time Clock
+
+maintainers:
+  - Min-Jen Chen <mjchen@nuvoton.com>
+
+allOf:
+  - $ref: rtc.yaml#
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
+unevaluatedProperties: false
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

