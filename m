Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1BA36A377
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 11:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780314014; cv=none; b=vGfJeifHulbaixF5wH5Ljs8vYcdZpjSjeuGK9ogqQP0Cb69NC9b5JwD3bMY2Z1jte+7JcdYyLUuFCdlfO4pK1sSbbJ5AnciKEMK7pccrqfLTw7ygDu6Sau06wohdpwGrMP09VFP3JskzmhDchf86mTH6yI4HTiVehJeS625/gNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780314014; c=relaxed/simple;
	bh=Ml7YsC6jG0eeGvqSbpkAHQHO+Az+MXzJATifoKyKdLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=moeVlLngFZTHou9X3WMPfZmllq+paVPU+NHR0UeU9sPaVqhrarYzRJ5syLDt4moNoQwqOdzcCqGq367kw1XactsNjPi70estpe494F07DdT0V72ComSjOIVAHBcriiTG3gHZl3oLH/FcDWAYzmXrky8a510PG78EbVD9NVtBbMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id 5D10B1F0089E; Mon,  1 Jun 2026 11:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EDD1F00893;
	Mon,  1 Jun 2026 11:40:11 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 fixes for v7.1
Date: Mon,  1 Jun 2026 14:40:10 +0300
Message-ID: <20260601114010.2652407-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-7.1

for you to fetch changes up to 765aaba18413a66f6c8fe8416336ca9b3dd98a79:

  ARM: dts: microchip: sam9x7: fix GMAC clock configuration (2026-05-16 19:52:37 +0300)

----------------------------------------------------------------
Microchip AT91 fixes for v7.1

This update includes:
- a fix for the GMAC DT node on SAM9X7 SoC to properly describe the
  available clocks

----------------------------------------------------------------
Mihai Sain (1):
      ARM: dts: microchip: sam9x7: fix GMAC clock configuration

 arch/arm/boot/dts/microchip/sam9x7.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
