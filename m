Return-Path: <SRS0=R3qi=GY=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B7BC433DB
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 20:33:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EB80423A56; Thu, 21 Jan 2021 20:33:07 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A720B230F9;
	Thu, 21 Jan 2021 20:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A720B230F9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pj1-f42.google.com with SMTP id md11so2397436pjb.0;
        Thu, 21 Jan 2021 12:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RhTIj+lZ0U9Y9dF9HBJCT1hiEYvd3Uh23ercbE0Xjo0=;
        b=oE65Bo7C917+XskX8Pp4BR0rgNBGq0OHyMlohwEVBhL7BlMY/RovX6x5bv4nsrQKR+
         NafNFj3VcTr+nuVQ2IZlVJnn5YzOXoMSk4wFInhwn9w6gdodwrtDvL4E+CKvppAW5lZT
         ys2NFFCsvRGcjS+NNrLaHiKc5M5ihMxwgNDoblc0og81cxsR8/D/cUqjot6M3gCeVGRw
         U0qujxCGfw4xbqsJP9DRBSydnJjkiTPK1TVFo0l32b8Meet3WwZoRbwwOqS2Cp63MOwk
         5fswfFkHPViDiLZvE9KocBb11cgFCa6i7T7CxmeibDdKZcV8RAMcnydsMkl4jGasNfSD
         J4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RhTIj+lZ0U9Y9dF9HBJCT1hiEYvd3Uh23ercbE0Xjo0=;
        b=Gwmk6cdOQ/skfzg+cHyVmtqAakzk9ljroGB3ZBxJDXZPMWXQhFqtZawxL2Mm9Tzi9S
         BXWi9aSN9HrRStXi5S+OnchSOrVCRmF2zbszeyzPzGso7o0j787Khwp92SBaGL1Zm+gP
         em/ePVtdyGdlK0mqAsASkto1grLVMpZ9q2DHFgJFxenYR/InvCYvFpY5zSJcj9qL/NRV
         ddGng3w27smQfBrbwBmJPo8zM7EkWgUSZWu7djag+lm7ZMSRM60qP1BXTr6EILdANx/b
         Ik9LigFR/f7jcYRCAsBE0zM0N4Mtia3g5eDaxckLiqxKDRTFdFHVmF/77JfjikicKBKF
         Z65A==
X-Gm-Message-State: AOAM5317RiUBrkfAMWFNGtlhzKuXlcJBj2lpKuUhjZkbR9NhlnU0tVVH
	zG0EgMHkxMnsoAUOzLkQ7HM45BsuhR4=
X-Google-Smtp-Source: ABdhPJxlpobMVpdkg95ov70WGAWklTsqgkos4FjFcvwxNJyscXkKc253ymA8WNP8+5as+yuKyYxrlQ==
X-Received: by 2002:a17:90a:9318:: with SMTP id p24mr1304995pjo.123.1611261186191;
        Thu, 21 Jan 2021 12:33:06 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q12sm6305667pgj.24.2021.01.21.12.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 12:33:05 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Bharat Gooty <bharat.gooty@broadcom.com>,
	Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ray Jui <ray.jui@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree-arm64 fixes for 5.11
Date: Thu, 21 Jan 2021 12:33:00 -0800
Message-Id: <20210121203302.3639841-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:

  Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/devicetree-arm64-fixes

for you to fetch changes up to d68aecc153ea4bd55ff32f083f05e9bc5610ec78:

  arm64: dts: broadcom: Fix USB DMA address translation for Stingray (2021-01-20 10:45:56 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64 SoC fixes for 5.11, please
pull the following:

- Bharat fixes the Stingray USB controllers ability to DMA by providing
  an appropriate 'dma-ranges' property for the interconnect

----------------------------------------------------------------
Bharat Gooty (1):
      arm64: dts: broadcom: Fix USB DMA address translation for Stingray

 arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
