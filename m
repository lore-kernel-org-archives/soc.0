Return-Path: <SRS0=/KAC=J7=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFA8C43600
	for <soc@archiver.kernel.org>; Tue,  4 May 2021 19:35:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6BACA613E4; Tue,  4 May 2021 19:35:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9C96613D2
	for <soc@kernel.org>; Tue,  4 May 2021 19:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9C96613D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id v12so10622346wrq.6
        for <soc@kernel.org>; Tue, 04 May 2021 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+ZZN5MzC4HBwyYsz5oFVkaryjGRKyHc1OurMaO1on98=;
        b=OBDSTLK6TS2hxfIMGeuoLflPHA8AXiJCws1GkQohO8FWzgiFXpnoOVA7LyH3XihoQD
         McGE73KZovVg+hDb6hHPBEfC0l+0cb+VmSfrUtYGzgfXuw1qY4PZE5LYo72G8jBrdTVT
         npV3ELRPB4dx5YS9Swt3WDJXQ0k49TZFMYvOYCXnVGcW+j8DZw6LhZPyarkTUGFQd57C
         NUh5XLFXVq/mm20Wg7lnK15Fqsv1tMSdP36pTZD/fuh6KxhKTOY/Ifk6a2eIpvqr0E8I
         lYAI3fY4WLhfxreKW3TPXuTADjnPn5FkHn+mDtHOEg80Ihe4mlHhGBfSlRVR1F6TY2CL
         2JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ZZN5MzC4HBwyYsz5oFVkaryjGRKyHc1OurMaO1on98=;
        b=ag4KIf0xDFYnEBaPi/qHlU6ZKcRrN/BgikRUDnOTKVx5YCi+ieoRamFn32AGHqIAmC
         sLTL2BLyzctxOxntcHJfFzWV1AAALs5N4T57q8s7d7dcWGbGIPeNb3VX/llZUrUvohG5
         zmqXnyGszAWWDDvKdnrJVxqFrlgQbaaklcDyfeSNCUK1qp+pRUFpOAPj4NLkksRIMNJa
         PQmmRfk6exgR1lbf+nN3dPd/n/rQU2wjqM9JuI8nUA7tuX3YA/BKLXv9Zzqd6SMPvfK3
         FKuSve8BW/Ra4ba4lCMf7Ii0KfcBrKUuxU+CPusnlMFSgZO4KWhQf2+sWagnFpCcJMeC
         90Kw==
X-Gm-Message-State: AOAM530HiEO/vr0FfOu6u1NFDkxBQoHDpoGiaYQO0RgsB+U1Vi+ud08t
	E1ynTTcIoz118C7W7pVfC15aCQ==
X-Google-Smtp-Source: ABdhPJykddxppzrVNYK7b3KfPVPjx6fcuKA+9RNWbVt10xXoC/wxUepowdxvXMso5j9bqnG0wA/9lg==
X-Received: by 2002:a05:6000:1cc:: with SMTP id t12mr34157181wrx.156.1620156906534;
        Tue, 04 May 2021 12:35:06 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x8sm17072136wru.70.2021.05.04.12.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 12:35:06 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	kaloz@openwrt.org,
	khalasa@piap.pl,
	linusw@kernel.org,
	linux@armlinux.org.uk,
	olof@lixom.net,
	robh+dt@kernel.org,
	soc@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 3/5] dt-bindings: add vendor prefix for welltech
Date: Tue,  4 May 2021 19:34:55 +0000
Message-Id: <20210504193457.4008384-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504193457.4008384-1-clabbe@baylibre.com>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add vendor prefix for Welltech computer Co Ld.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 71ccbe682e11..f9648b37da12 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1248,6 +1248,8 @@ patternProperties:
     description: Western Digital Corp.
   "^we,.*":
     description: Würth Elektronik GmbH.
+  "^welltech,.*":
+    description: Welltech Computer Co., Limited.
   "^wetek,.*":
     description: WeTek Electronics, limited.
   "^wexler,.*":
-- 
2.26.3

