Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712CCCCA47B
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41046C3411B; Thu,  9 Jun 2022 11:39:22 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4BB8BC341C0
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4BB8BC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id u12so46910263eja.8
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PsY51Y9LbGxALCP41QTkZafNtgUGmXvRyYQiy6lI9FU=;
        b=zYVkK+/V8ZGti1yZD5tr+qJSCek+CBHl2Nd1S/T3io//rE3MLRz4Uc6JvOZh//3oZf
         NI0ICECMerr05hjz/YzwcnYcowv9p8XnqaiK9gT1FKO+jvGLlLxJTRc5K8Tyl+cw0tli
         GCrWHIkFLBzMLB4NdF9ll+WcNamrxTIkPgLQggG/rhOflxUtLzoFk4K8mZ5BvLElGwt6
         lwfkDaDKEHIUH6k6qBWnaXgka8n9HzeMOXg0ZwINqRaQg3VDZdNZ47Es/FeEi/YCSAuQ
         lCjAvCwH3a90XTLrXe2L173Z0Tt4dh7LQW3aGReoQTnq25LDPafCnA2RrIgWA9aIlpEG
         gJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PsY51Y9LbGxALCP41QTkZafNtgUGmXvRyYQiy6lI9FU=;
        b=f9Y0vvoVTckjyrAMqlc6u0aFGg8u6nAE29OXxNkSgY2qbbalYqRPYPQfAMYSMaSFca
         MPnt24EUdRZskDDL1QQ0F/Z7b1Du1QzA8f7y9e2LhZ0XZasuJKazuZPB0xAha0AUxNZ3
         ad/agX8NjnT4vov0oEoKA5CULjf5uXiGFh2EdTb7AGkaAOEh/IGiqU7F3Tf/Ac/D5TRP
         2O6RyUmuhfhl3beDQAFsFcqmPrIxpUjOGu39X7OU/+1r5HFZVSvpGye6nqrKQzEGAbA/
         P2hGSuy2MqMVUR/NSJj+V6i85zfsw7zbeWq1znKkugi6pUgAH0BYIOeaJrkK6Mp6TlKQ
         b9og==
X-Gm-Message-State: AOAM530coJtfytv5YrJDwDMO0yXZnIf+1mcWKfile3WeuEphBCQ3qQ+F
	ZZBkoWYe9hwBX8Jg1pCeHjzlcw==
X-Google-Smtp-Source: ABdhPJxghBIkt/oPlnkhYfc+sNVuqIIRec7ri31pQri4hdc3zeWjKeem2e8hWbd5rY1utC5lGBYtqQ==
X-Received: by 2002:a17:906:9b86:b0:6f8:24e7:af7d with SMTP id dd6-20020a1709069b8600b006f824e7af7dmr36649187ejc.295.1654774759852;
        Thu, 09 Jun 2022 04:39:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d54e000000b0042e21f8c412sm11898495edr.42.2022.06.09.04.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 04/48] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl: align key node name
Date: Thu,  9 Jun 2022 13:39:06 +0200
Message-Id: <20220609113911.380368-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys schema requires keys to have more generic name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
index 47a56b83a610..4c7691c38b10 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
@@ -152,7 +152,7 @@ examples:
       pinctrl-names = "default";
       pinctrl-0 = <&pinctrl_uid>, <&pinmux_uid>;
 
-      uid {
+      switch-uid {
         label = "UID";
         linux,code = <102>;
         gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
-- 
2.34.1

