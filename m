Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12722BEC30
	for <soc@lists.linux.dev>; Wed,  3 Sep 2025 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756920871; cv=none; b=DUfuRoigwGIPzkfYM+hpF0Y1hiTYNI/PRHqFIn5/6HN32kEZar4smIfKQ0E3k0ZUz4rOIbH4Q+Cmb7Xjs04iIu77X+Zl6zlgJy/tdblIwOcA0UdR6e4f3LSA3cy6NPnGuTr6xEHUJeMOOK8dK5mpUSAkQtW7tR7GBjFv5UDb6+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756920871; c=relaxed/simple;
	bh=j9uoBR2bCWVLPcGuSh21m2aRxS2t6SdQg9H9h9+omF4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FuOVKxQaBdaU3ZWjrL33KXxa+cTvn12eShNo/h/ZIGKZoowiX7k+5PJvPyUDezeLC44NNdy/RW5iIuLq+YWRZunMojQsOtxikThXo5ENfNFSrY1XYhyESShonggo/5vAIj558x4jdmGKsnwxJGqNiYX0dBcAZLJQtzvi0h2qH7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=AwjcXX9x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="AwjcXX9x"
Received: by smtp.kernel.org (Postfix)
	id B39F1C4CEF4; Wed,  3 Sep 2025 17:34:31 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 974DBC4CEE7;
	Wed,  3 Sep 2025 17:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 974DBC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756920870; x=1788456870;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j9uoBR2bCWVLPcGuSh21m2aRxS2t6SdQg9H9h9+omF4=;
  b=AwjcXX9xPmE6wP4+mPqHIPDBbXVjXL34mdBJihcZHn6zpAjIL2raHoz2
   jgHBYHX3nRvnh6kxb4m0+pZ2Fpqef4ZOdCQpqfx7X956et2LTuvwuHK25
   OKQlXIG0Pmnnf9/N39NFDL8tKE/9U03PsqdCG0pPu4cph6DQszHQ3YK4h
   6NmnoC5CS50ciD5uClDgqlJcfuPQwXWJd8gMrx8Y3nxEhASbsYWezHZ1A
   qUT6ngeUIfbBzSYuaVYnVYPFEj/zLI81wNgITHff9uMPNKXjO/2+cB8ZB
   s1kIRI1lywX7RgxgGmQ+UwgorXLSl3iQFiLogbP+e9ZlksaU7KFXdqZkF
   w==;
X-CSE-ConnectionGUID: oKJd4GHmSRGRULZoo4t0VA==
X-CSE-MsgGUID: nliAKuDLT7KKBBDAlGntcQ==
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="45463451"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Sep 2025 10:34:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 3 Sep 2025 10:34:26 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 3 Sep 2025 10:34:24 -0700
From: <nicolas.ferre@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>, <arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Vinod Koul <vkoul@kernel.org>, "Alexander
 Dahl" <ada@thorsis.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [GIT PULL] ARM: at91: fixes for 6.17
Date: Wed, 3 Sep 2025 19:33:55 +0200
Message-ID: <20250903173403.113604-1-nicolas.ferre@microchip.com>
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

Here are the fixes for 6.17. The addition of the Kconfig symbol is taken from a
bigger series by Robert here:
https://lore.kernel.org/linux-arm-kernel/20250813174720.540015-1-robert.marko@sartura.hr/
It is needed because one patch of this series was taken before that symbols were
defined properly (queued for 6.18). You can read the discussion here:
https://lore.kernel.org/all/bac5390f-725a-43db-a2b6-17a68d0d733c@tuxon.dev/

Thanks, best regards,
  Nicolas

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.17

for you to fetch changes up to 217efb440933bf97a78ef328b211d8a39f4ff171:

  ARM: dts: microchip: sama7d65: Force SDMMC Legacy mode (2025-09-03 18:52:08 +0200)

----------------------------------------------------------------
Microchip AT91 fixes for v6.17

This update includes:
- adaptation to the SDHCI capabilities on sama7d65 curiosity board DT as
  SDHCI quirks are not in place yet. SD/MMC don't work without these
- addition of one Kconfig symbol that is already used in DMA tree for
  6.17. XDMA cannot be selected if not present.

----------------------------------------------------------------
Robert Marko (1):
      ARM: at91: select ARCH_MICROCHIP

Ryan Wanner (1):
      ARM: dts: microchip: sama7d65: Force SDMMC Legacy mode

 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts | 2 ++
 arch/arm/mach-at91/Kconfig                              | 4 ++++
 2 files changed, 6 insertions(+)

-- 
Nicolas Ferre
