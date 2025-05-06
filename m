Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D948D266F00
	for <soc@lists.linux.dev>; Tue,  6 May 2025 09:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523077; cv=none; b=twnjYP6xqk+6Hp5+CF2nokumx9oXyGr1Z5aH8Vnf2lRNfv6uLYDntgf+5xoRp9dT842g/3WDYHaOw4HbLzI+xyZFYDycUuuB6oS2HSTEvr4Yu+72St5B86BSRRBrRISjPpctbfaygKNRFsQUxXZGAjrX79yyBJ6EAL5UaSnfQuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523077; c=relaxed/simple;
	bh=ILA+Es+srywhqN6T/FxqHIcvCX3dCdoWJHezmXu6Ewo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMTKOfqMhgTYHHlsH05JYuDl95nZfF1c59+gyJEHU3sTA+QeXHw8AA4Nu/MJ2UpFZuAICyFKzyAJTp/d1RInuYS9kXmyfJG0Zw7UIDBCLRE7ERA3M3hcW7pve2LcaG4Taq8HT1owTSyZbPbMjnZgWbfjqDq2S+tpIwkVA/Fm9NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CiHIKccN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CiHIKccN"
Received: by smtp.kernel.org (Postfix)
	id 59C10C4CEEE; Tue,  6 May 2025 09:17:57 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFA40C4CEED;
	Tue,  6 May 2025 09:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AFA40C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746523073;
	bh=ILA+Es+srywhqN6T/FxqHIcvCX3dCdoWJHezmXu6Ewo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CiHIKccNtfYIsFD9mnybHbn0/VRiEV8Kz1yRVovgMHjVkvse3uzWlXWKXwOs1Vozz
	 QoTJGdYz89zq9Bz7ArrLsgzjjt2Q0/PnGRg8x3UAlqzeNQcYSRe7xx68L9pUoZC9eM
	 Rz6Qfij7/0rEp2gG6E0KZwgKMnnkbvDcS5jhpr8TyV5RXWIidT5K9gnELEM2wtWMVo
	 wR/BIlHtzMz668hENUZkwRe8+dheSbNve+AvLXKflubmfR/TtXHifvODaGu93votM2
	 OsYLrfm2KtnFdzszMPjRLbJVoM7Dns9sZ6QzFnI9C0dbGJIpVt5UwHNfTkOtrdyuYb
	 ReMxXcW9enV1g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7EB4017E088B;
	Tue,  6 May 2025 11:17:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/2] MediaTek driver updates for v6.16
Date: Tue,  6 May 2025 11:17:33 +0200
Message-ID: <20250506091736.125733-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
References: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.16

for you to fetch changes up to 69d63d19eda7792052f5f694f154898fc00d60ae:

  soc: mediatek: mtk-dvfsrc: remove an unused variable (2025-04-24 09:15:01 +0200)

----------------------------------------------------------------
MediaTek driver updates for v6.16

This brings some cleanups to the MediaTek DVFSRC driver, commonizing
the bandwidth constraints platform data, and also adds support for
the DVFSRC hardware found in the MediaTek Dimensity 1200 MT6893 SoC.

----------------------------------------------------------------
AngeloGioacchino Del Regno (3):
      dt-bindings: soc: mediatek: dvfsrc: Add support for MT6893
      soc: mediatek: mtk-dvfsrc: Rename and move bw constraints data
      soc: mediatek: mtk-dvfsrc: Add support for Dimensity 1200 MT6893

Arnd Bergmann (1):
      soc: mediatek: mtk-dvfsrc: remove an unused variable

 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml |  1 +
 drivers/soc/mediatek/mtk-dvfsrc.c                                          | 53 +++++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 44 insertions(+), 10 deletions(-)

