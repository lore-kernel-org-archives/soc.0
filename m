Return-Path: <SRS0=Mhqg=PA=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A65C433F5
	for <soc@archiver.kernel.org>; Tue, 12 Oct 2021 21:38:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 99662610CC; Tue, 12 Oct 2021 21:38:52 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AFC7610A2;
	Tue, 12 Oct 2021 21:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AFC7610A2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id ls18-20020a17090b351200b001a00250584aso2865821pjb.4;
        Tue, 12 Oct 2021 14:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7KSFiVfnSAs3/SNg960Jao534TVHaMEf6Q67ELHvISI=;
        b=C4opyIm9SXR4jj+Fws/OgRQpZWSkl5zCHCg8W+exJw5zbNkWCzTHGJz8/1LOkt6nO5
         wWlQsQC7+TP7k99tZzM4Otwa3K2QYUd6kG0A1SEdrPZXWaChnxqz9sZ0r64CBr/ogS/P
         eSPsEDzamJ/61iGY8bDJIpiDCRN9PnOMLDTuDWkJcZmIdOUR3RL5ZrA2yfklRwsMhVT1
         wOdC/X/V+XMMej0iXAhe2CGUZXODvnJdUSbs5BM9pdvOxjMxZubX83cOyCErZSSJ/TKZ
         jwbUKrLIjLr5caYiZISFHV60zQzUXdVo2OVmF4p05LBmfklE54VACwLxApIH2x0W09l8
         cYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7KSFiVfnSAs3/SNg960Jao534TVHaMEf6Q67ELHvISI=;
        b=E5cetYIyTgzHqWsc3P47OQlLQG8dWE7TNXfPzCwFpfH5AQ+EFI643C8X+PMvD0tqsU
         qMdCeKOn+vPoLFtZpJGDHgIZBh8l+WQwOSAuQ4jUAUekmAs91fifDpsStZCUJISNp3/1
         SwB/sZf+/3hKcJ6bV2+b2XT5BoZ9WXhzc8kiBuIYbvnv9y+je7g8JbhkkCTCe/rqC8kP
         U+xfqx11wl/3eu7FsIDUMY6lxeSQ0+rR/bg1mrZdV5Jr0O+Cec1IGUoH8oKszxSEPojj
         bWFiVbnlEAG/SaYs+Fp4R2/pa69B7H3Cm6MEjcerO5Resnl4BmSN+rCFvidQ9jy+a9/3
         BQTg==
X-Gm-Message-State: AOAM5307cOyGlUPs7BBfXGztkR3RhSaco6TBq+ihupWapVn+EpoQRWQY
	XEAc/4IZfyR+fMphQkN17/HQI58N0B8=
X-Google-Smtp-Source: ABdhPJzMBFE0A5cRVwl7kVYDyhUTDj9CqIXhgrD54W9yDJtzEWnmSvOBI1Ud3uI5+ROMFyJl0eVH2g==
X-Received: by 2002:a17:90a:7345:: with SMTP id j5mr8947209pjs.48.1634074731557;
        Tue, 12 Oct 2021 14:38:51 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 130sm11629721pfz.77.2021.10.12.14.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 14:38:50 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree fixes for 5.15
Date: Tue, 12 Oct 2021 14:38:41 -0700
Message-Id: <20211012213841.1872021-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.15/devicetree

for you to fetch changes up to bc22b6208f416ba702c17a93c9af6474f19e8212:

  Merge tag 'tags/bcm2835-dt-fixes-2021-10-06' into devicetree/fixes (2021-10-12 09:14:30 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
5.15, please pull the following:

- Stefan fixes the VEC (video encoder) bus address for 2711, fixes the
  MDIO bus controller #address-cells/#size-cells inversion and the SDIO
  regulator voltage ranges

- Nicolas fixes DTC warnings for the PCIe host bridge and its child
  USB device

----------------------------------------------------------------
Florian Fainelli (1):
      Merge tag 'tags/bcm2835-dt-fixes-2021-10-06' into devicetree/fixes

Mateusz Kwiatkowski (1):
      ARM: dts: bcm283x: Fix VEC address for BCM2711

Nicolas Saenz Julienne (2):
      ARM: dts: bcm2711-rpi-4-b: Fix pcie0's unit address formatting
      ARM: dts: bcm2711-rpi-4-b: Fix usb's unit address

Stefan Wahren (2):
      ARM: dts: bcm2711: fix MDIO #address- and #size-cells
      ARM: dts: bcm2711-rpi-4-b: fix sd_io_1v8_reg regulator states

 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 11 ++++++-----
 arch/arm/boot/dts/bcm2711.dtsi        | 12 ++++++++++--
 arch/arm/boot/dts/bcm2835-common.dtsi |  8 ++++++++
 arch/arm/boot/dts/bcm283x.dtsi        |  8 --------
 4 files changed, 24 insertions(+), 15 deletions(-)
