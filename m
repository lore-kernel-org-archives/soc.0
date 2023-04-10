Return-Path: <SRS0=Jlev=AB=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0C6C77B61
	for <soc@archiver.kernel.org>; Mon, 10 Apr 2023 23:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6578C433EF; Mon, 10 Apr 2023 23:26:12 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE061C433D2;
	Mon, 10 Apr 2023 23:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AE061C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id h3so20580459qtu.1;
        Mon, 10 Apr 2023 16:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681169170; x=1683761170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5xk/MfzEgCGEbDCZl2/zk2N4beMPIzmmN1fAUVp9es=;
        b=gYY5R/bOVwtUytQ1++T3sJXwB1bfcBvodcJvw8EThW3W4Ulj31GcBz2cxeZTq2/qK2
         sjzzoaPOtshpc3aR5NNBh1QsV5ngQpQzQ/Rs6ZT4LswzDuDdoXn/M3LyN3HD63gGNpS2
         5MUcXY1GCa6dDY9JzZS1pmmGudXwDkD4MNGTslcbK+a6iyr8fIVc0p8LNE0Gm1p2iwk8
         wxEeZ7xPWsQkWki7Ie2noMc2BDCDPI+DspmjSjz06YmDIP9O4ItjT6D4wvuJD8zo3v4x
         I+hqj2UsjBwEDSQSipxHdDQP9+zLtqHcSleqC/h6qrzsjwFlqb/L66+IRS9coqFWlLuG
         OQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681169170; x=1683761170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5xk/MfzEgCGEbDCZl2/zk2N4beMPIzmmN1fAUVp9es=;
        b=4fIbVM7CTiownqvD7pGjXMtct4tlXBIUVM2TvXo+gBMmnMb+ncg19c4BbXkEiQDKtu
         wi7l+wEBdrYr6tjZCeZ4eRW8nb/8co9tMGHuMUplbeHtQzUNmBFRpjSAim7nkraV2YHP
         qeYGiF6Q1xg5tLBtVNcX/KVXPcRannkO7N7jMu2hdxpMhxmViVfBNL3/Yt50BnFMSqhj
         QA570wCcgy4GDYKipDfT8i/P6ECquvRn6qs6W8dOdgyrSmoqML4eEGSZ+YcUz29ugAyL
         tzUHI+lTrydU0FMAVFYDSCnFAB3FzVQNWz1d6rzFwYzHshSMV4d5ZSzDLQLmS+VYsSlh
         I7vA==
X-Gm-Message-State: AAQBX9eqsd4fBqco+fhxPn2COqL1GypMLURWSQ1MrKXI4PAZFgH1skEd
	BVPiD2GXt8Sz6QfwJVum4evns1szIr2CfA==
X-Google-Smtp-Source: AKy350b2zCyGJAaJZ8ktIXAx8cSic4hR6TYVKmoGY6uqYBXAnIefdYJq1ZZJkPioVBd+uesbVClb+A==
X-Received: by 2002:ac8:5986:0:b0:3e6:95f2:8431 with SMTP id e6-20020ac85986000000b003e695f28431mr16212905qte.12.1681169170228;
        Mon, 10 Apr 2023 16:26:10 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v126-20020a379384000000b007460093cccdsm3604775qkd.25.2023.04.10.16.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 16:26:09 -0700 (PDT)
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
Subject: [GIT PULL 1/4] Broadcom devicetree changes for 6.4
Date: Mon, 10 Apr 2023 16:26:03 -0700
Message-Id: <20230410232606.1917803-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.4/devicetree

for you to fetch changes up to 7858dded8c1e983740b46857660526575583d2a2:

  ARM: dts: broadcom: bcmbca: Add spi controller node (2023-03-14 14:07:06 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 6.4, please pull the following:

- William adds the new-style High Speed SPI controller node to the BCA
  SoCs

----------------------------------------------------------------
William Zhang (1):
      ARM: dts: broadcom: bcmbca: Add spi controller node

 arch/arm/boot/dts/bcm47622.dtsi    | 18 ++++++++++++++++++
 arch/arm/boot/dts/bcm63138.dtsi    | 18 ++++++++++++++++++
 arch/arm/boot/dts/bcm63148.dtsi    | 18 ++++++++++++++++++
 arch/arm/boot/dts/bcm63178.dtsi    | 19 +++++++++++++++++++
 arch/arm/boot/dts/bcm6756.dtsi     | 19 +++++++++++++++++++
 arch/arm/boot/dts/bcm6846.dtsi     | 18 ++++++++++++++++++
 arch/arm/boot/dts/bcm6855.dtsi     | 19 +++++++++++++++++++
 arch/arm/boot/dts/bcm6878.dtsi     | 19 +++++++++++++++++++
 arch/arm/boot/dts/bcm947622.dts    |  4 ++++
 arch/arm/boot/dts/bcm963138.dts    |  4 ++++
 arch/arm/boot/dts/bcm963138dvt.dts |  4 ++++
 arch/arm/boot/dts/bcm963148.dts    |  4 ++++
 arch/arm/boot/dts/bcm963178.dts    |  4 ++++
 arch/arm/boot/dts/bcm96756.dts     |  4 ++++
 arch/arm/boot/dts/bcm96846.dts     |  4 ++++
 arch/arm/boot/dts/bcm96855.dts     |  4 ++++
 arch/arm/boot/dts/bcm96878.dts     |  4 ++++
 17 files changed, 184 insertions(+)
