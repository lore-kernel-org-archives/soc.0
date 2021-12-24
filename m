Return-Path: <SRS0=cSeM=RJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8E0C433F5
	for <soc@archiver.kernel.org>; Fri, 24 Dec 2021 11:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4AC47C36AEA; Fri, 24 Dec 2021 11:11:37 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EAF2C36AEC
	for <soc@kernel.org>; Fri, 24 Dec 2021 11:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8EAF2C36AEC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 79BA6402D7
	for <soc@kernel.org>; Fri, 24 Dec 2021 11:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1640344289;
	bh=kD4Oxt4jcQYvgn3l02cM0PdutVIC1JUiDrLy60gpB1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=vAGhcAr9E3OuoJoGYw0bJN7AnWNb/8Rn0mImK697imUlb4rFfaNwpp1QZWdrvViOr
	 8+QpUSU0sIhpgs3G4xDqR9dxQZJezbeHdB94l1DIjFbIi1M1JZXyVFcY3zqD2XmIp0
	 N7K0qnY2V0lRcemogRBFqIoRDIz/60/u0ch5RTHtdtTnneEydMuXiSeth2KMer9fmY
	 94t5Xy7s9GCEyyBbWEtjtHt4ISzQklyiCml0HA/EL6MVW0/tTVx8pbkxqF3+X5x1Rg
	 HFURGfwB8cW1u7wRrq/Lm8YMl5YR2jfHVunpkn5Q/YN8uD/0mkFbr/MQ3Dw4YmSai0
	 1oEKxqW35+tTA==
Received: by mail-lf1-f71.google.com with SMTP id bq6-20020a056512150600b0041bf41f5437so2776628lfb.17
        for <soc@kernel.org>; Fri, 24 Dec 2021 03:11:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kD4Oxt4jcQYvgn3l02cM0PdutVIC1JUiDrLy60gpB1w=;
        b=yd+Ygu7U7feOzdzyDczstT57uMpbDefinOqPjo5x9GeOpYFcU2c8+4AePH8D9Xcsv6
         u5e7XvxYGeoutkMeOu+Pj73nZ+DSgW+li71TLhHF5dhLKAuZfRpYPCiv81irCn2jqws5
         WHDD3rnF5QmtX/GEt4v6IITMzW9mlcHPSy6FWIZVCLAvgKPGzGhM//yCx0vDqgMVvXcq
         OSf3ptKTxuQnBsFrNUzGvyVoDCMf9IM6GFnn0dBI0gL5eCP/U3DoXIA+eHbq6KnlmGlt
         5ZCEXeM/qyGvn2KzCH8MBiV2dDQrm06dj/ZrvSWfajdnUdivHOPUoZM86T/4w9EQaWVh
         lrEg==
X-Gm-Message-State: AOAM531fKsquta8W79JSWNprqxjn7ICYpeZ6FqxfXdsl/DDlDmGlMGkc
	RbopDn7eRfZIphvHvH4NSg5amN05m+U7INYbdrTcDeE4011QaAd4a9zjH05CReiCtZBRkGGx/+V
	mpFlHA0mnpdbZ3JzS7ePi5NM=
X-Received: by 2002:a2e:9253:: with SMTP id v19mr4468029ljg.74.1640344288832;
        Fri, 24 Dec 2021 03:11:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTfs7N22KGq3U7wkuIP6XzvggWdsbNzZIU0QA+V5Zqphz+iG9QPpXvadTM+EjZ9GS+e1xNVg==
X-Received: by 2002:a2e:9253:: with SMTP id v19mr4468014ljg.74.1640344288550;
        Fri, 24 Dec 2021 03:11:28 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y36sm773870lfa.75.2021.12.24.03.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 03:11:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL 2/2] memory: omap: drivers for v5.17
Date: Fri, 24 Dec 2021 12:11:24 +0100
Message-Id: <20211224111124.6097-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211224111124.6097-1-krzysztof.kozlowski@canonical.com>
References: <20211224111124.6097-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

Separate topic branch for omap-gpmc driver. This includes changes to
mtd-nand-omap2 driver (acked by Miquel) *which will conflict NAND tree*:

1. The "of_device_id omap_nand_ids" is moved to header
   ../platform_data/mtd-nand-omap2.h.
2. New compatible is added to above "of_device_id omap_nand_ids".

One way to avoid pushing this conflict to Linus, would be if Miquel would
actually pull this request instead of soc tree.

Proper resolution looks like:
----------------------------------------------------------------
diff --git a/include/linux/platform_data/mtd-nand-omap2.h b/include/linux/platform_data/mtd-nand-omap2.h
index 92f011805ad4..8c2f1f185353 100644
--- a/include/linux/platform_data/mtd-nand-omap2.h
+++ b/include/linux/platform_data/mtd-nand-omap2.h
@@ -65,6 +65,7 @@ struct gpmc_nand_regs {
 
 static const struct of_device_id omap_nand_ids[] = {
 	{ .compatible = "ti,omap2-nand", },
+	{ .compatible = "ti,am64-nand", },
 	{},
 };
----------------------------------------------------------------

Best regards,
Krzysztof


The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-omap-5.17

for you to fetch changes up to dbcb124acebd8148e9e858a231f1798956dd3ca6:

  mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3 (2021-12-22 16:51:43 +0100)

----------------------------------------------------------------
Memory controller drivers for v5.14 - OMAP GPMC

1. Add support for AM64 SoC.
2. Minor improvement: use platform_get_irq().

----------------------------------------------------------------
Lad Prabhakar (1):
      memory: omap-gpmc: Use platform_get_irq() to get the interrupt

Roger Quadros (4):
      dt-bindings: memory-controllers: ti,gpmc: Add compatible for AM64
      memory: omap-gpmc: Add support for GPMC on AM64 SoC
      memory: omap-gpmc: Use a compatible match table when checking for NAND controller
      mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3

 .../bindings/memory-controllers/ti,gpmc.yaml       | 23 +++++++++-
 drivers/memory/omap-gpmc.c                         | 50 ++++++++++++++--------
 drivers/mtd/nand/raw/Kconfig                       |  1 +
 drivers/mtd/nand/raw/omap2.c                       |  5 +--
 include/linux/platform_data/mtd-nand-omap2.h       |  9 +++-
 5 files changed, 65 insertions(+), 23 deletions(-)
