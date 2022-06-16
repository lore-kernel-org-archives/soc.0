Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25F9C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB9EFC341C5; Thu, 16 Jun 2022 00:54:01 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D0A7C3411F
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D0A7C3411F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id t2so20412pld.4
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iTmMhkqlfpVDlkUHNU9nY9SnHGZsapXurBzSo9cHSyY=;
        b=ov/ul4jxhKist2TEfrakrnj2dmKcx7DUNTcwBDLkBudr6r+QfyRL7lSmO1KFBCD5Ul
         QDtD5oAEzoFLAzsk2j+eT1TugvWzSfQeZmcF+mz5gpgaq0/39jBdAZ2D9YWIkCohE74q
         T+FwtwSVTj/FHvtue80lh1EZwpoJhlEE1tPrZhMLl6+zwel4NfaohhiXG3gZy8i/CFH8
         sMoqsGOAOEUroc/WUK4GF0xlNka2ER1S+upnS17j7m+P5guo5CuzWV6pFnlG1Y+DWgbV
         Qgu7yG5mjOA+3oemzHIl+TelmICNTvp6ttQOCYkSy02IlHtAPpm8lrNV0rtEmoN5GkFB
         KFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iTmMhkqlfpVDlkUHNU9nY9SnHGZsapXurBzSo9cHSyY=;
        b=aaPIzCuko/8qPjc4LipE85q5sIzVzVf9dYwpCQuK4Qth9UInOajn/O89dDAJyP8ozq
         BYSf7PehpFpQhVe8J/UW/p5rTGZIhObSIVT1VfNlmcHauP1sJwgVh49puuwR+HPGeTZV
         SYqm02tr2V+Uw8Wi02oUTUvs11tetqUoBfw9F9k5yNioGn6iWkC1dSTMv2QNKhTeQqYX
         lv3FPAztdr0G3lrPA6bFn5aiofSu0wPg6ngwlHH8VbjJl/19w5eRy++UgwSr/56bHwj0
         hpzOl+ArLjmlKzc9S41i5fYw+C8eD3t4D//aTHGC3+G4f+ZTDfkbZyiyqddRaGczsK6H
         KZow==
X-Gm-Message-State: AJIora8nfhtsBbMjdmQQY5u9C/StOOBgZ05CgM4yT6TQ8rhW9kpeXwDi
	IDkw6q/mO5BdiWwGdVIB0t5jNg==
X-Google-Smtp-Source: AGRyM1uUgtMpbSHwdQrftxmeWaXmKReJq4JcYQ6GGsSyFi4zWRGp6KG9VseBtvRIrdjjHmpi5fMEXg==
X-Received: by 2002:a17:90b:17d0:b0:1e3:5324:c465 with SMTP id me16-20020a17090b17d000b001e35324c465mr2309564pjb.34.1655340840506;
        Wed, 15 Jun 2022 17:54:00 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl: align key node name
Date: Wed, 15 Jun 2022 17:52:57 -0700
Message-Id: <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys schema requires keys to have more generic name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. Name it "button-uid"
---
 .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
index 47a56b83a610..7a11beb8f222 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
@@ -152,7 +152,7 @@ examples:
       pinctrl-names = "default";
       pinctrl-0 = <&pinctrl_uid>, <&pinmux_uid>;
 
-      uid {
+      button-uid {
         label = "UID";
         linux,code = <102>;
         gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
-- 
2.34.1

