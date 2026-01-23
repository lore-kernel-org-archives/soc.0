Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D84930E0F8
	for <soc@lists.linux.dev>; Fri, 23 Jan 2026 11:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769167057; cv=none; b=PKYJFyQkw0kMi/t4f3xNSxlndV+ud/fhl4xx4mllhkeabDLkcO6rrqdZbSt4PPZGDjqKT7cIMeXw0n5XEyBeLbFTgzST8rWFmTLwz3Bcwg17MQCIHFY3oczrTvGrjASZOCfGlVPjhvTPnueKOAR+U5pjosW0yaan6K/HOOuE29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769167057; c=relaxed/simple;
	bh=7DXAoiafUS6LRz5IInivBEJPaHy0O8Ijya9uB4UCJ0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPSOtlbi5xLvoFlhZ5O8l1P5qY/n6hlXaG+mXJ5OrbbPsFp0qSunfVyKK2M7Jz63IfqzrmQ6b/CwFqK+E2aa7UTAZQ7Z9VpsLb11CWhzzKrHMtwiUr/OPlsQTRX1y8xv4m7Z1kC0oR+BrWT2yhimzF1MkOD66XvlFzZOEwP9x4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DXbkB8W2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DXbkB8W2"
Received: by smtp.kernel.org (Postfix)
	id 34A6FC4AF0B; Fri, 23 Jan 2026 11:17:37 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B896AC19425;
	Fri, 23 Jan 2026 11:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B896AC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769167048;
	bh=7DXAoiafUS6LRz5IInivBEJPaHy0O8Ijya9uB4UCJ0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DXbkB8W2xXsmPVgC/cZdkiYMVK9KqhjqCkXeAvfFmg0pz7qpYwhyXiC3eqDrhkkM9
	 Gf00ttE4AIyFzyNSzSMGB7Eh7AyEHuO386up1qi/bNGi3UchgoGIz+9gXU/ZtEpBVJ
	 Z0xdjIstROC7YVt78hihkeB38inc+3n9UrwKa7XDauPBlsx6ks4Dm1ALOvQS73r+kR
	 6C0ISScIY6UBg2qsNHkdkdvOY/qlf5nZ8sV7wphwa0GZcyrin1BNHYNGI1DN5vGFgP
	 Lr6g8NCeqo0qGyNWpY8UGUlBw0n+QPglNbBBGwyRyftBxcoz0dLuhmwHR9QISscO48
	 2aQmtAGm/O12w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 100CB17E0E3D;
	Fri, 23 Jan 2026 12:17:28 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,3/3] MediaTek defconfig updates for v6.20
Date: Fri, 23 Jan 2026 12:17:22 +0100
Message-ID: <20260123111724.28631-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123111724.28631-1-angelogioacchino.delregno@collabora.com>
References: <20260123111724.28631-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-defconfig-for-v6.20

for you to fetch changes up to 81841b41a8bcd024f77a15d0634bc229d4d44db1:

  arm64: defconfig: Enable Mediatek HDMIv2 driver (2026-01-07 12:13:46 +0100)

----------------------------------------------------------------
MediaTek defconfig updates

This adds a single change, enabling to compile the
MediaTek HDMIv2 driver as module.

----------------------------------------------------------------
Louis-Alexis Eyraud (1):
      arm64: defconfig: Enable Mediatek HDMIv2 driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

