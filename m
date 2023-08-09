Return-Path: <SRS0=f40L=D2=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EEAC001DB
	for <soc@archiver.kernel.org>; Wed,  9 Aug 2023 01:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55891C433C8; Wed,  9 Aug 2023 01:15:52 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 563EAC433C7;
	Wed,  9 Aug 2023 01:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 563EAC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bc6bfc4b58so18256515ad.1;
        Tue, 08 Aug 2023 18:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691543750; x=1692148550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpAcRisUyrskcWS9AV1ql1Z9KFMGwKdSa1ZIJWKbDtE=;
        b=Y+o78R/URs32r1pS7ksTcEFv//2BRTVRggUQkZSo36ouTaXxU1SiXWbmxGNMMrlmKr
         1cyLi7js8C9amqoFCUPXQUrl3ad0KLTCt2Frj/r7NbIJCVdCnLnFOM1h8Y6I17izvcp/
         zn8rzBr5SWhrg5gNP6v0f1N2HvuleGjhd0/v6yVRIQFufs6eCz5Yubz2HI0lQy2NyIGU
         CwOkG10vWYzjW5DzCoLE+QZtJOlR6vb9qN9iJvB/8/+X41SIlj+4g0ReEkW7bg2xgogf
         DilCh6w2RFjgoa/mNuKcDxD4lUmHJHstpuKmIFNnX4wkq6fI4SJ2WBqi5p2bD3V3fDks
         x/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691543750; x=1692148550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpAcRisUyrskcWS9AV1ql1Z9KFMGwKdSa1ZIJWKbDtE=;
        b=Xu7BvCTpQkWn2UHIXgOOJTP99hTvGVxYdLS3pd02/dW8XCD+Ecr73Pfpy5CEr+YQvB
         bXRXkyOlM9D5Vp5D0ZGz1Qgc+EZiyS6dlI5KZyjPSXm4s9huZvthsuOt9neAR9GwLaIv
         hht9h051jRoI5y1S7PeD1JksFTxj1oXRbrs//lFZuRNOFugMETpyg8HGfjZpRvwMZX8v
         wddnMSIct3t3/NHT3EWoYaCv+RD6uABaQPwIRzzDZMfwED7IRfqAr0WzrTXq/iSNVwdb
         FlfKvA8AFjG5BgQtqIxGemuShnFJ5zAk2LrHGfcKD8QS8kk1WsjoNTQmt0TFq6BPF6Hs
         OdyA==
X-Gm-Message-State: AOJu0YwxnnmVPDVIOgsV3g9hZbrhYrdWPReHKns0o4ra6A8RJgQO6Ssx
	1HBDIfgwLVKC0g42hn3M8mE=
X-Google-Smtp-Source: AGHT+IGc564GPnpp2ZAgbOs+wh+yI70UOwt148b6UgsbAT88NsGzbYAwsKXCaqj84G2bdev6Sx2+0w==
X-Received: by 2002:a17:902:eccd:b0:1b8:2a4d:3eb9 with SMTP id a13-20020a170902eccd00b001b82a4d3eb9mr1151662plh.34.1691543750502;
        Tue, 08 Aug 2023 18:15:50 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709028c9600b001bc68602e54sm5730449plo.142.2023.08.08.18.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:15:50 -0700 (PDT)
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
	Jacky Huang <ychuang3@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v2 1/3] dt-bindings: rtc: Add Nuvoton ma35d1 rtc
Date: Wed,  9 Aug 2023 01:15:40 +0000
Message-Id: <20230809011542.429945-2-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230809011542.429945-1-ychuang570808@gmail.com>
References: <20230809011542.429945-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Add documentation describing the Nuvoton ma35d1 rtc controller.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

