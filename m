Return-Path: <SRS0=iJAY=KM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1B3C43461
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 19:34:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E49D61263
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 19:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E49D61263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6KT0XtWa3erFcCkAVDRDwIO3RZIb6Gx9cjAsJ/hIE80=; b=ndYG2e3PRqy5qP73eMSQP5fPQ
	qXMKpWz8wdtCErKIFyn3tRO2EyZ2Z4MtsKRxsgENRtTyk7kCDWp4RgygvX7pJGgl268l4jmeXn3p6
	KE1+XzQ/ti9+O2tqTynz60mKjjttcas0/asdTuPJsyRK5K8YxWKP0Xg5okt+IES22k5nHMXXTx+HF
	gEAx+NGwhLKvun1Gf0KPclWRT5Zr4brntvs6ctei/SEUeqIgBBqTBzUxXLkMixXoHD9hQ2BV0H05I
	CgjOcrOdBHSgVkUXqQOBdkhdNGDCduSFZhcM72vr4ypLs7TREMlHIT4WcQGThtsBvv6k2ebRwMHad
	2n1EoFwEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liiyv-00FwsY-4t; Mon, 17 May 2021 19:32:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liiyV-00FwrB-Tt
 for linux-arm-kernel@desiato.infradead.org; Mon, 17 May 2021 19:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=QYAhGHTcrzLvh1GZzozNj3ujeM2dW6tSmE2iihma+d8=; b=rsMxpWUoWk4kDuPt115MEBXDo0
 s7wNcmC69Clqiis6x05XHTgc6mItB85a+I67pUJkN5LPUy9ZrTyfA5F1YtV2kVYcLfq+bowGDOWIC
 c3nDMzyKf5Y+b9NJGVAxmia2fkEqmF+nNNEaWRyHAm1bexUzzrU4iJFLkpAY2zjbIv8sl6pPwCb0G
 DyDr5rrNS7bcxJuqk2jHdugERlbiaV9LnTFm5BrWW8j0jraFT3GOO/AP/EOgfRjlxofMn/mxQZULF
 E4zs9MBuCFyiokIkTmDc/aG0n3ODosBuSVhGdWu962h65f9pwALyT1WcomiOET2zg/aPI6quF7EUB
 IUnq2/4A==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liiyS-00E5nv-VY
 for linux-arm-kernel@lists.infradead.org; Mon, 17 May 2021 19:32:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id x8so7611682wrq.9
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 17 May 2021 12:32:20 -0700 (PDT)
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
 b=JAoDeX0/RK9wGQYJA1dA4hHA12B8ALTqnhOjRkFNsilw+BO2VlrF/sgDOUoOLzv6rb
 xst92FntGHQWmeVwrc4UTEzpzkuuOJ0wsaJfqJDvrTDwCLqKw+ZReYRNEmU4SRcAkgja
 rUHUs5X+/D29V5rwcCjiFW8DN8ifZpXtNqDwKOhSXpd4da2waQUvmScLMsLmSSq7LiND
 YjUil1/FlZHSeIurXW+rdhQtuLLqUhBiUR/i7HYAezjcJ4ORl5ZyJvnYyDFObQlzQ78X
 rlqxI8KHXtCQ9Z1FxYKxd/f7EMh6KlplyuvuJxXv3kaMBXL3stx25/L0LfOOzvbU3R+s
 90wA==
X-Gm-Message-State: AOAM531TPwbxXHpnaRi6mWRy/EQro6gQ3yqxCBBvQNvLJEaOXhLNT00W
 tXf09rSlrOoS5yb96BYNtZZfxQ==
X-Google-Smtp-Source: ABdhPJzwfsiOYNUSQ5COtoFgPLUXMY8sYNlATGSr/Q/cSZg92rBtQr8f4YWeCUtWRIJT+8Bln1VMzQ==
X-Received: by 2002:adf:cf09:: with SMTP id o9mr1552357wrj.334.1621279939607; 
 Mon, 17 May 2021 12:32:19 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e10sm18928907wrw.20.2021.05.17.12.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 12:32:19 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, linus.walleij@linaro.org, olof@lixom.net,
 robh+dt@kernel.org, soc@kernel.org, ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 3/5] dt-bindings: add vendor prefix for ssi
Date: Mon, 17 May 2021 19:32:03 +0000
Message-ID: <20210517193205.691147-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517193205.691147-1-clabbe@baylibre.com>
References: <20210517193205.691147-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_123221_031698_8CF61F6A 
X-CRM114-Status: GOOD (  10.29  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210517193203.y2fHCAtijbVAqG3N9iBmk3NWuKUooFcmwoItpTX4TsU@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
