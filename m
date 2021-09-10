Return-Path: <SRS0=7jOf=OA=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5740C43219
	for <soc@archiver.kernel.org>; Fri, 10 Sep 2021 19:03:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CEAE661206; Fri, 10 Sep 2021 19:03:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CD91611C3;
	Fri, 10 Sep 2021 19:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CD91611C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id g74so1899152wmg.5;
        Fri, 10 Sep 2021 12:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RGYm0fS3PLkHIJJr2lxucQs1ZqvDikYcAAG+vIZ2nzM=;
        b=WAGSmaaF5taUZLYkumxO+QBdUAszUeWCrGZREDQ0bwsTTg3bNeoLFDAyewofnHKrhi
         Y4iyGQs7uosEZWdV2FCQ1dUwkrx3VE+SK6b6uGMSOEJvIScooOdrluTES/N8OJBcnCdp
         2PfgyQvrw4CeHwarl23eTam5kcPABDkCTy0Z0LSdj6pNmvGbuZpNoO3C7nCRFKI09Mf6
         Wa6uQnnmGazgihsgdUZuu2ktR4nxNWPrn4x4kaN/RWXM8utfts21dsDfFc1D4uOKQhip
         xa94S1ejdSGEh+ysMJSwO6Eo8n70PdQ6BB6hOHHWwqMzOy78WmnpxLAoADPrEzXPaEMR
         4EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RGYm0fS3PLkHIJJr2lxucQs1ZqvDikYcAAG+vIZ2nzM=;
        b=JqferdHjZwLfOv6odVLYD94hn2/cFUqlJJ4EOdf/MlW3lv9ESEHwqZO23PwWX88URn
         FOR9tf0sT0YPrz+A90CVyz9aUZ5J91r8tBKdDMcxK8oYn9tOTLNLecy+b+4gXViBQ8ql
         anSNvzoqky/ShPpnA8QyeFxuqEPCrw331H0OZgj6cPr3a3HRUxfbVy8CZx3zFJexovrs
         yCJ/oLOmCNMX7yI7JGv7WVgDV/+6xzLuWAzzjZsE0RUcTb/GuBnA3yZDvk3YGUHNhaPr
         V0wNAYfaD5BW1o8kcByXu6XyVwTAd5ouOP/ro6KLfzLFmsF82CKR/3bxKicQR32wuS6l
         a2yA==
X-Gm-Message-State: AOAM533tcUUdLisDm+fkD6jKZ/2CI6+rBB2IwhNPOb7feh5sdB6/gMZP
	HRdssNwkXDHD4SCzRjzsSng=
X-Google-Smtp-Source: ABdhPJz8wEhimQ2HLHy2Evfr6g3vWa1/iO0LQdxwW/4nAF4WvKdf2FrFoNcd2vyO+oEYqvzGtF1lFQ==
X-Received: by 2002:a05:600c:a05:: with SMTP id z5mr9708351wmp.73.1631300626293;
        Fri, 10 Sep 2021 12:03:46 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
        by smtp.gmail.com with ESMTPSA id v28sm5487641wrv.93.2021.09.10.12.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 12:03:45 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>,
	Romain Perier <romain.perier@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: add vendor prefix for Wireless Tag
Date: Fri, 10 Sep 2021 21:03:21 +0200
Message-Id: <20210910190322.27058-4-romain.perier@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910190322.27058-1-romain.perier@gmail.com>
References: <20210910190322.27058-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a vendor prefix for wireless tag boards and SOMs.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a867f7102c35..b50d62dde7c5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -517,6 +517,8 @@ patternProperties:
     description: International Business Machines (IBM)
   "^icplus,.*":
     description: IC Plus Corp.
+  "^wirelesstag,.*":
+    description: Wireless Tag (qiming yunduan)
   "^idt,.*":
     description: Integrated Device Technologies, Inc.
   "^ifi,.*":
-- 
2.33.0

