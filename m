Return-Path: <SRS0=sRvu=KM=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF045C43462
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 19:32:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AB39561350; Mon, 17 May 2021 19:32:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEE4C61263
	for <soc@kernel.org>; Mon, 17 May 2021 19:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEE4C61263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wr1-f41.google.com with SMTP id r12so7645458wrp.1
        for <soc@kernel.org>; Mon, 17 May 2021 12:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QYAhGHTcrzLvh1GZzozNj3ujeM2dW6tSmE2iihma+d8=;
        b=qTnHP7oK4UhH+1Xi16NmsUH5ieKLYYo6wTQJtL2qfKcXye1il5xay4sjiWOSZYnL4H
         FJaPZHygUv4HQgaOUgMmzge4z9aelCHvYnc4nHkONjQRdQgmxnwPo7T4VpWer3Oc5l8K
         ZPqMmrmuJiDUhMha24j6dkEvGziWRUuAJJI1Ccbn083k7g2ciiB7RBRHj6yEwXECfq2e
         LM7uVr9MJBmYAOkGWeMqEh3bCGgBdZsesAmru4Qar3dsGcgnyanpNZ+oHrQLjhMk7uea
         M0woTdyU+o9UvLyMUgms4YAhJ7iQTOtbHGgLafLhZRmMSIrga7zrFUtpbpLXy0LXEImX
         QQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QYAhGHTcrzLvh1GZzozNj3ujeM2dW6tSmE2iihma+d8=;
        b=gSFN7bOAE1cBx/0FwgNjN5fg/bZwm11wj8CqMgUxCNGosyyejFOHWCWzitwSpsXHlz
         amUf4244CjbG6ZiHH5y+ssZT2J0EpC3zXeh3HPXFftZEG2HA0esyrqqIVs05nNe2Qy3M
         Txn1c/JkNZVRe6MV96Y546tWCyIVcvxC6QQ2sMja6LWq6xFv2IXWsv6bm3rqHjmaiRny
         3qoJmEeELb1LNrnpvmf+2RX7odTEwy9MzHtGRqhq9BgsJCRB9dmOOyppE+aYMbG7jfUB
         P+ZNc+uQrR5u8z0lD+UqOAWecd5jxlnaryxa3S17QIpwCs4vaTQcUJeTXwkPrnXPUdQk
         rq7Q==
X-Gm-Message-State: AOAM531d1H/FyB8GtHmJBfcGcM91a6YfTZKb/kM6Qpfr3vs4CFUcmhAz
	c13tjUXHoHcrXAc1CcxGHD3Q1A==
X-Google-Smtp-Source: ABdhPJzwfsiOYNUSQ5COtoFgPLUXMY8sYNlATGSr/Q/cSZg92rBtQr8f4YWeCUtWRIJT+8Bln1VMzQ==
X-Received: by 2002:adf:cf09:: with SMTP id o9mr1552357wrj.334.1621279939607;
        Mon, 17 May 2021 12:32:19 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e10sm18928907wrw.20.2021.05.17.12.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 12:32:19 -0700 (PDT)
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
Subject: [PATCH 3/5] dt-bindings: add vendor prefix for ssi
Date: Mon, 17 May 2021 19:32:03 +0000
Message-Id: <20210517193205.691147-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517193205.691147-1-clabbe@baylibre.com>
References: <20210517193205.691147-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for SSI Computer Corp (https://www.ssi.com.tw/)

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 003f6354db04..828ddf7fdbed 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1084,6 +1084,8 @@ patternProperties:
     description: Spansion Inc.
   "^sprd,.*":
     description: Spreadtrum Communications Inc.
+  "^ssi,.*":
+    description: SSI Computer Corp
   "^sst,.*":
     description: Silicon Storage Technology, Inc.
   "^sstar,.*":
-- 
2.26.3

