Return-Path: <SRS0=rHyZ=LM=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999FFC48BDF
	for <soc@archiver.kernel.org>; Fri, 18 Jun 2021 20:55:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7979F613ED; Fri, 18 Jun 2021 20:55:45 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7873F60E09
	for <soc@kernel.org>; Fri, 18 Jun 2021 20:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7873F60E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id i94so12102792wri.4
        for <soc@kernel.org>; Fri, 18 Jun 2021 13:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jRLam3ZYflZLVyyutvsIpS6o5/Y7d41E9E4JTAN/wTs=;
        b=gWB6youcrGgkWbJ8AIjkohQ82VUYjFUB3tVCiTMNnPvJVfqZnUw8Zf+NjBvaek04OF
         DaMAja3dMKukQuasVORhFiIRkDUkoXk8la/p2H/rsZQ29LK6lXmene7qa4WP5e4kyw47
         uFgYSvv3zqaqnMhwvdASbSSgYpNLQMHqxl0r5NUPezi9AkJabcDLsgYgT6xauMJCHiw1
         gNRcbeT3GW+4BI/c89H4gjNnpVr0l2C6vg/JVlzEXLL8PwsE2xemRvmm6GO5uRsBpopr
         YlWb4l4Av9h7kKCQqT/gJWq3v7vWGE7gyolC5MzSylgZYAN/UcOZGQ7ErFkOOnCBIwCb
         H8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jRLam3ZYflZLVyyutvsIpS6o5/Y7d41E9E4JTAN/wTs=;
        b=g3keGySBD+d/RYf1Tb60phrD3J1tYxCWQWFHSZuhFo8nU4pt6cdwV05XEdczHnYbNN
         Q0Uzv93dau+hTi4E2InSjmD1ygmia7stdrlOT1x+hxQoMxLJbg8AfE0z7iivJl5YEffc
         U40fLewkkqcCpQyOe95c348ak72yl7VRaNcWKc6WFPJsqCzzuDXKdu7DelO7Kr28ObsD
         uEY8SPcApEHEUORmzJl7Avvc4OdP/NnuKpI36sP7lgR0cc/JiW26ofi+elTMb6voh+Qc
         L2TRrZGaqsxRYwHz4THOy0g7BLAwc+ZHN3HXjL+CJSAUplCC9Cp+MnPxIVHwias0G9/I
         8N2Q==
X-Gm-Message-State: AOAM532e4zZtKvGqdMPNTbMljdPEgaxQ86rkDMLI3NARCRDpYp7xGlCY
	L9gWVCxWJR/pBnb7GY7q2WwShQ==
X-Google-Smtp-Source: ABdhPJwddHi1wiHWVq/27aORb5P87HAYyN2nQPoE9B42oXNCu4EJgWhDBuV2lIRN+TzjLsnmLMLY8A==
X-Received: by 2002:adf:d229:: with SMTP id k9mr14670400wrh.245.1624049743172;
        Fri, 18 Jun 2021 13:55:43 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j12sm9745476wrt.69.2021.06.18.13.55.42
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
Subject: [PATCH v2 3/5] dt-bindings: add vendor prefix for ssi
Date: Fri, 18 Jun 2021 20:55:31 +0000
Message-Id: <20210618205533.1527384-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618205533.1527384-1-clabbe@baylibre.com>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for SSI Computer Corp (https://www.ssi.com.tw/)

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 800d0536be75..6d70d6ba60a0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1090,6 +1090,8 @@ patternProperties:
     description: Spansion Inc.
   "^sprd,.*":
     description: Spreadtrum Communications Inc.
+  "^ssi,.*":
+    description: SSI Computer Corp
   "^sst,.*":
     description: Silicon Storage Technology, Inc.
   "^sstar,.*":
-- 
2.31.1

