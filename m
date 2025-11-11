Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1335C2F693E
	for <soc@lists.linux.dev>; Tue, 11 Nov 2025 09:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854956; cv=none; b=ClBg2/NL3980xLfZbjhMq61IH+lH+HG8wZ25/X19Q6g93KRkNlATNG66z/JNgK9L+/NVXkt4vL9RNgjFh5WJqFcBv1zbMWG6JHZ1usyKKRE1z9cb8ANVDvbqufszFv0Ffc2Tjm1wuFYNUguX/fvWoSXI+8WP4irPNvbOggI7PVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854956; c=relaxed/simple;
	bh=SsJCBdcz+P9WpOBbZA/R1/r8Ky8u/TUwqI5zNkruFjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVIlglhkr385e8HtwYUEm4T20ja5VcU6/f+9oucJc3j5ap6aFJqpMgGBZuAwy1M5sOaleF6aXF4J3MtNWieyumwEYBxWXnDFg7aRFk1HCywVGxMIin/3V9XGZD1vWWGp3AYmBjU7mQ+NbOxtyNS8OxlMfYTRaYSkC6ZnQH9MgvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QZvo3rNU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QZvo3rNU"
Received: by smtp.kernel.org (Postfix)
	id B031AC4CEFB; Tue, 11 Nov 2025 09:55:55 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D418AC116D0;
	Tue, 11 Nov 2025 09:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D418AC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762854951;
	bh=SsJCBdcz+P9WpOBbZA/R1/r8Ky8u/TUwqI5zNkruFjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QZvo3rNU3daUtzbV3PzpidrINXXvbxEDvI/xq13hXdv7/4etzdz26liBLJ/tqNqnh
	 TpYvbWUEeuZOPC0qHSn37jm044oAj6gf+0p5m5VnoQf5QpE0xlf8kRIN+mzr1YGVds
	 9BBjTBcxcR0coSsXP1VJ2z1lLxZezeBWFL5k8qv0tEz2kkqIwLM4o+nhCQqbQy3ddP
	 WpEZ5ekYrARjX61fdWKLPNnJAZ3G6I6HXbQr1nn9fKr5TQQcbdSZ6uZZmKQpWJITnD
	 qWTsEPHDlQR3/FZM0KNapylvSDSqD2akx6WAJGajWnIq3GARdR3CpI957rnW77iF8F
	 Rj9ZFibMHVsfQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C252C17E13C1;
	Tue, 11 Nov 2025 10:55:50 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,5/5] MediaTek defconfig updates for v6.19
Date: Tue, 11 Nov 2025 10:55:40 +0100
Message-ID: <20251111095542.13958-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
References: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-defconfig-for-v6.19

for you to fetch changes up to b59a508c1f5fdb3fdc690edebe815d59b04491d0:

  arm64: defconfig: Enable UFS support for MediaTek Genio 1200 EVK UFS board (2025-10-13 11:35:35 +0200)

----------------------------------------------------------------
MediaTek defconfig updates

As MediaTek boards with UFS appeared some time ago, this adds a
single commit enabling the MediaTek UFS driver, allowing those
boards to boot over UFS as primary storage.

----------------------------------------------------------------
Macpaul Lin (1):
      arm64: defconfig: Enable UFS support for MediaTek Genio 1200 EVK UFS board

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

