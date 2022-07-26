Return-Path: <SRS0=xttv=X7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71344CCA489
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 11:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 368A1C341D4; Tue, 26 Jul 2022 11:59:00 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D500CC341C0
	for <soc@kernel.org>; Tue, 26 Jul 2022 11:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D500CC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id w15so14256415lft.11
        for <soc@kernel.org>; Tue, 26 Jul 2022 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fXheGcE2vh8eVRPsDfJBjefjPqTEXxVEm5Y9mMq+Fz0=;
        b=qI7oAyUz1S2BQMRtMxsKknQtd4etscgeBx8jKYNXWxwqJZReDaTny2mLlT5jTGtnLG
         bXzp+ZvO/QwuO0q1PtV6fpVr79k921sG+JCUT10m6hvpmj5luuJGb1Xf4r1Te62ymaZf
         KtUkv+XhxqizmEwlWP9htvQfkRemV5P2spDF6J+pPFDul+lZo+Gc9wEzyVvh3Js0BGnX
         ylXGkJwFM6QpQ5V6gsDlX/JobcqLy+ERx2f56FDlGCjRjnzvmLG4C6vj+sqHiSDEZe7f
         9nGTsFMI2q7L7T+OYWBVn8O/PBEupIJIh9FzUDw7BIpIHvZZxIXZXEgefuR3AGbGmV7I
         P5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fXheGcE2vh8eVRPsDfJBjefjPqTEXxVEm5Y9mMq+Fz0=;
        b=6VsMYyIKDZFoDKdBWaoWL4cPL21JgX9pIZHkX7VNQmlLg4gGJ2HqOBkAPr30zW+Kvm
         0rLQTSRzrTOyCRt6YhvdButgbWwzhOPf/GG4UNF4Z+qOnkIfSmPE/QuuwNCGMI/jkNk7
         ObNhlpmuRpjUZbZ2Je1VMRJscTWROU8cQ65UY8Oc5CgvW79htaKjOduISdc7ky7eZ1U8
         Yhqxexp3S5x9SOt9YQWCW46bvefVBAbGrUfk+HVOkrlBqye41KWIWFCm7+TyQisar5U+
         PZc5e8vtZ+W8LDNo5N6N7nu5iGFOuU9G6yfpDBIhHS3OEckoiOKDywsQ4/28AauYnuaZ
         zS9w==
X-Gm-Message-State: AJIora+YVwJ7lDb/CfOCA2KB4IZsFyT1ec1AepoKlayMOEpwau6+SF8Y
	DXfxyAuLRxSBgH794hiitbkn+A==
X-Google-Smtp-Source: AGRyM1vq9fy7SbNAytMwkf+4EahvThfrvOV88XCAv01wwt3e3pSZrmVNz43dETwbDjXGuIfJffgBxA==
X-Received: by 2002:a05:6512:3084:b0:489:e658:25ac with SMTP id z4-20020a056512308400b00489e65825acmr6742052lfd.431.1658836736645;
        Tue, 26 Jul 2022 04:58:56 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id u5-20020a05651220c500b0048a9526c7d9sm773000lfr.257.2022.07.26.04.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 04:58:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] dt-bindings: soc: microchip: drop quotes when not needed
Date: Tue, 26 Jul 2022 13:58:40 +0200
Message-Id: <20220726115841.101249-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726115841.101249-1-krzysztof.kozlowski@linaro.org>
References: <20220726115841.101249-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Id and schema fields do not need quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/microchip/atmel,at91rm9200-tcb.yaml          | 4 ++--
 .../bindings/soc/microchip/microchip,mpfs-sys-controller.yaml | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml b/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml
index 597d67fba92f..2f8cf6191812 100644
--- a/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Atmel Timer Counter Block
 
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index b0dae51e1d42..04ffee3a7c59 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs-sys-controller.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-sys-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) system controller
 
-- 
2.34.1

