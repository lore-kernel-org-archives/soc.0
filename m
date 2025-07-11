Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF3201034
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 08:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752223028; cv=none; b=kvez44NDehjmvLY/rt9VK14SKZ1ugm+R7ZcVRr5ShA+2FJlum4oD3LrFq78GqO5IUscQQLqttoK5EOGTtECbqvYJLx9TI6gP1Ldvd9gqlBoBMFmcImmSZRGYoxtzdididSgmFH/WCqLB0REx63YKMQC3bX5fbKnJkeEbZdY4m2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752223028; c=relaxed/simple;
	bh=y0aPRwANdifwMCZnj1MfkC/ifenoxmwVdFLzlQuwxU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eFnPQ0llYphjWcfCS8KA+jDPZm1v7TktK+HwvvTOzmJMc9AopWyiqrShvsqi6JJA0+S/ghHnTUpfFUuROSj6+YQOAnN9XDt5xfmyAQvnzz9+AFOCbKf7jZItsa3Gw9FsC8QBUZOrddrLV+so6qX1f9BcDjXSScnPfjNSViKnzow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=II1l4k+g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="II1l4k+g"
Received: by smtp.kernel.org (Postfix)
	id 12086C4CEF8; Fri, 11 Jul 2025 08:37:08 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A67E5C4CEED;
	Fri, 11 Jul 2025 08:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A67E5C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752223019;
	bh=y0aPRwANdifwMCZnj1MfkC/ifenoxmwVdFLzlQuwxU8=;
	h=From:To:Cc:Subject:Date:From;
	b=II1l4k+gHS1NleBNhkPr2q8EcW/7zv/oI/OSLcIrDt1AEZKVqOn7idHE7W6tcS/XO
	 hCDPK9vbn/WNilDEUif61OSnuUYr56GTqEo5Hjs7Lz7DdZNN84D+arSB13UZm89XHw
	 wRw+ZwXzuo+WlEfRP53cTbgoNoHvZUDr8zGXCypYUeEFSzzrgaADUQR3g78YOxO3fK
	 jmbRXSqW1SOPTFWufCASSbxSjVg8pspTStWpG7+mYiRyOJ7U4tpqBmB/jPFI/ciUk+
	 RG00SaL3otd7b5uImQWaRc8qMxtY5FM8Fh69ZkfWzAIccauPcxDmXylLrY+iL6lNKG
	 MHXrPHZ2GPrKQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A42EB17E0EBD;
	Fri, 11 Jul 2025 10:36:58 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/4] MediaTek arm32 updates for v6.17
Date: Fri, 11 Jul 2025 10:36:45 +0200
Message-ID: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-arm32-for-v6.17

for you to fetch changes up to 20e672e65844469fc36a52326dfea80f1068705a:

  ARM: mediatek: add MT6572 smp bring up code (2025-07-11 10:04:08 +0200)

----------------------------------------------------------------
MediaTek mach ARM32 updates

This adds support for the MediaTek MT6572 SoC, found in various
old smartphones and tablets from various manufacturers.

In particular, this adds a board_dt_compat entry for this SoC
and its SMP bring up sequence to enable secondary cores.

----------------------------------------------------------------
Max Shevchenko (2):
      ARM: mediatek: add board_dt_compat entry for the MT6572 SoC
      ARM: mediatek: add MT6572 smp bring up code

 arch/arm/mach-mediatek/Kconfig    | 4 ++++
 arch/arm/mach-mediatek/mediatek.c | 1 +
 arch/arm/mach-mediatek/platsmp.c  | 7 +++++++
 3 files changed, 12 insertions(+)

