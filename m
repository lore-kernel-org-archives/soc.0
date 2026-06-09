Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB92854652
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 07:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990785; cv=none; b=LNW8bSRaSBh089NYVfyiWD1+fczPFNSJ4EJ1at+1XuVvzVfWocrYD5jjt0nujwKQmFk9q099b3v6rbyYAj2E/xSbjvbmPnfehYrYOyYk+MtuqnqlZ/H089yRAs0o/Ic1viDhhCgRTADvzH1eJE8p7BbhfeyzdgziBfl7Ms9LJnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990785; c=relaxed/simple;
	bh=mx7QXRja6Y2Mzn1lH5wc5Nw0BE/VycpWjcJDj9/CJ/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bOvR07pjoZdhwZT3stJGpIAfLjBcRnVThlikFQv5LB9haF4sbnJaIkRBv0F/hxLegvz5l3ei+Gdf09G8yNAojlP28lsqV+8UVhXJ5z/97NYdllySPNq90KebaD7XBpBAJMPUOaQX70InPe/WzauWrFmLkHlB4JdBPGpr4b3xrXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id 81D111F00898; Tue,  9 Jun 2026 07:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AF61F00893;
	Tue,  9 Jun 2026 07:39:42 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 device tree updates for v7.2
Date: Tue,  9 Jun 2026 10:39:39 +0300
Message-ID: <20260609073939.813573-1-claudiu.beznea@tuxon.dev>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-7.2

for you to fetch changes up to 96b33938cf783c790036e35860b206cf029f2e2a:

  ARM: dts: microchip: add I3C controller (2026-05-25 22:54:37 +0300)

----------------------------------------------------------------
Microchip AT91 device tree updates for v7.2

This update includes:
- I3C controller device tree node for SAMA7D65 SoC

----------------------------------------------------------------
Durai Manickam KR (1):
      ARM: dts: microchip: add I3C controller

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)
