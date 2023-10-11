Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C21FCDB477
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 18:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 147E5C4339A; Wed, 11 Oct 2023 18:49:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABF28C433C8
	for <soc@kernel.org>; Wed, 11 Oct 2023 18:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ABF28C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40666aa674fso2361855e9.0
        for <soc@kernel.org>; Wed, 11 Oct 2023 11:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050160; x=1697654960; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwPgb0Vxa46C21WbpKo3fGsmmsstakxunKdlGSyuz/I=;
        b=V4oN3Y/kyjd3nmW2liJk60igkTnisvlt1xhXU+VSUdDssnaLvhbBwd+ibQHqG5m8p4
         IeYTTN4d/vrFYSwEwx1yTY/eoGvOPIVFZYhQUYz9aKls55rSn8c+/p4YFPhNvPy1COKd
         LeoCjw2qPYfTfwGVMbVYFg26RlZBQa5yRGJFIGPNfpLRzpC4+V/FuB1I1W7qEWL0bVcx
         iF5byMQ79ABNrLFkwN0f3b8U5mUmPo6WIs0mI8p/i4Q72FyWvH/d4YxfmVrz8kiYaZqk
         GnCNaPcVCy4UW2/xVb8WPsYdajja4U/025GFMwcI/zBkTR7ns8aNSute8Ob8SBQYfaRr
         r48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050160; x=1697654960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwPgb0Vxa46C21WbpKo3fGsmmsstakxunKdlGSyuz/I=;
        b=lwB9lu7XRWADc5Aiy5v/5Kr9K1j42XjbvNTVFP5bMKeEXj+Zhne/tEN5ThjPlpAefC
         7Gk6uDie8kX0fplQDMWs6G8UqENSIKvO7pJk8/vifeC3FmDOL1ZQC0qwRkc9Bywc4lqO
         G9bvhiZMenM3E9tnQHQ9YaGA6XTHmro8pKrL0SHFx8oDwR/qGRkJKWsQX7KzcC56SD1w
         h+szJh9Tom+MbxGlhA8MteBf9LRMDkcH27AkQ8lqE8902WD9A5+3H4cN+EPqM8iyrzMY
         eofDGhYfpgMRMWlOkuZk0jYlI3eRPD/G7+zxpevbCtnj3d4DkEiW7b5j1FTgjJC5+oxN
         Y1Wg==
X-Gm-Message-State: AOJu0YysdecwPqnumTPKGDXCuOAX24ZbZTP5vBSuv2UnSgqhLP7h5g2b
	QYI11JosOlekCvNRltcWMkMhDQ==
X-Google-Smtp-Source: AGHT+IFxq973Ob/kOR6t1bmL2SP/if638Oo0uwRo3quVfL0DpoW+bXn2/XL7gAGw658ulQS/plNO0g==
X-Received: by 2002:a5d:4a0b:0:b0:31a:b3aa:d19b with SMTP id m11-20020a5d4a0b000000b0031ab3aad19bmr19222081wrq.23.1697050159908;
        Wed, 11 Oct 2023 11:49:19 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:19 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v3 06/20] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
Date: Wed, 11 Oct 2023 19:48:09 +0100
Message-ID: <20231011184823.443959-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
documentation.

Add maxItems of 50 for the interrupts property as gs101 can have
multiple irqs.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl.yaml     | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 26614621774a..6dc648490668 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -35,6 +35,7 @@ properties:
 
   compatible:
     enum:
+      - google,gs101-pinctrl
       - samsung,s3c2412-pinctrl
       - samsung,s3c2416-pinctrl
       - samsung,s3c2440-pinctrl
@@ -58,7 +59,8 @@ properties:
   interrupts:
     description:
       Required for GPIO banks supporting external GPIO interrupts.
-    maxItems: 1
+    minItems: 1
+    maxItems: 50
 
   power-domains:
     maxItems: 1
@@ -134,6 +136,24 @@ allOf:
           minItems: 1
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-pinctrl
+    then:
+      properties:
+        interrupts:
+          description:
+            Required for external wakeup interrupts. List all external
+            wakeup interrupts supported by this bank.
+          minItems: 1
+          maxItems: 50
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.42.0.655.g421f12c284-goog

