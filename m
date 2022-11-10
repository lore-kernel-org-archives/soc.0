Return-Path: <SRS0=L2b6=3K=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F44C4332F
	for <soc@archiver.kernel.org>; Thu, 10 Nov 2022 11:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9FC76C433B5; Thu, 10 Nov 2022 11:49:40 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5540C433D6;
	Thu, 10 Nov 2022 11:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5540C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668080978; x=1699616978;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WV+QVTXNCy2G3sqQWzjJazg7nCwhODfc0L0dPOIQb5g=;
  b=Et5041/0DzkJEY1thxM+cLS+BQ7F6FjzidZxHv0NXBlhCRMPWMyyQGwk
   nQDf3kQ0gb2j0vHsoTY5wQriaCMP5OCI9O+4WV0y3gV9yCYNgkyM/+6lV
   w5PQisL1g+ZlM7EcS/oMeC1qcnYqtNhGTrUA0EEtsr6UIf2Od/9h7bCgR
   ruSglab2Zr5ifc27++w0XC+So0XZJsTl257GeEgKmibXVUxrBrwH3SUNy
   7bTD+kB4/9BVgcFv2iN66xz9nhOmfnHOxyrT05NltYs1O9D24RkYs51gm
   e4LfInvCH2EmXf2YqJPFdOm1C1uvACG8wIMTfU7eJq7Izt5oYVfPVHSob
   A==;
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="122747674"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2022 04:49:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 10 Nov 2022 04:49:32 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 10 Nov 2022 04:49:30 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 defconfig updates for 6.2
Date: Thu, 10 Nov 2022 13:54:22 +0200
Message-ID: <20221110115422.180893-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.2

for you to fetch changes up to d2c064d66e91de391c0b1208c9ac8a54ec3b065f:

  ARM: configs: at91: sama7: add config for thermal management (2022-11-01 12:29:30 +0200)

----------------------------------------------------------------
AT91 defconfig for 6.2

It contains:
- sama7 defconfig refresh (done with make savedefconfig)
- update sama7 defconfig with OTPC support
- update sama7 defconfig with thermal management support

----------------------------------------------------------------
Claudiu Beznea (3):
      ARM: configs: at91: sama7: use make savedefconfig
      ARM: configs: at91: sama7: add config for microchip otpc
      ARM: configs: at91: sama7: add config for thermal management

 arch/arm/configs/sama7_defconfig | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
