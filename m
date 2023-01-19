Return-Path: <SRS0=rvNc=5Q=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CB4C00A5A
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 14:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7B51C433F0; Thu, 19 Jan 2023 14:42:49 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23076C433D2;
	Thu, 19 Jan 2023 14:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 23076C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674139367; x=1705675367;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aprGr6eVthOxNxFYeHFmXsfEPa0pNWq7D2Wdek7QuEE=;
  b=bJV2rNh53rQV4a4v3MaeAIcvSJVXDNCPhVBsX/AzydC3UlbSpNPlndHa
   4tRI4I8FxVmmlL6pCdn5CXgjzsLqATWk7Q+ry4AjRdIf4gLe0NCDLRgxO
   dc4WEOOcAldQirR8kXI6vfYcFINi5zfExtdr7lriEdl1ptHqXX1NSzLkF
   vYPG3pFN5J0Nd7rI5bqfbVGY9SxHqhLGzObpue9gcWUE/DdyEv1hw5ffQ
   iqPFzqrZBlXXUCLnpg/gYwS0Yl/CE7CUiAE8RW2hEDfItvSJ6VaeI8ZOR
   4NSXl8shGjYkxIu4yUu2nSFpILQ7T49hsAHDbNf9dkl61Tgi2h8HbEEcH
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669071600"; 
   d="scan'208";a="28537301"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Jan 2023 15:42:43 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 19 Jan 2023 15:42:43 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 19 Jan 2023 15:42:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674139363; x=1705675363;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aprGr6eVthOxNxFYeHFmXsfEPa0pNWq7D2Wdek7QuEE=;
  b=H1qc7/ET2JwQbRuwAH0CLnHyIgycjCU7xbJdvqQlGf+/weo3rSjil5VK
   3BTzntf1nIu27p7Fu4rbGlO68xzDWOvjKRmnMlOZu/mJOc/R4XN1FUPJ5
   mCbxAU0TXluS5bN+J5vJEUDFPYBNTrAJEDa0tgOQxTvLKZekZA4TPpfTT
   15i+yjPACZkp8QZei/ehE5nvjN7IjTGuxC035PTijBnw2oPxvrUs1UNJx
   QGet3zNLU0DGyhQBnxPvjcevKC8dozu/Oz8bXSIhkZ8vE0HLyfA9IPMst
   nR2zG0HQtHmjYWHDUU4/VGMOcXfJ22STmxUkn/lC7GoO48phG/ZCnOj82
   w==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669071600"; 
   d="scan'208";a="28537299"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Jan 2023 15:42:43 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id EF55B280056;
	Thu, 19 Jan 2023 15:42:42 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
List-Id: <soc.lore.kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/9] TQMLS1021A support
Date: Thu, 19 Jan 2023 15:42:27 +0100
Message-Id: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this adds the DT files for the TQMLS1021A using the MBLS1021A mainboard.
This includes general board support and several overlays enabling various
graphic devices. RCW and hardware configuration using dip switches is not
needed, the default DT can be used. Just video output needs specific
overlays.

The last patch enabling LPAE in defconfig is just for demonstration what's
needed for PCIe support. There was a patchset ([1]) supporting LPAE on
armv7 defconfig, but there was no feedback.

[1] https://lore.kernel.org/linux-arm-kernel/20200203184820.4433-2-nsaenzjulienne@suse.de/T/

Alexander Stein (8):
  ARM: dts: ls1021a: add TQ-Systems MBLS102xA device tree
  ARM: dts: ls1021a: add TQMLS1021A flash partition layout
  ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS TM070JVHG33 overlay
  ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA HDMI overlay
  ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH DC44 overlay
  ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH FC21 overlay
  ARM: multi_v7_defconfig: Add options to support TQMLS102xA series
  [DNI] ARM: multi_v7_defconfig: Enable CONFIG_ARM_LPAE for
    multi_v7_config

Matthias Schiffer (1):
  dt-bindings: arm: fsl: add TQ-Systems LS1021A board

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 arch/arm/boot/dts/Makefile                    |  12 +
 ...1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts |  55 +++
 ...1021a-tqmls1021a-mbls1021a-cdtech-fc21.dts |  55 +++
 .../ls1021a-tqmls1021a-mbls1021a-hdmi.dtso    |  36 ++
 ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso |  56 +++
 .../boot/dts/ls1021a-tqmls1021a-mbls1021a.dts | 409 ++++++++++++++++++
 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi     | 124 ++++++
 arch/arm/configs/multi_v7_defconfig           |  14 +
 9 files changed, 768 insertions(+)
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-fc21.dts
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi

-- 
2.34.1

