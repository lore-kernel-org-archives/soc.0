Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395583DFC8F
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 07:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990868; cv=none; b=fLpOtR+GVTAXG1GxxyUH0B+LlfZtkIChXXn1F6g0My3SmulWnf1K6pokXApm3DYKXO1Jv6nvpQRI97meOENy6G2PvLyNPt1pALkEBsB/vB6eFk9e+MtQ1TZ4twzHVJLR6l8qe/bXV3nlRHpzWRcg/rXRL7bGmQKf3nfbhftaG4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990868; c=relaxed/simple;
	bh=tkrT4OnJTK1gaReiS1wvP62R23/1yp8exExNM9thIqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g/Jl4iEXghsj6A8DUxXxQQYLWCvGix2t/lAQOg4vVhMTXCfzbRQaj7vlx2ht2L1UkPhF2M+CLzpoWxd4tmZrymMQziHdqsTF9Oyd0KzVFxJLcirzrRh+zvXopDzEjkLrB2ZZeZPJ+vIq6QgECQn5fHWxiKBm/nyrcFDTIdUv1NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id B94E71F00898; Tue,  9 Jun 2026 07:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7831F00893;
	Tue,  9 Jun 2026 07:41:04 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	conor@kernel.org
Subject: [GIT PULL] Microchip ARM64 device tree updates for v7.2
Date: Tue,  9 Jun 2026 10:41:03 +0300
Message-ID: <20260609074103.814073-1-claudiu.beznea@tuxon.dev>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.2

for you to fetch changes up to 8071815790141d3f05e32b972a6c79fdbbb88cfa:

  arm64: dts: microchip: lan969x: add OTP node (2026-05-25 22:59:07 +0300)

----------------------------------------------------------------
Microchip ARM64 device tree updates for v7.2

This update includes:
- the device tree node for the OTP controller on LAN9691 SoC

----------------------------------------------------------------
Robert Marko (1):
      arm64: dts: microchip: lan969x: add OTP node

 arch/arm64/boot/dts/microchip/lan9691.dtsi | 5 +++++
 1 file changed, 5 insertions(+)
