Return-Path: <SRS0=MWgV=3S=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BADAC433FE
	for <soc@archiver.kernel.org>; Fri, 18 Nov 2022 13:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60AD9C43146; Fri, 18 Nov 2022 13:07:19 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89864C433D6;
	Fri, 18 Nov 2022 13:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 89864C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668776838; x=1700312838;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mUiSAecyHmy/WU6RcOY8WjeD47iVxFOHpBchFcV35uI=;
  b=bcgoprQzPn/9357KAluKr3ErFvofKWz3i1S9+4v2gezq+4QU5C9HOvEp
   xa8eDLOrF1/Lt/POgrC6JCyPk0EjYBfRCpVMgSYI8et/PaWoRdrkZCZUr
   JvXvv0emWn6vOgT7XTLQhtUWb/hF2yCFyYlq80Wf2XnRLucLKrCCQJL8G
   DXBcLJQtXitHg+xKuP96dsIm4Eh1POKnZfeAkVTzb7F5v6LENMDWcTA4i
   qE7b+QFTSys7KiKYx664Acc9hUpuZf2rPPJ4BxNGalYxRFHE3o0YViOfI
   iZjaKaYxghGaWaJDGCoZkFLlPUDZi/ASfFjWJzx8deJAZT/cNJ+aUWP2I
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; 
   d="scan'208";a="189539534"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2022 06:07:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 18 Nov 2022 06:07:16 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 18 Nov 2022 06:07:14 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 fixes for 6.1 #2
Date: Fri, 18 Nov 2022 15:12:05 +0200
Message-ID: <20221118131205.301662-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit cef8cdc0d0e7c701fe4dcfba4ed3fd25d28a6020:

  ARM: at91: pm: avoid soft resetting AC DLL (2022-11-01 12:25:19 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.1-2

for you to fetch changes up to 40a2226e8bfacb79dd154dea68febeead9d847e9:

  ARM: dts: at91: sam9g20ek: enable udc vbus gpio pinctrl (2022-11-17 15:23:50 +0200)

----------------------------------------------------------------
AT91 fixes for 6.1 #2

It contains:
- fix UDC on at91sam9g20ek boards by adding vbus pin

----------------------------------------------------------------
Michael Grzeschik (1):
      ARM: dts: at91: sam9g20ek: enable udc vbus gpio pinctrl

 arch/arm/boot/dts/at91sam9g20ek_common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)
