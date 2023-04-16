Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC31C77B7D
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 10:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8670CC433D2; Sun, 16 Apr 2023 10:18:33 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1946C4339C;
	Sun, 16 Apr 2023 10:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1946C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-94a34d38291so430751166b.3;
        Sun, 16 Apr 2023 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681640311; x=1684232311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Deq7iuiEl1RFyBysVZfY7LGeNc11tLOLC+fdaC0CAMg=;
        b=ZAwt4HeI7zjFHJkplxlMJqzMttBg4MXXpiOfe9Mx+voSNjApPexnWf9uECiJ5Yl26Z
         ljMP/sqVqA1WmuJCGGf4iUWm0QxpbjJjTuBsLAkf2/z2fZahvgd2yhwHTf8brQIv3pH9
         YzjNwHThdfqX1s5uGL//gNzstTz4I0zZBjDesqKCzHURMRJpsU9CYAXSOTTxlflcRfAC
         7c5fcu7/rV7NLWHwe35UuqLChgWWbDavh1cUQfEhB5boPBfhYzI0Z38WBEYBMUArIOSI
         MCzjsxc0cCUgXe8RohOTFHSJMIx8FaWrvZf/hbdITR69cKMBxspbQmniQ35+PLB17jK1
         nzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681640311; x=1684232311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Deq7iuiEl1RFyBysVZfY7LGeNc11tLOLC+fdaC0CAMg=;
        b=VDUfpYKDblWhxAYjsHOqZYBfkqbAQbY+eZGujsl7KG52gn1eOfhxWN0J8M06oIMRco
         N04wLDfOWk5tPdgKKMjpzim3tzjYsBySerNouaNvJVV7v3eHHd/utQ3k/yYV35E4zoZS
         Ub152l6JQfN9Sl32IB/3AZ3821mvwrQfxtpkQX1+pQ7NhL4LB4OUyZ5nn11+gSAvhIAL
         HDUQdAs9b4/+uO+ZaoMlK4m+tC5OBlw7x2nIJGmsfFTNYMb0yMuIHv4cOnLizWPbZrY1
         vstX9PnhnpzXHEg/6bs13HlQ4s5lMYmnKVchQMqrn41az/PTWl9JCMtciEo2YOHpWu6F
         4Nkg==
X-Gm-Message-State: AAQBX9dS04AmjkI2ZL3dDP6SmITqzROZ7Kvd4BRPQc68uMNDqd5984uo
	mOUfWiK0GxSqtN4rIKwWJEA=
X-Google-Smtp-Source: AKy350YkWFGDJqV0rBc+9gzlX9eokYwBBCkk2wU46o9VJLPhqhdapjAD8Blc2K/bSjtNuYp3e6wasw==
X-Received: by 2002:aa7:df0d:0:b0:4fd:29e4:ccfe with SMTP id c13-20020aa7df0d000000b004fd29e4ccfemr10155286edy.18.1681640310676;
        Sun, 16 Apr 2023 03:18:30 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id r20-20020a056402019400b0050476da5160sm4427443edv.45.2023.04.16.03.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 03:18:30 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Kukjin Kim <kgene@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH 11/12] dt-bindings: arm: samsung: Add Samsung Galaxy Tab3 family boards
Date: Sun, 16 Apr 2023 12:16:23 +0200
Message-Id: <20230416101624.15866-12-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416101624.15866-1-aweber.kernel@gmail.com>
References: <20230416101624.15866-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible strings for the Samsung Galaxy Tab 3 8.0 series
of tablets.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 .../bindings/arm/samsung/samsung-boards.yaml           | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index deb2cf971871..4ee026e7f7ad 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -104,6 +104,16 @@ properties:
           - const: samsung,exynos4412
           - const: samsung,exynos4
 
+      - description: Samsung Tab3 family boards
+        items:
+          - enum:
+              - samsung,t310                    # Samsung Galaxy Tab 3 8.0 WiFi (SM-T310)
+              - samsung,t311                    # Samsung Galaxy Tab 3 8.0 3G (SM-T311)
+              - samsung,t315                    # Samsung Galaxy Tab 3 8.0 LTE (SM-T315)
+          - const: samsung,tab3
+          - const: samsung,exynos4212
+          - const: samsung,exynos4
+
       - description: Exynos5250 based boards
         items:
           - enum:
-- 
2.40.0

