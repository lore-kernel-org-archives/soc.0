Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0759E27B50C
	for <soc@lists.linux.dev>; Tue, 20 May 2025 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747741445; cv=none; b=CPYxhYe03f+fzpi80RD4326G+eKKC3KnXDlsahY9TTCXZjVpG77FBbd1zEMs6LdNxWFyyFTiJ21Iu1Ho+G5kv6ym26JLKeBQ/j3b42qa53RSjsSBniIDZDgiv7lNOKDfjDaq5f/WM+qj3Re6Sa7cYWi9QspMdA1RqSxOlLxYyWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747741445; c=relaxed/simple;
	bh=0reCPQbdTGw1NjQ0NvjfPr/9W8uADPNGHMLSJN9cyeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TrpXM29+TjB4MmyLYJWkTH4DoFz0w5oEgV9qkSKbCb3n4Vy8kl+6GOBUJ+Rwio1rTdhKlhA3g1jLE+di1RTrOhzfMyndGegftTGtpKXKwNptPz0K5f6YOXzxCdYnM+wYpGZ8BNrtWO62mbqO3lcrD8eGearj1PY4t+W5ZejNqbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CcinnoKG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CcinnoKG"
Received: by smtp.kernel.org (Postfix)
	id 9A0C2C4CEF1; Tue, 20 May 2025 11:44:04 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1977FC4CEEB;
	Tue, 20 May 2025 11:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1977FC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747741441;
	bh=0reCPQbdTGw1NjQ0NvjfPr/9W8uADPNGHMLSJN9cyeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CcinnoKGIXH6RWXq0MfdR/4J1GoUl5wR6fLOhJa7D1vaee3Ulrt/mWq9niBpts65K
	 T//eWPLtHAroDs+mOm6OW8yNRfrkTT0gd4zCkshOilF40yzuRxqcIc8TGxJzXvMbPC
	 Ggs/7ezLg37ZH7RF6DNvNWHUHUk3jEJrHuixEWvRHSQJ+6iF2zP4tllIsslukHD+T3
	 HYoQ6Eo4639ISKGYk2/1OA87ISOCBLm+NZBKnqi8aq76L5Am34ep3RS/o/NKmG3gXu
	 zG2SXxZr36+bXvRLIXynwFolPF8lIIXNty01VTFVlsS0tn/jlB7IfmlZVpgxopHyKO
	 e64heN/6ynZeA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B90E917E0E2D;
	Tue, 20 May 2025 13:44:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/2] MediaTek defconfig updates for v6.16
Date: Tue, 20 May 2025 13:43:52 +0200
Message-ID: <20250520114356.1194450-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520114356.1194450-1-angelogioacchino.delregno@collabora.com>
References: <20250520114356.1194450-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-defconfig-for-v6.16

for you to fetch changes up to 543e0ecee19ec6fe7bca894057f7f9ae063dd5a4:

  arm64: defconfig: Enable configs for MediaTek Genio EVK boards (2025-05-14 15:47:58 +0200)

----------------------------------------------------------------
MediaTek ARM64 defconfig updates for v6.16

This enables some drivers as modules to enable fully booting
some of the supported MediaTek boards;

In particular, this enables the following drivers as module:
 - PHYs for PCIe, HDMI, DSI and DisplayPort for all boards
 - MediaTek UART DMA Controller, also for all boards
 - MDP3 driver for MT8186/88/95 (Chromebooks and Genio variants)
 - Auxiliary ADC for the MT6357/58/59 PMICs found on both Genio EVK
   and Chromebooks based on designs with MT8183/86/88/92/95 SoCs
 - iTE IT5205 Type-C USB Alternate Mode Passive MUX, found
   on both Chromebooks and Genio EVKs with MT8188/95
 - Richtek RT1715 Type-C PD Controller, found on all Genio boards
 - Himax HX8279 DSI panel DriverIC and KD070FHFID015 panel, found
   on various revisions of the Genio Evaluation Kit boards.

----------------------------------------------------------------
Nícolas F. R. A. Prado (1):
      arm64: defconfig: Enable configs for MediaTek Genio EVK boards

Vignesh Raman (1):
      arm64: defconfig: mediatek: enable PHY drivers

 arch/arm64/configs/defconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

