Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203B9201034
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 08:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752223028; cv=none; b=R9HDwvJv2TrJ2mrFGKmy69gctblbxatvoowhTWEu1HDUIyFvBVcY47MQjWomJGgVGmuxDSMvCbtEWLsucjku2CeEWYZbxRy8JEM0AWuzHXgfkPbKaz0771sABgZYgdU7kzBgZl0Gi3up5z7bYExEroVw0RS0tiyZCycyzBU36zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752223028; c=relaxed/simple;
	bh=hAaORvtwWlpuxH12pfYKOOV0L21hWokW/goaLX76tHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8m/56XEi6b30FBDFhZXgPrH6e1SDbLX1laGyu8SYo+OFsaFT0nNXdg2SW+D5gKovJAyugQUpMoOnI0qRBR6okQPA3aMNJrBHuE1EO1ybbo6PBxbLBz5UT7IXmEsChJvEIJtdUFPrEwnO0XzaXseSIRl5Y8SaPqK3AlNtVVnJaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VJyS6C/7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VJyS6C/7"
Received: by smtp.kernel.org (Postfix)
	id 14344C4CEF9; Fri, 11 Jul 2025 08:37:08 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6817C4CEEF;
	Fri, 11 Jul 2025 08:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6817C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752223019;
	bh=hAaORvtwWlpuxH12pfYKOOV0L21hWokW/goaLX76tHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJyS6C/7HScUQBY7HlIASQgdYBNtKqNZ/T+dwmsDb/qoqmJIhLqQOazYiH8FTdkja
	 Yz0W7bokegZr0DV1vqZInUARQ5edJ7YSKIx/hhYp/CGFv+GWyx2VuN0qKcg6q0hgLg
	 xthFHibCzzLUZtFZoBhdv2gZpzjMA7YtZCaOiAtzlOF9ntbSVFL33Yk86cS7wY1/xD
	 9+fZ2rpJt3lMWrxvf9C5t75o3nNJy1vemHHSlQCj6xPoB6ypIZJUmTmiatSel+rZ7t
	 06mTl/iCsPPo3RTkx77RMGX9Iasr+DUWJ5T9lC5j5jaY+ZSM12F5348BlfsScysez4
	 RiljspQoOZNMg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E33217E0FA8;
	Fri, 11 Jul 2025 10:36:59 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/4] MediaTek ARM32 DTS updates for v6.17
Date: Fri, 11 Jul 2025 10:36:46 +0200
Message-ID: <20250711083656.33538-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
References: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts32-for-v6.17

for you to fetch changes up to 5a8e7b4eaaa232d747517fe34ba6867139a4cea8:

  ARM: dts: mediatek: add basic support for Lenovo A369i board (2025-07-11 10:31:43 +0200)

----------------------------------------------------------------
MediaTek mach ARM32 updates

This adds support for the MediaTek MT6572 SoC, found in various
old smartphones and tablets from various manufacturers.

In particular, this adds a board_dt_compat entry for this SoC
and its SMP bring up sequence to enable secondary cores.

----------------------------------------------------------------
Max Shevchenko (7):
      dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT6572
      dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
      dt-bindings: vendor-prefixes: add JTY
      dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
      ARM: dts: mediatek: add basic support for MT6572 SoC
      ARM: dts: mediatek: add basic support for JTY D101 board
      ARM: dts: mediatek: add basic support for Lenovo A369i board

 Documentation/devicetree/bindings/arm/mediatek.yaml                                |   5 +++
 Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml                             |   2 +
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml                   |   1 +
 arch/arm/boot/dts/mediatek/Makefile                                                |   2 +
 arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts                                     |  61 +++++++++++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts                                 |  56 +++++++++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt6572.dtsi                                             | 108 ++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 236 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts
 create mode 100644 arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts
 create mode 100644 arch/arm/boot/dts/mediatek/mt6572.dtsi

