Return-Path: <SRS0=rHyZ=LM=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0D2C49361
	for <soc@archiver.kernel.org>; Fri, 18 Jun 2021 20:55:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0A45761264; Fri, 18 Jun 2021 20:55:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45DE60E09
	for <soc@kernel.org>; Fri, 18 Jun 2021 20:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B45DE60E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id n23so6400706wms.2
        for <soc@kernel.org>; Fri, 18 Jun 2021 13:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nu7i7hLOMrckKPqlCt5sNsYJcGzmceqdUWEuYkCyCyg=;
        b=HVFgLbvqQNXI6qA1sE6VpDEA4GddUHSB6CrLP4qKefQQSXz7W0Ds60omAmp8dIYzWd
         RtyqIEQ2vGMs49bTn+D+djIxm1wpBVX8S1g3HxRCh4Q4y0Fo/4+mS13GxyqbjGdNV45k
         ZDr80L0ZCnDnnGgMclEu8CzEQPo00f/Lgpn/tYLCML8HoMtdqlD+rQsWjGjTj3stoIga
         +TlDXRJhI79hfWcmRVS41GOl0fnRkmCijWNQatXqHszA8Cu8elI2MiwVGlX1xk7uiTaU
         BzANaHT9jvyKszDwr7pPGlKqdtGezM5AJg99C/Hft/5I/NkF1o2vs3+T3k67Ijh8w6nW
         X4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nu7i7hLOMrckKPqlCt5sNsYJcGzmceqdUWEuYkCyCyg=;
        b=l0kQ4EMhNAtS0UO6R+j3gN/VOxHOrV/UBC4tVLA8X5YyK7XIzN4HsEGVoS77hsmlPW
         M5B2R6ikBf5/dZv41cWX80jzzHsQ4NFN818h7ylZVDePxdT2SsT5l9FUSBF27AOWpGoG
         7QPJDYXviLlSp4fm3Gd+lz/7p1e0RyCPWz42mri8YuPywjR5Fysu7zgyTKCj9q07MsnO
         2elDNWp6nCAl0yR+WLmrbUKodZuAMIGb9VLOE0YTjR8zMo3tosC9kVVfOd8vixwguaCP
         nK8N2icXkXdJFHMYk9kuwOkmMD3IAZnOUxmMVObyfIHa/GHeOQCRPtzIkIlQ5gbUcgPR
         U18Q==
X-Gm-Message-State: AOAM530bmmj5tlMj/BzqhsKBPi29LNH4/3fCx+O86rrK4ZEnIu5Yluuz
	eRmSBdTB3GmOmASlKPPafJWiLQ==
X-Google-Smtp-Source: ABdhPJyUSyW4TuFB1EWQs4HKnLWcAB4ImpT6brXRKzrXolm5W20JLasuhMVSS3TqF2YW4sXrOe3zeQ==
X-Received: by 2002:a05:600c:282:: with SMTP id 2mr13775691wmk.98.1624049742338;
        Fri, 18 Jun 2021 13:55:42 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j12sm9745476wrt.69.2021.06.18.13.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:55:42 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	linus.walleij@linaro.org,
	olof@lixom.net,
	robh+dt@kernel.org,
	soc@kernel.org,
	ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 2/5] dt-bindings: add vendor prefix for edimax
Date: Fri, 18 Jun 2021 20:55:30 +0000
Message-Id: <20210618205533.1527384-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618205533.1527384-1-clabbe@baylibre.com>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for EDIMAX Technology Co., Ltd (https://www.edimax.com/)

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ed1769310f0d..800d0536be75 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -333,6 +333,8 @@ patternProperties:
     description: EBV Elektronik
   "^eckelmann,.*":
     description: Eckelmann AG
+  "^edimax,.*":
+    description: EDIMAX Technology Co., Ltd
   "^edt,.*":
     description: Emerging Display Technologies
   "^eeti,.*":
-- 
2.31.1

