Return-Path: <SRS0=Jlev=AB=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C536C77B70
	for <soc@archiver.kernel.org>; Mon, 10 Apr 2023 23:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 028F4C4339B; Mon, 10 Apr 2023 23:26:15 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E47BEC433EF;
	Mon, 10 Apr 2023 23:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E47BEC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id dw2so18131718qvb.11;
        Mon, 10 Apr 2023 16:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681169172; x=1683761172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSU6Vq12+kQQDFtPvaoQYJxeQIpt2bVcjbp22aExHYs=;
        b=STcjU1HRhsoW14iqZ7Lz8KxP707PZzoAicCGNCRtg/ox0T0UpKIlZNXKkU1xfmZIFF
         QzPYZ4OjmKrl7TGZNoOXvVrJD37a3Fe61B2cNYiSGwQ60H0RUoZV/NMDsr4pq+LRztMB
         AHMwhq8Zy8jVNRyhPlCTBM+iWnksts8NpEaNjM/h1OuTAFmPAbHBY+2sFNrzllKvKmgQ
         rgZZm1XgZzsm7c87bf6QKlo0+3Wp+ZykUdg0Fpcl5dhmLAFaioWGdDhuQSYi3rzZtABX
         wPQwfd4rm86CYRGcMkJYDg14MQaaXxszeXJWLwli2uBCmkkOgJAxCl3+g+Qe5t6/L4t6
         e5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681169172; x=1683761172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSU6Vq12+kQQDFtPvaoQYJxeQIpt2bVcjbp22aExHYs=;
        b=4xl/dC3BD8F6gH5ZtEcSoPscXtKh8KTPtAAckTgYTVid6J+vt0zqET3+GFWkmF4KhM
         s53iwzXNCdbXrp2UvX3uQpP3E+0za62tGaekuyzY3/lxmtjfMGj7JZYg2mheS8YWNluh
         dP5FTqW4JiIlZWbdkltXKgSFo3Gwf1VnTT//XBSZsViQ53Lm2jRhvIydf7dEnZmiq7tB
         IBaDLQpvCSdJiSs9XPjPuhNJFQsmkRS9O9zoKnr/HthS0o0CAD/bmf96lz7ITpRLGT5r
         FGgIDGD4Me4Yc8ci0Vv/fdjciXIkzb7iOV5rpoyVG7HsSm2xt3aYPyR0qmSusArhBbsL
         X/Ww==
X-Gm-Message-State: AAQBX9emChCwUA9AnkHIs5xE5qY7M3klu6gxs1JCRUmaq6bXQTlgM8v3
	0xlr8Zj415qbSn+pLnpMHf9wwrlvL41SFg==
X-Google-Smtp-Source: AKy350Z3E+Hedpxlul+1kqpyTcrUKCkttLnoXXbAXHBVwUoV8xii/kNEFcNWMoGko7cwCECX5sABHA==
X-Received: by 2002:ad4:4eef:0:b0:5a3:725e:425c with SMTP id dv15-20020ad44eef000000b005a3725e425cmr17110492qvb.2.1681169172057;
        Mon, 10 Apr 2023 16:26:12 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v126-20020a379384000000b007460093cccdsm3604775qkd.25.2023.04.10.16.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 16:26:11 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	William Zhang <william.zhang@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/4] Broadcom devicetree-arm64 changes for 6.4
Date: Mon, 10 Apr 2023 16:26:04 -0700
Message-Id: <20230410232606.1917803-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410232606.1917803-1-f.fainelli@gmail.com>
References: <20230410232606.1917803-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.4/devicetree-arm64

for you to fetch changes up to e6d356b146b75f1f77621aab7950a1eb550859f9:

  arm64: dts: broadcom: bcmbca: bcm4908: add TP-Link C2300 USB LED triggers (2023-03-14 14:21:54 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree changes
for 6.4, please pull the following:

- Rob fixes the GICv3 ITS node name for the Stingray platforms

- William adds the new-style High Speed SPI controller nodes to the BCA
  SocS

- Rafal fixes the NAND controller interrupt name for BCM4908, LED
  node(s) and procmon for BCM4908. He also adds support for the USB
  ports, and declares USB triggered LEDs for the Netgear R8000P and
  TP-Link C2300.

----------------------------------------------------------------
Rafał Miłecki (6):
      arm64: dts: broadcom: bcmbca: bcm4908: fix NAND interrupt name
      arm64: dts: broadcom: bcmbca: bcm4908: fix LED nodenames
      arm64: dts: broadcom: bcmbca: bcm4908: fix procmon nodename
      arm64: dts: broadcom: bcmbca: bcm4908: add on-SoC USB ports
      arm64: dts: broadcom: bcmbca: bcm4908: add Netgear R8000P USB LED triggers
      arm64: dts: broadcom: bcmbca: bcm4908: add TP-Link C2300 USB LED triggers

Rob Herring (1):
      arm64: dts: broadcom: stringray: Fix GICv3 ITS node name

William Zhang (1):
      arm64: dts: broadcom: bcmbca: Add spi controller node

 .../dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts |  4 ++
 .../bcmbca/bcm4906-tplink-archer-c2300-v1.dts      |  6 ++-
 .../dts/broadcom/bcmbca/bcm4908-asus-gt-ac5300.dts | 10 ++--
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi   | 61 +++++++++++++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4912.dtsi   | 20 +++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63146.dtsi  | 19 +++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi  | 19 +++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6813.dtsi   | 20 +++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi   | 18 +++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi   | 18 +++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dts   |  4 ++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm94912.dts   |  4 ++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm963146.dts  |  4 ++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dts  |  4 ++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm96813.dts   |  4 ++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dts   |  4 ++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dts   |  4 ++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |  2 +-
 18 files changed, 216 insertions(+), 9 deletions(-)
