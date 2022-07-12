Return-Path: <SRS0=saSd=XR=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E6DC433EF
	for <soc@archiver.kernel.org>; Tue, 12 Jul 2022 23:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 453D4C341C0; Tue, 12 Jul 2022 23:12:28 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1EEEC3411E;
	Tue, 12 Jul 2022 23:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1EEEC3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id bf13so8890323pgb.11;
        Tue, 12 Jul 2022 16:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lDiitXxE1DmEGj1J+FVvG2DXe+GoPkm+jGUnS5nGtwE=;
        b=HClpqevHNpRBouQz+A/qIDsGTVOAe8yWvA+jo+wGEshRIc+XbTctCYVhUN0m1e9qnC
         bidkOp5qnMSwXNNgVwpFx0EykgY8Gx/xwMNJlbV1ST/zg4PwCk2IFuqqZKMZ20N4unSK
         EPM4CkmlmUVXS9x74Fbfu5cVKzDgCpswTPnf4bLLr1XoUTwF/waeNYuGkPcJI+6qnR9W
         rbd2b9CXTUxLc55qKsHnmScqgtf1FvKuDHYGQdVfB4PW3kXDzVm+IUWenqWhOareDw1L
         BClgEcHzjyj/NHlj55uEmyBqzGKfhst5Jp9F+8ytxdmpEyKzU3SAk2tWROwusKL7Ywag
         04Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lDiitXxE1DmEGj1J+FVvG2DXe+GoPkm+jGUnS5nGtwE=;
        b=RDerrFl9Q5C3KY/fM9AUAp3tHEobJUsqNcMdqO2UM6QMj+64SwJCANJ113894sWAAU
         beNwbzMGQbOQ8fhM1ONnOeQRJxTJFs/2k7Lv3E2/FgknRn/mji6eh8J85FLAQlm0PCgv
         kUkyHOiUtcI9yXYJ/YWPYpRGweSkVon0mYxEtmTIC197JmutDoIOx/mBAn15tFPa419B
         caFih3FSwy5NIhwuV8F8DbhNFxrttECoK/bHvUUK8T1RqcR5S3R1l7IdHbOKHvfYbB+T
         7snThy8Ng6cKCm/VquYQDEy8sZGyUUPnMNETCyh247znZ5r5yncZltMi+ZoH/nP8RKxq
         fU/Q==
X-Gm-Message-State: AJIora+Vi5cdq6tLrauGnBHp/yHr8yB3lFYNlr0wAnIQxCBIOTukhi2y
	07HvVaPZaMyfysrMgxA7jxKsvXFlq+U=
X-Google-Smtp-Source: AGRyM1sw8ovK/KDSowlpjUrANSHFAaGnm9+nINJ7ANRHvvagc5F1y6+z7TL073cRwG6+vnxlANiEdQ==
X-Received: by 2002:a05:6a00:2487:b0:525:7c72:ee73 with SMTP id c7-20020a056a00248700b005257c72ee73mr408137pfv.47.1657667546606;
        Tue, 12 Jul 2022 16:12:26 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u5-20020a62d445000000b0052896629f66sm7297367pfl.208.2022.07.12.16.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 16:12:26 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 5.19
Date: Tue, 12 Jul 2022 16:12:22 -0700
Message-Id: <20220712231222.97850-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/devicetree-arm64-fixes

for you to fetch changes up to 8bd582ae9a71d7f14c4e0c735b2eacaf7516d626:

  arm64: dts: broadcom: bcm4908: Fix cpu node for smp boot (2022-07-08 12:47:25 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree fixes
for 5.19, please pull the following:

- William corrects the BCM4906 DTS to have an armv8-timer Device Tree,
  necessary for booting, and fixes the BCM4908 DTS to have a proper
  'enable-method' and 'cpu-release-addr' properties for the kernel to boot
  when using u-boot

----------------------------------------------------------------
William Zhang (2):
      arm64: dts: broadcom: bcm4908: Fix timer node for BCM4906 SoC
      arm64: dts: broadcom: bcm4908: Fix cpu node for smp boot

 arch/arm64/boot/dts/broadcom/bcm4908/bcm4906.dtsi | 8 ++++++++
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi | 2 ++
 2 files changed, 10 insertions(+)
