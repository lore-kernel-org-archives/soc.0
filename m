Return-Path: <SRS0=xttv=X7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF1ECCA490
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 11:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9A00C341C0; Tue, 26 Jul 2022 11:59:00 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3363EC341D1
	for <soc@kernel.org>; Tue, 26 Jul 2022 11:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3363EC341D1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id p10so14778036lfd.9
        for <soc@kernel.org>; Tue, 26 Jul 2022 04:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w3XtkKUKbD1b4UgKVPlGooII0Pk7FHBibUL8j/WSqjs=;
        b=cgtEFIf5L+ce5XEM6PfOjbUlpwDuYfOaqdA0uA1MRphOhGXmysD/4zLTiXgQBmjUDC
         VosLSoaIFYQ9aSic1aBksLVCN7oqwOwHlp9YLcPRjVCFzAuG/l1Y1YzNWXeVqA48K2Wm
         PyeVC058GIts1KmLsUBY6BJb1hJKyoVv2UakJhoj9QX9Yx1JQiz3pbmZyQA+/c7ARxMF
         bVG1eHN9aR0orl4m4xUvzIYUzjZehtNCvAML6kHDYWjlnwNEa/aG/4fd/sEpli3Cu3nX
         AIRwoGs9yAOkoM1zG6IVVQ5Hv0GRgfTgvU4C/3UMfJMBUtNq9Xdhs/vDmS29ls3kQWZ0
         98/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w3XtkKUKbD1b4UgKVPlGooII0Pk7FHBibUL8j/WSqjs=;
        b=J/yM9tiQ/i519+f9XQsYN/sadNYbsjnjt2IxM5LvsSNk5HhKBqfFNxYJZsRfNiJeJQ
         xehyQtPb0NzPnrQc1N91Z8W1AD3+Feo+8Thm5C9QE6kOJNmx37+LmqxsP3B0XSt3ERGn
         puNMZssqaIFkp70VP3mX/DzRcC/OGypp7fLcq/UHGylWGChZegtb3vsE3WsRyHdk4xMx
         RqHl5moweBzgE9Xi83GbkSkZm8mkTekq2MKlrqBKQza0oJMm3O0x7ZakW5U3ElQGABt3
         WO6wO5QeKnigAYurXDbuI6fN9USyYO+eNgZEZuXaEC5OxOzsBsELzoIF36YL9Rvyk6Xf
         QD4A==
X-Gm-Message-State: AJIora8RXRNoFwt43C+tsAQGBA48LMByBjU0rV0A6oT/VFxtmpczFGC7
	KjpUl6lUN/EEhXYDvSkbvqtWQw==
X-Google-Smtp-Source: AGRyM1sAlwvl3au2HeenO+uyoXA1JzXuRyXnOmGFcmsQSJgM6cmNpRF5qIFC6PBqx0v9aSbqPl4P4A==
X-Received: by 2002:a19:8c46:0:b0:48a:839d:6639 with SMTP id i6-20020a198c46000000b0048a839d6639mr5441735lfj.270.1658836738209;
        Tue, 26 Jul 2022 04:58:58 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id u5-20020a05651220c500b0048a9526c7d9sm773000lfr.257.2022.07.26.04.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 04:58:57 -0700 (PDT)
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
Subject: [PATCH 4/4] dt-bindings: soc: microchip: use absolute path to other schema
Date: Tue, 26 Jul 2022 13:58:41 +0200
Message-Id: <20220726115841.101249-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726115841.101249-1-krzysztof.kozlowski@linaro.org>
References: <20220726115841.101249-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Absolute path to other DT schema is preferred over relative one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml b/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml
index 2f8cf6191812..33748a061898 100644
--- a/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml
@@ -75,7 +75,7 @@ patternProperties:
 
   "^pwm@[0-2]$":
     description: The timer block channels that are used as PWMs.
-    $ref: ../../pwm/pwm.yaml#
+    $ref: /schemas/pwm/pwm.yaml#
     type: object
     properties:
       compatible:
-- 
2.34.1

