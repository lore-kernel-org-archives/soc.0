Return-Path: <SRS0=5mch=JO=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F4CC433B4
	for <soc@archiver.kernel.org>; Sat, 17 Apr 2021 01:11:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6329B6115B; Sat, 17 Apr 2021 01:11:33 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE11E600D4
	for <soc@kernel.org>; Sat, 17 Apr 2021 01:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE11E600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pj1-f53.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso10294792pjg.2
        for <soc@kernel.org>; Fri, 16 Apr 2021 18:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IpFNR7GakxyWW4TgxZZHx0a179MD/+kz0HEu0bWO0a8=;
        b=Po04f5sBLq7CyI8NVDbw/oRJPwJrkwmlN5bP8ByR58YDJv+L9Grp4W25XVsVqoX50U
         VAfoQJEiLxxgSS6cIDQv3YuoH2WxogF9nVU7CRgkamzQj1t7F7C1M5UWw+55cn3fLuQT
         BOgHL49GK0Zg7IzYDsct+zh1egbo8TNUa+3Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IpFNR7GakxyWW4TgxZZHx0a179MD/+kz0HEu0bWO0a8=;
        b=gLSJ0b9MNIbKvGfETCYPANEGnXbKhuAZTCPW3fDkmzCcdOCaNOIFYqwPEH9rahwC5c
         28fq8d36qgXKQFpp4QxQO2p3njQ+NiBMpeZRDwPgd8TT/hRfif11lPv29NK/6Dyrd1Ge
         YCoRUWKkjIUDPuIq79cGJ3eJbaVS/4nKhg5xX3OiFObjoA7VKuHJ8Eah4eJdflwyvFil
         2+cJuXcQVG5bqXkSnVLihMM3mrIakFWpjupSoL+F6QFJcEgb03wKuhs8JVdUDnab+8oB
         ztt2CeKPVTTDZsiBfGnc7uZTk9HtipV/YCVpL6TKfX78wz/hoX4x/Q3oFsaz6wgrtiE5
         GqUA==
X-Gm-Message-State: AOAM533UBPg88QGj76yz8kFIDrBSJAZukqYb5+Z2aW9e4FRQRBEDJiTo
	Mocz83hT5kgE7Cj0n8mXw/ay2g==
X-Google-Smtp-Source: ABdhPJzbgyZPwNL7XTnTWHarGeS8Luqog9MeO9ogPU0obIFCDGmVAGgPhcXB6udRhP8Z5OWNJLE7Dg==
X-Received: by 2002:a17:90a:64c9:: with SMTP id i9mr12919746pjm.213.1618621892443;
        Fri, 16 Apr 2021 18:11:32 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id x17sm2181515pjr.0.2021.04.16.18.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 18:11:32 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	olof@lixom.net,
	arnd@kernel.org
Cc: w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add vendor prefix for M5Stack
Date: Sat, 17 Apr 2021 10:10:13 +0900
Message-Id: <20210417011015.2105280-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210417011015.2105280-1-daniel@0x0f.com>
References: <20210417011015.2105280-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M5Stack make various modules for STEM, Makers, IoT.
Their UnitV2 is based on a SigmaStar SSD202D SoC which
we already have some minimal support for so add a
prefix in preparation for UnitV2 board support.

Link: https://m5stack.com/
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f6064d84a424..7129fe3b9144 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -651,6 +651,8 @@ patternProperties:
     description: Liebherr-Werk Nenzing GmbH
   "^lxa,.*":
     description: Linux Automation GmbH
+  "^m5stack,.*":
+    description: M5Stack
   "^macnica,.*":
     description: Macnica Americas
   "^mantix,.*":
-- 
2.31.0

