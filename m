Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B122EDD72
	for <soc@lists.linux.dev>; Tue, 11 Nov 2025 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854953; cv=none; b=cWcux+/NV9FNBg6BJS4vlpaE8lIk0mCeSlflFJNU6NhPl29Glm/dkduWq26Eh1AdqR0zyFABvDTjuZnwlh+Dhvh3ew1GCbjV6qjZpDRO5AMzMQL0x/ha8Z7p6vmxL83n59s0RU83W/pi7In768vxLn79ae+KapN2OoOrlyNgiWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854953; c=relaxed/simple;
	bh=taqJ88tgrMmaM/VXubOrq+GZSJDLUZiefDWipANLyKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k3pr/w6G0PVtZhCYlkOlMqZvrckyQiiY6GLcarwX6QSyubM+YHwUM7XFb88apartMlZkQGq785NbGcWXcfLNIN9Tk8/6hfj6ucwNZttrc29jEmdAcSHy9uHMQJJp/uxdlK5NEAm3TxNnlgxe7JS2tMgO3wUE6B8XhZTGQRDd8gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DCv/dtCZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DCv/dtCZ"
Received: by smtp.kernel.org (Postfix)
	id B89D5C16AAE; Tue, 11 Nov 2025 09:55:52 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F66DC4CEF7;
	Tue, 11 Nov 2025 09:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F66DC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762854949;
	bh=taqJ88tgrMmaM/VXubOrq+GZSJDLUZiefDWipANLyKE=;
	h=From:To:Cc:Subject:Date:From;
	b=DCv/dtCZRxcj7lR8ewssFjoHh89wj/51YqeF0kLDFqy670u7JocDna67GU7DR5bW6
	 tjnYrAyVlQ68mnakzipsmM5ekJ3LAqdnHyBO21VVPfqOt7RHDbgecdwC69YaU/CHzL
	 vzwBZUk1uybmClxTxv3C1WLaPmoyvA9eqjKIiCCZs5hLPBxsnDbsl0HH+T1193Kmk5
	 ZCA4dGkx1S15IpB6xCkr0ezhH6z0Rq7pJzwxuzW3G7RtN8sMI7qBh1Ld3fFc6ys/6j
	 jc0H4Gnr1cD8GuXF11W84qUa8NJQr21FxJ9vRdwJZkXjKWgtbjpbExbO5k24R62NZQ
	 LthG1SlvY3bhA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDD1517E130A;
	Tue, 11 Nov 2025 10:55:48 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
Date: Tue, 11 Nov 2025 10:55:36 +0100
Message-ID: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-arm32-for-v6.19

for you to fetch changes up to 7f637d718752f1b821f90170bf841c4d924b382b:

  ARM: mediatek: add MT6582 smp bring up code (2025-10-13 11:46:58 +0200)

----------------------------------------------------------------
MediaTek mach ARM32 updates

This adds support for the MT6582 SoC and its SMP bringup code.
This SoC is found in old smartphones and tablets from various
manufacturers.

----------------------------------------------------------------
Cristian Cozzolino (2):
      ARM: mediatek: add board_dt_compat entry for the MT6582 SoC
      ARM: mediatek: add MT6582 smp bring up code

 arch/arm/mach-mediatek/Kconfig    | 4 ++++
 arch/arm/mach-mediatek/mediatek.c | 1 +
 arch/arm/mach-mediatek/platsmp.c  | 1 +
 3 files changed, 6 insertions(+)

