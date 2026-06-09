Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439163DD51B
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990750; cv=none; b=nR941dytoA3kjp2gl2kgEllas7abQAQN/1b+rDOj+1e4ndUE2Yno+R2VW3Td8955iRNCkWzCo0zUi7rrdDoSfrh0Nyzs+i2QpkI9dmRGMFHa1GGALr/OaFWKkJr8axT2PskQoofWLS4VjoBstM0ePIs740GW3ebBeO9S7z10ohI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990750; c=relaxed/simple;
	bh=JT07XfJdal+YL1bXFNZ7MkAiSwFnAeeTNXuXh7+tUVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FHcS2yUNf9+MWffASdJ5kGJgJ3h62wrz5gi4vQqRzOw5Kx3W7S/nGs+UNdkgawpiVMqYR7ojOZSq13lxhr/rPHx1jfel+U2qbLMS+pPs/NuHSncwvNRjWTzG93jxu0yiNbqsc43H6GP8kgVyX7L4O1+xuX40O/nvSH0Zey81tlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id 06C931F00899; Tue,  9 Jun 2026 07:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFB41F00893;
	Tue,  9 Jun 2026 07:39:07 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 defconfig updates for v7.2
Date: Tue,  9 Jun 2026 10:39:04 +0300
Message-ID: <20260609073904.813405-1-claudiu.beznea@tuxon.dev>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-7.2

for you to fetch changes up to ac75ae436723e5fe68dcc8e806f66d0358dd56f7:

  ARM: configs: at91: sama7: add sama7d65 i3c-hci (2026-05-25 22:55:30 +0300)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v7.2

This update includes:
- I3C flags for the SAMA7 family of SoCs

----------------------------------------------------------------
Manikandan Muralidharan (1):
      ARM: configs: at91: sama7: add sama7d65 i3c-hci

 arch/arm/configs/sama7_defconfig | 2 ++
 1 file changed, 2 insertions(+)
