Return-Path: <SRS0=h2dX=3Z=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8ACC4332F
	for <soc@archiver.kernel.org>; Fri, 25 Nov 2022 09:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F15BFC433D7; Fri, 25 Nov 2022 09:30:34 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65167C433D6;
	Fri, 25 Nov 2022 09:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65167C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669368633; x=1700904633;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=77aiHvxt3wZarpM6WltKKTsVuG2nc8h9fPhvoRHYKPo=;
  b=WE5rAO2HQpI0TZyr0BpspYGuT2AhJ6yNL4RjDV+UfjsPUoTsX9W4YpiR
   tCEfl8c19jY1teRjGl1ltq8dqdLonepADKNNgkplSoI89kZ5pwRfaIurL
   +IrbWGDw/EzuoVIPQS5d1Q0UOnwTRpLgEOV1ptrPpVrhOADoGf5vmr46v
   KD3qibTZFgKtzJT7yIkccumF17fEAuM8tamryXlMCpSUPxm8eYhJZm4RU
   +iSEd73mPluQBmrJNujY6JtA45hHraAYtathaP63So3Y3u4d6XTdn9oLV
   TEaCDJvzvx6n5/uTcVGHxtor3JTsSr9D+J6rB5ivEugVMWcKMucLLYJ21
   g==;
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="201369161"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 02:30:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 02:30:32 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 25 Nov 2022 02:30:30 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 fixes for 6.1 #3
Date: Fri, 25 Nov 2022 11:35:21 +0200
Message-ID: <20221125093521.382105-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 40a2226e8bfacb79dd154dea68febeead9d847e9:

  ARM: dts: at91: sam9g20ek: enable udc vbus gpio pinctrl (2022-11-17 15:23:50 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.1-3

for you to fetch changes up to 6a3fc8c330d1c1fa3d8773d7d38a7c55c4900dfe:

  ARM: at91: fix build for SAMA5D3 w/o L2 cache (2022-11-24 12:50:07 +0200)

----------------------------------------------------------------
AT91 fixes for 6.1 #3

It contains:
- build fix for SAMA5D3 devices which don't have an L2 cache and due to this
  accesssing outer_cache.write_sec in sama5_secure_cache_init() could throw
  undefined reference to `outer_cache' if CONFIG_OUTER_CACHE is disabled
  from common sama5_defconfig.

----------------------------------------------------------------
Peter Rosin (1):
      ARM: at91: fix build for SAMA5D3 w/o L2 cache

 arch/arm/mach-at91/sama5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
