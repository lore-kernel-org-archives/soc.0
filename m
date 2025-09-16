Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C77343D97
	for <soc@lists.linux.dev>; Tue, 16 Sep 2025 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758035095; cv=none; b=p1AlbqkuPFni34x9wOWEjUruKdGWB07MQsefsXx+nBIZycqj45Z9knLCa2R+YCHHBPUreOt0W9YQCyIa48swC+/FIMRWo2ZK2XaBFTc+mkFoSWEVupZqRplr7aNyYAE1YboFfv26v8r/aj1LCeAQ/3iZ+zy+fQazz2tuBG6UbRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758035095; c=relaxed/simple;
	bh=22msJI66Kn4S5p8RuJrtuGtfpaKspAeILuZQoci+SlQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R43UePSF4p6+MZ98xJ3Hv3RLI94Zswqvsf8j103DymVmZ6pJMx2wPzt+zJH4ubWSFuc4oqo0EXTc6R7c9PLj9nrkJKgKgojbxDip9FzAp+1qK/aOVhpoDP1zZJcJx3je9dKxNV2Ki0aouWMSP4jwKv8wfRgnzb1peVDA7bRe3nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Lkt8in1S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Lkt8in1S"
Received: by smtp.kernel.org (Postfix)
	id C46EFC4CEFC; Tue, 16 Sep 2025 15:04:54 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E27E1C4CEEB;
	Tue, 16 Sep 2025 15:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E27E1C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758035092; x=1789571092;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=22msJI66Kn4S5p8RuJrtuGtfpaKspAeILuZQoci+SlQ=;
  b=Lkt8in1SpKdd9WneVFyUmJtr1PtDIylPkIPBTV+fzEGiSbpXw3/+aznH
   42wJX5278JXWsLssqGmqrBYGxfkMGCdrpSBkBi5zsO8HmY1O56cKfjPFq
   zk9gEuuX2/hSJzenpACqmW36SAEWQxRegsTyiI1MGn9vey9WWzaAu0Z3w
   +255unlM9Vq4RduL6PHkF5jXszrKcBFPe1xVHWffd79RdXEAulSElz+YZ
   8x0sxuCdsG1LQHZHfJ9PGhTCwciXKXSQ00X3m/+7FkXTjad/XAof++n+p
   p7svnJkQXqrUUKx6tAItVxJxy4U2DNLIEMdh5eFeOmwjpOuU3+GdxrDAt
   Q==;
X-CSE-ConnectionGUID: 37c0yGb2SSCtsg11K/lYzw==
X-CSE-MsgGUID: 1trTaR7qScuOZQidJ24XAg==
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="47114855"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2025 08:04:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 16 Sep 2025 08:03:32 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 16 Sep 2025 08:03:30 -0700
From: <nicolas.ferre@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>, <arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [GIT PULL] ARM: microchip: soc for 6.18 #1
Date: Tue, 16 Sep 2025 17:03:28 +0200
Message-ID: <20250916150328.27015-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Dear arm-soc maintainers,

Here are the at91 soc changes for 6.18. They are move specific to at91 product
line and are all related to PM code.

Please pull. Thanks, best regards,
  Nicolas

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.18

for you to fetch changes up to 747436750bc0ef73be32391bd5d0d7dcd185da7f:

  ARM: at91: pm: Remove 2.5V regulator (2025-09-16 16:57:03 +0200)

----------------------------------------------------------------
Microchip arm-soc updates for v6.18

This update includes:
- low priority fixes to the PM code, in relation to recent addition of
  sam9x75 or sama7d65 SoCs
- removal of the 2.5V regulator for low power modes since this is
  no longer supported

----------------------------------------------------------------
Nicolas Ferre (3):
      ARM: at91: pm: fix .uhp_udp_mask specification for current SoCs
      ARM: at91: pm: fix MCKx restore routine
      ARM: at91: pm: save and restore ACR during PLL disable/enable

Ryan Wanner (1):
      ARM: at91: pm: Remove 2.5V regulator

 arch/arm/mach-at91/pm.c         |  2 +-
 arch/arm/mach-at91/pm_suspend.S | 41 ++++++++---------------------------
 include/soc/at91/sama7-sfrbu.h  |  7 ------
 3 files changed, 10 insertions(+), 40 deletions(-)

-- 
Nicolas Ferre
