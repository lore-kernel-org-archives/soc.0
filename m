Return-Path: <SRS0=xttv=X7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E85C43334
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 11:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2AB9BC341C0; Tue, 26 Jul 2022 11:58:58 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2632EC341C8
	for <soc@kernel.org>; Tue, 26 Jul 2022 11:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2632EC341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id q23so9064865lfr.3
        for <soc@kernel.org>; Tue, 26 Jul 2022 04:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jA+mqudhBBZi2Q/yV+jzZ+rW7CDDtET6U/Ixmvt8ur4=;
        b=OEx9hi9DiBotTSc9NDiSVFVjtV0XPO9DE0KkWuIzknPN8KIpFfYTsymDloa+FvuuTH
         TXSbBxtrEW/6REw64WBb2iw+t6apwsb+MieujLHGnA9ZzlqvUwntVzWL6kNwRbQO80Yw
         08fef0leKuTPSdXaK1B0nq73TSDNBR/tn+7W8697ANyrpOhagpYmq3xSeyHU5SMbEnla
         K246TeNm2EOy/a1Odvi81WAsagK17pW7pCAn41tBdvMVxO06qv7P3X2q0jhJrniRFwvi
         PbKeYwvTFv4ktw+N3NMpTlQrQDn1UDVlM5T5A30/wngtk/SH4L7wb/w+40Vnb/zG/Vh5
         TnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jA+mqudhBBZi2Q/yV+jzZ+rW7CDDtET6U/Ixmvt8ur4=;
        b=G25/sGso0oQr6vbjJqsuWJ+pBXv2YZMElyIVNYIrwId4USzPgkkk0Nk0fSsfzs6K17
         Vp3L28ckdhoMfMTNH2LI2EYpsrvGWiTFt4Qd6xyCm3EX712HWp8RV42rS5wuAR91bhYs
         vMgdyGnh7KOainBRyOxY5sXLv1sLBdR7Ys4LsO6TnWQ5k8+SIk7DT7XcCqus6bc2KYIm
         4aD4Lg0QpY+Ii6WosrFGIGqvvG8WkqZclFc0Qe8vhAZacx8a1uivdGLRAcHgsQQAMbQo
         iouEDX6CKeDk7hLhETnYyoya70xSWSgGrqWaeQSC5qY0A7TiAMkNz3f4ET/BwKaZD0Vq
         6XlQ==
X-Gm-Message-State: AJIora+562MAQX+xmqFG9uXDctAMfCQG2/2JW56WoBgwxK1hbcy1FION
	q0HFm/R8t5tyt62Yv32I8q2WWQ==
X-Google-Smtp-Source: AGRyM1stGsVW9B5+RaHQ2eIH6Xm0MbVHcEZFesSN28iMGL0Xm4GTDsV2XCnVrqIn/tbfBX6mLgoEMQ==
X-Received: by 2002:a05:6512:32c2:b0:48a:9822:ca2c with SMTP id f2-20020a05651232c200b0048a9822ca2cmr2514915lfg.117.1658836735012;
        Tue, 26 Jul 2022 04:58:55 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id u5-20020a05651220c500b0048a9526c7d9sm773000lfr.257.2022.07.26.04.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 04:58:54 -0700 (PDT)
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
Subject: [PATCH 2/4] dt-bindings: soc: bcm: use absolute path to other schema
Date: Tue, 26 Jul 2022 13:58:39 +0200
Message-Id: <20220726115841.101249-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726115841.101249-1-krzysztof.kozlowski@linaro.org>
References: <20220726115841.101249-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Absolute path to other DT schema is preferred over relative one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
index a6e8018084c6..e28ef198a801 100644
--- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
@@ -14,7 +14,7 @@ maintainers:
   - Nicolas Saenz Julienne <nsaenz@kernel.org>
 
 allOf:
-  - $ref: ../../watchdog/watchdog.yaml#
+  - $ref: /schemas/watchdog/watchdog.yaml#
 
 properties:
   compatible:
-- 
2.34.1

