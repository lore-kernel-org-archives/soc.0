Return-Path: <SRS0=uQx5=5Q=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03108C46467
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 11:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6F56C433F1; Thu, 19 Jan 2023 11:31:17 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17212C433D2;
	Thu, 19 Jan 2023 11:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17212C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674127875; x=1705663875;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gwSN2cItzHjqibhx4wHA58JkFC3GPqiVPTkSfbvsBvQ=;
  b=FwRRjvBa3EUwmF4U7OyrTu+RvH51ppB8p6SR2K+mkKzp0yLo++sNCZMO
   b7CvI/YRDcJP6zUERa9JFPXSZodq/4ppbKzItodm3BuGxQ0AOy5rluWid
   CweO0mRPGtmScHLC9WJRJ1Z579BaL0KcHO0bMdzQKZ74xJhHpicuVJrn7
   8lJMmobxU1M4PkgFxMmquTvn0kJUb4uhdNNXkdv/D3K1RimpkCbzG70sQ
   0OYP3gITrVP9dee/ID5z7ukRkIO014LqR5xZLU95rKrI6u5UUWBpPpM2S
   BrWd9wqvajScPeAStKq8jYAlFDwkqPpzzQ5+xph2XrjDPhuChqtpCMkrb
   A==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669100400"; 
   d="scan'208";a="133098067"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jan 2023 04:31:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 04:31:15 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 04:31:11 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 device tree updates for 6.3
Date: Thu, 19 Jan 2023 13:29:03 +0200
Message-ID: <20230119112903.43257-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.3

for you to fetch changes up to bbc9db2da8716759f367ad5754036b58f5371044:

  ARM: dts: at91: sama7g5: add nodes for video capture (2023-01-09 14:02:08 +0200)

----------------------------------------------------------------
AT91 device tree updates for 6.3:

It contains:
- the addition of XISC (eXtended Image Sensor Controller) and CSI2DC (csi2
  demux controller) available in SAMA7G5

----------------------------------------------------------------
Eugen Hristev (1):
      ARM: dts: at91: sama7g5: add nodes for video capture

 arch/arm/boot/dts/sama7g5.dtsi | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
