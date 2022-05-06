Return-Path: <SRS0=KWQb=VO=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A895EC433EF
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 08:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69FEDC385AF; Fri,  6 May 2022 08:54:32 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CEF12C385AE;
	Fri,  6 May 2022 08:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CEF12C385AE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1651827270; x=1683363270;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yXkAGnbmzCjfps7g1Xs+w6HdaYDLrW7r04xiVUHnfHI=;
  b=gOoEAzN8fJw5JZveXr2MDt7y4qSC7rNuGHsa0q2qz+FPBFFbfH1J6k68
   fF9feevymxw5/7Jpdw7y120j69u9eFxN91VqzgLsNlDaQ3DhUbwDmxEay
   2xmLHIufyaToFlufSp/TQDFHDI+6hTAuWugLmZVBUTPRthLIjkD7dhyKr
   jCL0IAiVHt443ZF+0skiRZ6DKaOuP6A3T81+Y1atJcW1/nvSOx5VfD00+
   3Q8ohArbdAFwJYsSnaAC7VobwzczxHDNGaJJMSAygwp1dFEiq0x7bOOzi
   i1nK1jRggmmuOIIDVbbf/bIQD/IPgH4UZGDX7KcJKOPF0CkxiQJAGQmRC
   w==;
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="172212209"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 May 2022 01:54:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 6 May 2022 01:54:29 -0700
Received: from ROU-LT-M43238L.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 6 May 2022 01:54:26 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>
Subject: [GIT PULL] ARM: at91: defconfig for 5.19
Date: Fri, 6 May 2022 10:54:25 +0200
Message-ID: <20220506085425.58270-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the changes for 5.19 which contains updates for all our
defconfigs.
One multi_v7_defconfig patch is also queued.
Please pull.

Thanks, best regards,
  Nicolas

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-5.19

for you to fetch changes up to 386d0503c1eb04d11ec241789439334f1c2c3b72:

  ARM: configs: at91: Enable AUTOFS_FS required by systemd (2022-05-06 10:05:59 +0200)

----------------------------------------------------------------
AT91 defconfig #1 for 5.19:

- update to MTD options and use of UBI
- addition of systemd needed options
- sama7: addition of reset, camera and microphone drivers

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: configs: at91: sama7: enable CONFIG_RESET_CONTROLLER

Codrin Ciubotariu (1):
      ARM: configs: at91: sama7: add MCHP PDMC and DMIC drivers

Eugen Hristev (2):
      ARM: multi_v7_defconfig: add atmel video pipeline modules
      ARM: configs: at91: sama7: add xisc and csi2dc

Mark Brown (1):
      ARM: configs: at91: Enable options required for systemd

Nicolas Ferre (1):
      ARM: configs: at91: Enable AUTOFS_FS required by systemd

Tudor Ambarus (3):
      ARM: configs: at91: Remove MTD_BLOCK and use MTD_UBI_BLOCK for read only block FS
      ARM: configs: at91: sama7: Enable MTD_UBI_FASTMAP
      ARM: configs: at91: sama7: Enable MTD_UBI_BLOCK

 arch/arm/configs/at91_dt_defconfig  | 4 +++-
 arch/arm/configs/multi_v7_defconfig | 3 +++
 arch/arm/configs/sama5_defconfig    | 3 ++-
 arch/arm/configs/sama7_defconfig    | 8 ++++++++
 4 files changed, 16 insertions(+), 2 deletions(-)

-- 
Nicolas Ferre
