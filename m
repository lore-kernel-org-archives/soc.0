Return-Path: <SRS0=5mch=JO=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D1CC433B4
	for <soc@archiver.kernel.org>; Sat, 17 Apr 2021 01:11:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BDFDD61166; Sat, 17 Apr 2021 01:11:35 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4819960233
	for <soc@kernel.org>; Sat, 17 Apr 2021 01:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4819960233
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pl1-f171.google.com with SMTP id z22so9726913plo.3
        for <soc@kernel.org>; Fri, 16 Apr 2021 18:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4iQwcrP76XND1KpyIIjDX5F1DM/jpRSnMhRHiRWy9PM=;
        b=RCfCbgPnnkU94wcgcgHR1NXnnA4O47bVddkwHUrbhp1OGyytop/9Ytgb+d03pVihIO
         siRltm4AWh7ojfhzZe/um38LkQ512SoRFO7wfiU9N6HvaoXdJ6YLagv4LzfDYZ5/uNww
         UkeZI0VdMDb/ERgJDSwqgD6vy6UCdf0AtcD5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4iQwcrP76XND1KpyIIjDX5F1DM/jpRSnMhRHiRWy9PM=;
        b=p4qKPawxr6UG0FKimNf2saFocMvMZMkYtFhhcg1qp8rH2F+3DULN1LKcVgGAljanAb
         QN60UlAxlV68jUNAfAmE94NNztqRa3pKo5JyEyuBY1ogJNslYRF0IfMwY7cHj0dQAqy2
         5iygTFf47fMzNqQ2dM5Znp1mbpduGWa0joMYY8GMODcVQvS3/2+q5Vhxb+UNQAJ68DWt
         yQH4E9Zw4Jp6JboA28vxpTc5fpAyiZfPqfraLlttofvXuRlt7uLuOYPxpqoSsc6gqZWj
         ACd1DKV246TKjobCF4LHQ+eVx4k1kDJNCipd9bjEnZ4MfK2M+cvDeg8fEOm5Ehx3no17
         ArLg==
X-Gm-Message-State: AOAM532OAwkc2yrlXYdYBVlvrVGPlvPWMKVBbbs0u6jMTlKQu2UEyzl6
	peu7ttjAJ3L10blAuPWadqOqfw==
X-Google-Smtp-Source: ABdhPJw84Vzs9qhqrr0aOVygyyA7rFMa7bvZYva6opSQkrgMOLDfLuoVbDm5vcw5kvXuoQ/h7sIZ3A==
X-Received: by 2002:a17:90a:db87:: with SMTP id h7mr12533861pjv.36.1618621894873;
        Fri, 16 Apr 2021 18:11:34 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id x17sm2181515pjr.0.2021.04.16.18.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 18:11:34 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: arm: mstar: Add compatible for M5Stack UnitV2
Date: Sat, 17 Apr 2021 10:10:14 +0900
Message-Id: <20210417011015.2105280-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210417011015.2105280-1-daniel@0x0f.com>
References: <20210417011015.2105280-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the M5Stack UnitV2 that is based on the
SigmaStar SSD202D (inifinity2m).

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/arm/mstar/mstar.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
index 61d08c473eb8..a316eef1b728 100644
--- a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
+++ b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
@@ -24,6 +24,7 @@ properties:
         items:
           - enum:
               - honestar,ssd201htv2 # Honestar SSD201_HT_V2 devkit
+              - m5stack,unitv2 # M5Stack UnitV2
           - const: mstar,infinity2m
 
       - description: infinity3 boards
-- 
2.31.0

