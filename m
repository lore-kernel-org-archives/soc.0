Return-Path: <SRS0=xttv=X7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62275C43334
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 11:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4AF1FC341D3; Tue, 26 Jul 2022 11:58:56 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 362FDC341C0
	for <soc@kernel.org>; Tue, 26 Jul 2022 11:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 362FDC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id q7so799364ljp.13
        for <soc@kernel.org>; Tue, 26 Jul 2022 04:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SXepETNl0t5Eauvg/pczzznTHabsPOjX83tUsTI9GE8=;
        b=VzbgU00OJTByzWkVApH4fK61lobcJqO8iZS+G2mTVOJodHxycA0osaY4ettHZ4yICn
         lg/jJS07mw9kSC50ob3uJ/M7oVakYNcaAfzGvtvHoV/8JfsVxPd/IPwvGvyqkZMBhPYV
         GOed7CSD2Sv3jFq/jwEYtJ+L94QWmGZe1AufILpiI1fnNGtcpobUaVZL823T7vQBmrC5
         /BtytQI7S10FKlI7oLUNV6ixezlr+fvQbrFZJXfu42fjhLRM8PiRAc46jV/juNmv5bQP
         CcgU5m6IqBodoYGm5iht/Ka2Ifgd4h8ZKtnSiTBCk5DliCK6bVu9snz6WHjJhy326JH6
         /ZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SXepETNl0t5Eauvg/pczzznTHabsPOjX83tUsTI9GE8=;
        b=g0VK+WZSzZgoWIJD27S62CTuV0oeEXaSl71PyT5F3vb62dJ7vLGTrb0w2uBhtnCtqn
         mIIOeydQtP6j/GGB6dmiIiWxGAmMm2yEHKC56xyT8w4qHf1fgNCer+xPZ9aZjg11EPf6
         oCrjGH82EyMU7DhWC8ornOGzmbtmjwHuNkn1qzOTlDYibF1ZZDZF2nDgk5LnnEtTrq7m
         20sm/BMh8egDEKfoJGG55J1Z+8+M/ClSwyN6FLM6OIYEu72CqgjGKeTY8VUWwJqagHp3
         c8dW44jic0LX+GflTzzMAudkif8tNi8ZqmEdyw9mJ5F1hhcGnygl1pd0rTr9F6sUXNTj
         FLsA==
X-Gm-Message-State: AJIora/W1G82bS+FGwgXNqTs1DwZpPMb1ZvoM3wYgv8eDUCVuXR0S2Rt
	l8Xi0X0xGNQ3E9H+GLNXLCap9A==
X-Google-Smtp-Source: AGRyM1uL5SU4BU4NU69IWSheCc7WAGNBFPBjyEmFfjOiC9y/qWdPQUqFn4FaEP6qkwKIhx2HV/9BUQ==
X-Received: by 2002:a05:651c:b23:b0:25e:e2d:9e40 with SMTP id b35-20020a05651c0b2300b0025e0e2d9e40mr2328578ljr.38.1658836733335;
        Tue, 26 Jul 2022 04:58:53 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id u5-20020a05651220c500b0048a9526c7d9sm773000lfr.257.2022.07.26.04.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 04:58:52 -0700 (PDT)
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
Subject: [PATCH 1/4] dt-bindings: soc: bcm: drop quotes when not needed
Date: Tue, 26 Jul 2022 13:58:38 +0200
Message-Id: <20220726115841.101249-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Id and schema fields do not need quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
index 894786640938..a6e8018084c6 100644
--- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/bcm/brcm,bcm2835-pm.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/soc/bcm/brcm,bcm2835-pm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: BCM2835 PM (Power domains, watchdog)
 
-- 
2.34.1

