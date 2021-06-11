Return-Path: <SRS0=FjKb=LF=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D6CC48BE5
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 14:07:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E67F76140C; Fri, 11 Jun 2021 14:07:06 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B71E613FA
	for <soc@kernel.org>; Fri, 11 Jun 2021 14:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B71E613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lrhoP-00088a-4y
	for soc@kernel.org; Fri, 11 Jun 2021 14:07:05 +0000
Received: by mail-wr1-f70.google.com with SMTP id s8-20020adff8080000b0290114e1eeb8c6so2677550wrp.23
        for <soc@kernel.org>; Fri, 11 Jun 2021 07:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mqsnDnK7H+bSvfKugt2B4WpV7d9OZN/SZMGSsmxI6wU=;
        b=oXR/CsGwcZ6+BHcVsw/8jYsMKzb1T61Yrdt8fjToXxydk6pv6zdcJzy/Ps+af1vL10
         /YxY0i6W/DSm78ykkB+QCrNDx2kvzf3YAeTjZ0jOb3vp/oa0RcQHgVWrltcu9bjzbKca
         fhCwON3UwZt6VMm+2J66yPxjfKoLACDSM3vSofPSgVcPaNr6gIXMWLH927SUWdNBz+xB
         Ky+pkQaddSHawjBj6Z4xOKcNb6MrkB44/dnnzgr26gljzVmhD1COFRIXBCKH6e/OLjL5
         EmMsM5LzKmqheYV2Pc0lqNrJB0HIEt7xzeySNceh9r+9acZmGsVgBvO/6IcS03YhAHOg
         ycrQ==
X-Gm-Message-State: AOAM530R5zMGYD5swFPVw8mSBPzayWtyxCLy1s9iecIQLE94gM0JWq2p
	nIj/NV1EkTeTO2lUrozUO7AjqO+txZy0iWtGY4NNn0Pv8+S3t49OnKwWdHn2ZpQUIQ3cg2Z9zUH
	d5aR9jehs93tuFPbPrc2nszU=
X-Received: by 2002:a05:600c:3b23:: with SMTP id m35mr20872888wms.185.1623420424474;
        Fri, 11 Jun 2021 07:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW0V9/o7YdR45rEYnx1wo71TwuMvkOq+3bkmhazImZbtBzmFJpq+VyYMzaUqGgT7eBeJZfOQ==
X-Received: by 2002:a05:600c:3b23:: with SMTP id m35mr20872866wms.185.1623420424343;
        Fri, 11 Jun 2021 07:07:04 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id j34sm12055035wms.19.2021.06.11.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 07:07:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL 2/2] memory: pl353-smc for v5.14
Date: Fri, 11 Jun 2021 16:06:59 +0200
Message-Id: <20210611140659.61980-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210611140659.61980-1-krzysztof.kozlowski@canonical.com>
References: <20210611140659.61980-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Dedicated branch for pl353-smc driver changes.

Best regards,
Krzysztof


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-pl353-5.14

for you to fetch changes up to d3d0e1e857110a2f8147b1aa3a045b1fccc1e7c3:

  dt-binding: memory: pl353-smc: Convert to yaml (2021-06-10 23:09:05 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.14 - PL353

Bigger work around ARM Primecell PL35x SMC memory controller driver by
Miquel Raynal built on previous series from Naga Sureshkumar Relli.

This includes bindings cleanup and correction, converting these to
dtschema and several cleanyps in pl353-smc driver.

----------------------------------------------------------------
Miquel Raynal (14):
      dt-binding: memory: pl353-smc: Rephrase the binding
      dt-binding: memory: pl353-smc: Document the range property
      dt-binding: memory: pl353-smc: Drop the partitioning section
      dt-binding: memory: pl353-smc: Describe the child reg property
      dt-binding: memory: pl353-smc: Fix the example syntax and style
      dt-binding: memory: pl353-smc: Drop unsupported nodes from the example
      dt-binding: memory: pl353-smc: Fix the NAND controller node in the example
      memory: pl353-smc: Fix style
      memory: pl353-smc: Rename goto labels
      memory: pl353-smc: Let lower level controller drivers handle inits
      memory: pl353-smc: Avoid useless acronyms in descriptions
      memory: pl353-smc: Declare variables following a reverse christmas tree order
      MAINTAINERS: Add PL353 SMC entry
      dt-binding: memory: pl353-smc: Convert to yaml

 .../bindings/memory-controllers/arm,pl353-smc.yaml | 131 +++++++++
 .../bindings/memory-controllers/pl353-smc.txt      |  47 ---
 MAINTAINERS                                        |   8 +
 drivers/memory/pl353-smc.c                         | 314 +--------------------
 include/linux/pl353-smc.h                          |  30 --
 5 files changed, 149 insertions(+), 381 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
 delete mode 100644 include/linux/pl353-smc.h
