Return-Path: <SRS0=dBqm=FF=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC46EC64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 13:43:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 782F72080A; Tue,  1 Dec 2020 13:43:47 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CA2620770
	for <soc@kernel.org>; Tue,  1 Dec 2020 13:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="RM1NldzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CA2620770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pf1-f193.google.com with SMTP id e13so1093844pfj.3
        for <soc@kernel.org>; Tue, 01 Dec 2020 05:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TdRqXYI9+LXautyFSgQZPVbiKxi/AYNw4/5pXTCk/R4=;
        b=RM1NldzBUV9eilnHZx/H3MAmxMfGI28r9EeIMlH6hqjZCvYEFhQy3qUQw11icYoss1
         FMw9JD/wlHbe5sr6+x8tAyfmla93e6MUxcZLwvjqWsmfCsGIfJ2Ch0E6O+eklS6yZzTR
         4gzxI2q6rs+2PS7LC3nZvBkN/Aa69HTvyKO7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TdRqXYI9+LXautyFSgQZPVbiKxi/AYNw4/5pXTCk/R4=;
        b=DgmGsOhrzkPaCN1CnQyV7lIeh1qortoIO6GGwkyHhLe5a5IQN+HTqMKbmgRF9D+xwh
         zdFcZNMz/iNbcZFznN+FbB+G1T0SjZ5+iix45alOQiQssQUB/9WDcfbAtcRHpdLYFZPm
         pSXnJ0jA1xECEpCyM8gwOKtwkzAQJZxR10Yk09l4M+rAus8PYxUSSC+Xa6ZqKepkY4DF
         sP5rVtsoRXYnKA/pPeusoaWpVZBX74t72eSjmFBurEzv04UC0hfSdCGq8aoUOmZ3vDMI
         Ya+/HhEsk754SA+/xp4SGDvR8Vgfw80IkG+5vs18RE1Fq/7JnaOaCwvox7duTkQ0c07O
         vmmQ==
X-Gm-Message-State: AOAM530varESrgOI5SK9E0fQ9X9H9lmKqcdtuKxsEsTouZI4Fvs5fiwZ
	Jf3YPb26bewjZMGS/2TFSToY9A==
X-Google-Smtp-Source: ABdhPJzTIgKg7pAUw9IZNPEUcFY3ziV2gQbl96vChMSNwAgbfi0peMLDJMiAe0RBB4RvEnGDI/f/VQ==
X-Received: by 2002:a63:f20:: with SMTP id e32mr2301093pgl.130.1606830226259;
        Tue, 01 Dec 2020 05:43:46 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:43:45 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	olof@lixom.net,
	arnd@arndb.de,
	robh@kernel.org,
	w@1wt.eu,
	daniel@0x0f.com
Subject: [PATCH v2 03/10] dt-bindings: mstar: Add Honestar SSD201_HT_V2 to mstar boards
Date: Tue,  1 Dec 2020 22:43:23 +0900
Message-Id: <20201201134330.3037007-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Honestar SSD201_HT_V2 is a full size devkit for the SigmaStar
SSD201 or SSD202D (they are pin compatible).

Currently only the SSD202D version is supported as that's the one
I have.

Link: https://linux-chenxing.org/infinity2/ssd201_ht_v2/
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/arm/mstar/mstar.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
index 7c787405bb2f..61d08c473eb8 100644
--- a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
+++ b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
@@ -20,6 +20,12 @@ properties:
               - thingyjp,breadbee-crust # thingy.jp BreadBee Crust
           - const: mstar,infinity
 
+      - description: infinity2m boards
+        items:
+          - enum:
+              - honestar,ssd201htv2 # Honestar SSD201_HT_V2 devkit
+          - const: mstar,infinity2m
+
       - description: infinity3 boards
         items:
           - enum:
-- 
2.29.2

