Return-Path: <SRS0=FjKb=LF=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC39BC48BD1
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 14:07:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C04F461400; Fri, 11 Jun 2021 14:07:05 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 658E3613C8
	for <soc@kernel.org>; Fri, 11 Jun 2021 14:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 658E3613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wm1-f69.google.com ([209.85.128.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lrhoN-00086x-Qj
	for soc@kernel.org; Fri, 11 Jun 2021 14:07:03 +0000
Received: by mail-wm1-f69.google.com with SMTP id 18-20020a05600c0252b029019a0ce35d36so5446152wmj.4
        for <soc@kernel.org>; Fri, 11 Jun 2021 07:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fIYGF4kspNC+k/efmO1vZxXOhwddBi7dkMQEKTd7Cos=;
        b=X15+j6eMIetIoNJl+cGC3+cC5PqAwaCj38BtQM5hCI441F8NNvkkLkM+tW4ELcSRzU
         DCjsT2bt7beHlsSwXJ3ttpRCq+JekHDnBbZeIWFLoorgWn90tAbFplXVrz20fyImH5v+
         GuvzVx9yIqNDk9Hx7VUi5YlsWJDuiPczE02oGsUie/yxlhRaTkraJwI6QRn1zZnU1Zfi
         O4Pbm4aVVmiTBwyzNUYwSfSmF9/E+4g8dPm8POXXlssvIpxXGM3vsLFVenZFqc/5eSPm
         tFDU8VzD7mur3kWqXdrmOHds9yAnbLRQJufdWFP5F0MUs42i5al198JWk4w1VbSLkLlf
         IDSA==
X-Gm-Message-State: AOAM530dsVd+xYL7gKcsx9tl83Wq5IFtUT5y1kb2Ol6Fq7nDMpDWgJlN
	rQcb51mAXxFjmuX+sJ9x6/8+1zjfz+4ONf0gGC2R6e7snmNbMWuGpJnsffIrAvSnMiBJ9PX5ySJ
	7e8twb3kFBkZ1O3ayuIftf3w=
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr4217651wmh.186.1623420423075;
        Fri, 11 Jun 2021 07:07:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGufQ334fV4fgNhOR7AObH0Gf2OKOTDGDGEm9J4z1JDqAo/np5E4xxwSOZnijrJoyx734R9Q==
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr4217615wmh.186.1623420422784;
        Fri, 11 Jun 2021 07:07:02 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id j34sm12055035wms.19.2021.06.11.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 07:07:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] memory: drivers for v5.14
Date: Fri, 11 Jun 2021 16:06:58 +0200
Message-Id: <20210611140659.61980-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This branch contains one change for pl353-smc driver, so might create merge
with my second pull request here - tags/memory-controller-drv-pl353-5.14.

I did not experience conflict and git shows the merge as:

diff --cc drivers/memory/pl353-smc.c
index b0b251bb207f,925d856663ac..f84b98278745
--- a/drivers/memory/pl353-smc.c
+++ b/drivers/memory/pl353-smc.c
@@@ -407,14 -116,10 +116,11 @@@ static int pl353_smc_probe(struct amba_
                break;
        }
        if (!match) {
 +              err = -ENODEV;
                dev_err(&adev->dev, "no matching children\n");
-               goto out_clk_disable;
+               goto disable_mem_clk;
        }
  
-       init = match->data;
-       if (init)
-               init(adev, child);
        of_platform_device_create(child, NULL, &adev->dev);
  
        return 0;


Best regards,
Krzysztof


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.14

for you to fetch changes up to 729a611e6f53da00ed62a181f2d5d2bcf22d74d1:

  memory: emif: remove unused frequency and voltage notifiers (2021-06-10 09:24:46 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.14

Several small fixes and cleanups for stm32, atmel, pl353, renesas-rpc,
TI emif and fsl_ifc.

----------------------------------------------------------------
Krzysztof Kozlowski (7):
      memory: stm32-fmc2-ebi: add missing of_node_put for loop iteration
      memory: atmel-ebi: add missing of_node_put for loop iteration
      memory: renesas-rpc-if: correct whitespace
      MAINTAINERS: memory: cover also header file
      memory: fsl_ifc: fix leak of IO mapping on probe failure
      memory: fsl_ifc: fix leak of private memory on probe failure
      memory: emif: remove unused frequency and voltage notifiers

Zhen Lei (1):
      memory: pl353: Fix error return code in pl353_smc_probe()

 MAINTAINERS                     |   1 +
 drivers/memory/atmel-ebi.c      |   4 +-
 drivers/memory/emif.c           | 678 ----------------------------------------
 drivers/memory/fsl_ifc.c        |   8 +-
 drivers/memory/pl353-smc.c      |   1 +
 drivers/memory/stm32-fmc2-ebi.c |   4 +
 include/memory/renesas-rpc-if.h |   6 +-
 7 files changed, 16 insertions(+), 686 deletions(-)
