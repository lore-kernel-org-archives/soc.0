Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8288C43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95747C341C0; Thu,  9 Jun 2022 11:39:18 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8347C3411D
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8347C3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id u12so46910263eja.8
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n04xRHDLPG5HTJiUoTVbiyOiGV01+5rVdjSb2OnFTXM=;
        b=Ho4w2nM3+Q5bGqtr36/o6zunEJf1I2XT6LKt8qPNLkRCy08ezqkJOGQcvBy5vco1my
         LGBVSuQy2o3zJ3VRCl5ktdED8AwYX9JPpK6G/5qGM8by9MmCH5kjgAac+5wdKBNIpFR8
         xwCEy+untlqCgNrdyjBW7OOwtMZ/fatULZ5sRrG0DbV8h1a8fkBFQZrHUVRrHVTdOMOk
         bFY0Q+lM7yWFhuw7oGtstkGAHtRN906miEa6MNINObX4FBiMpladAqhuYFhntv02FElx
         IpEdpyFjcGNvTY5jsUxfo3i9hgyGqj3e7n/Ht1bGDfF6O7zBd2Gr4mncFJWMEbpebOEc
         /opQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n04xRHDLPG5HTJiUoTVbiyOiGV01+5rVdjSb2OnFTXM=;
        b=goYxJSHIsd6IlXQ+HRHCMfBjYhDWtpYM7WEK5jJ3yJ4q9FSzpxXgSWjlwatjTS5Hgd
         Vm9Plcu4R8JKqfiCXu9YibX08Qnvh8IzluAft0T4rpcYJmpJQ/5b2ggJiFew0/pKV1Hl
         zH3cckiDphFO1Ihq70K0O0VG8pO/XaC+NA0JYtCmv4YkOdROoFA+VpGXHPslSKYFZN55
         5+BOUSsvp0GpKCiF6iHfOgDHPB8+oXsbHKSLDzD4AZ3gvFuT4F1Mil3hE86eYAyPszFh
         xbLQjlUE1EXAEaGocxImA3B3aQvST+z3rTAt9Tau3R/w8N8ztD0nF5L63azFkxlfOhWM
         wlJw==
X-Gm-Message-State: AOAM531Ka0ZnwdgTSD3UQReYYQ3ilsc5kNACN3q8fnjIOAF4H0AAEua+
	ZZD4Ci5t434KipzNxmwK1nwWjQ==
X-Google-Smtp-Source: ABdhPJwgFvtD9GYY39BjWKd3xyuHcJYvYead1t+NeA7lJVCKNmpwd5ABumStlG++pLlWR2zP3uaRug==
X-Received: by 2002:a17:906:e202:b0:6fe:478b:7c1 with SMTP id gf2-20020a170906e20200b006fe478b07c1mr35455237ejb.419.1654774757503;
        Thu, 09 Jun 2022 04:39:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d54e000000b0042e21f8c412sm11898495edr.42.2022.06.09.04.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 03/48] dt-bindings: input: gpio-keys: accept also interrupt-extended
Date: Thu,  9 Jun 2022 13:39:05 +0200
Message-Id: <20220609113911.380368-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each key device node might have interrupts-extended instead of
interrupts property:

  fsl-ls1028a-kontron-sl28-var1.dtb: buttons0: power-button: 'anyOf' conditional failed, one must be fixed:
    'interrupts' is a required property
    'gpios' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/input/gpio-keys.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index e722e681d237..17ac9dff7972 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -92,6 +92,8 @@ patternProperties:
     anyOf:
       - required:
           - interrupts
+      - required:
+          - interrupts-extended
       - required:
           - gpios
 
-- 
2.34.1

