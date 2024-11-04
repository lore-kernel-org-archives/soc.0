Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87A61BBBE3
	for <soc@lists.linux.dev>; Mon,  4 Nov 2024 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730719601; cv=none; b=WR7cTR6vjlKl9HeEGv8xwO/6Jjll7NAeKSNd1eKKijJylMkrHCNR6RulBz1bEYe2sTlRwYjGWbSwNc6Cqb+/l39TJdTBj1j/JehVOQuYxI6objAM5I6/tZ0QOs0SV+XOBQ6jcYoD/i+D7Nkrm/He4yTnHt5oG6FmswBAMikGzE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730719601; c=relaxed/simple;
	bh=bF7hHsF3nFkMIP/dp3aAmjmr+zxCA1jW5rykrtwikWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PErc+68Xg3dhZ9WXBQyIJulyWOrwftye3++cBkXm1mJ63pv0ZgG3Db9UIv5PSNKQYaF8hw53NemswH/ORmvrPuw7bvZAJCbQUJHd55TLqamkE7tQTqyXy0qQZ1f7X+Gu/RB+76Hl/skRoI1lwBb5o+Djhdepvobstd3jwmLpzrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WA0LE1Lv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WA0LE1Lv"
Received: by smtp.kernel.org (Postfix)
	id 3F812C4CED2; Mon,  4 Nov 2024 11:26:41 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE1E0C4CED1;
	Mon,  4 Nov 2024 11:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE1E0C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730719598;
	bh=bF7hHsF3nFkMIP/dp3aAmjmr+zxCA1jW5rykrtwikWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WA0LE1LvkSo8o5z422v06LGKzz6D6c08A0MdbOyw99zKPEXCeOPFGTeQ3FbkNe1n2
	 wQos9MoF71wgcquR4rknI8mX5OOw2GJ3DCWhp/fS/u5jq1eJFNYQ7PvkQrXDTQTF6/
	 9yjF0L7JcEL+DwZal6250r//yABrQ7DF8qZVlkrAbChISGWyLsnL1rsZQe0rD1QtcD
	 nV/xR1J6nSk48u1f0mSokRYhM2wSf+l6pZnPmmBhas8EredjYRpI0v13WWAqKQqlfT
	 E84JXYPDXJJ+nCIuPrMdKp2xIpi20unIia+Fx05zbs8/e40WklBjItOxBkwUoHJaH1
	 /A2dqfwrkvpAg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D8CBA17E3600;
	Mon,  4 Nov 2024 12:26:37 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/2] MediaTek driver updates for v6.13
Date: Mon,  4 Nov 2024 12:26:21 +0100
Message-ID: <20241104112625.161365-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241104112625.161365-1-angelogioacchino.delregno@collabora.com>
References: <20241104112625.161365-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.13

for you to fetch changes up to a1643ae9b3e3364edbb6cf285c5f2cf5d60336e6:

  soc: mediatek: mtk-svs: Call of_node_put(np) only once in svs_get_subsys_device() (2024-10-21 16:00:52 +0200)

----------------------------------------------------------------
MediaTek soc driver updates for v6.13

This adds support for the MT8188 SoC in the MediaTek Regulator
Coupler driver, allowing stable GPU DVFS on this chip;

Moreover, this adds a new MediaTek DVFS Resource Collector (DVFSRC)
driver, allowing to enable other drivers (interconnect, regulator)
which can now communicate with the DVFSRC hardware.

Last but not least, this includes some cleanups for the CMDQ Helper
and MediaTek SVS drivers

----------------------------------------------------------------
AngeloGioacchino Del Regno (4):
      dt-bindings: soc: mediatek: Add DVFSRC bindings for MT8183 and MT8195
      soc: mediatek: Add MediaTek DVFS Resource Collector (DVFSRC) driver
      soc: mediatek: mtk-cmdq: Move mask build and append to function
      soc: mediatek: mtk-cmdq: Move cmdq_instruction init to declaration

Markus Elfring (1):
      soc: mediatek: mtk-svs: Call of_node_put(np) only once in svs_get_subsys_device()

Pablo Sun (1):
      soc: mediatek: mediatek-regulator-coupler: Support mt8188

 .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml       |  83 ++++
 drivers/soc/mediatek/Kconfig                       |  11 +
 drivers/soc/mediatek/Makefile                      |   1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c             | 230 ++++-----
 drivers/soc/mediatek/mtk-dvfsrc.c                  | 545 +++++++++++++++++++++
 drivers/soc/mediatek/mtk-regulator-coupler.c       |   1 +
 drivers/soc/mediatek/mtk-svs.c                     |   4 +-
 include/linux/soc/mediatek/dvfsrc.h                |  36 ++
 include/linux/soc/mediatek/mtk_sip_svc.h           |   3 +
 9 files changed, 787 insertions(+), 127 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
 create mode 100644 drivers/soc/mediatek/mtk-dvfsrc.c
 create mode 100644 include/linux/soc/mediatek/dvfsrc.h

