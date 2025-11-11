Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725EA2FC037
	for <soc@lists.linux.dev>; Tue, 11 Nov 2025 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854953; cv=none; b=efcS9roCyRcLehrvGJgdv72tNNsUgB/C63jrSpaS0Kmti3KzTTIC1zbCTzdihwvnf/9IYomULgcGsz5tMci3+O7jPoysHRH4vHVXll1+nDO4bLEybrzpuPeSp2rzZI83ryWoao/Xz/3hohMcXL9Y/fYh1AaSz/ScmrArJ/ns+j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854953; c=relaxed/simple;
	bh=ylPjEOKl3WZwpNgjv70BagSMYXICu9kbcOmPFeUUKno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6CJvP663AlYuYSeKr2WXKkTVs7Iw3VXNiG15OyzXUOwRcK1bgryeM2Uom04YhYh3D+raF2PqID35A+qHOkxgyZ5N+6eTCCHblsvBh4ZqLrT/3rD2mTk7AlacoDCxLdBnt9Nc5OjcEcyWJyWuxMZSSnfb03o4wbsRJo7MraYahs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YqGM0dIM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YqGM0dIM"
Received: by smtp.kernel.org (Postfix)
	id 248D6C19422; Tue, 11 Nov 2025 09:55:53 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B898C4CEFB;
	Tue, 11 Nov 2025 09:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B898C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762854949;
	bh=ylPjEOKl3WZwpNgjv70BagSMYXICu9kbcOmPFeUUKno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YqGM0dIME6f9KP+Ybwbi4PgChhlLwAQf/xmn8HeNH8kaF2ndY31lpETByM2FTHoAR
	 AhFxOtfMETg7/k+EBey763HKHULqTurrf5xyIZIKOdKzJ3Ju0AoQRaYEbe4/dCvhuJ
	 bxQMxJliBswdS3wka5vTUklkVK4hR5kENXkIptaji2SOqvIM+QTh6mgMYrBGKt3/+D
	 UxzOHP1OLnkPrpTZ3u7I0XjuGbrcJ82qOUM9HJasF0OBtALR/vrPVCFXIiCHySX49r
	 Lx145vIU2deO/NFT7s1Q0dG8o5jKC0bU4I41na+MszXGyPGwIF4dATwGkr4uGCis3d
	 y1xdlVKnjG7Ww==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6CA8117E1318;
	Tue, 11 Nov 2025 10:55:49 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/5] MediaTek ARM32 DTS updates for v6.19
Date: Tue, 11 Nov 2025 10:55:37 +0100
Message-ID: <20251111095542.13958-2-angelogioacchino.delregno@collabora.com>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts32-for-v6.19

for you to fetch changes up to 5416aeee4ef761b79d2e1c35f6d9a35bf3104709:

  ARM: dts: mediatek: drop wrong syscon hifsys compatible for MT2701/7623 (2025-10-14 13:47:13 +0200)

----------------------------------------------------------------
MediaTek ARM32 Device Tree updates

This performs a cleanup of the MT6582 devicetrees and adds support
for secondary cores bringup on this SoC.

This also introduces basic support for a new machine, the MT6582
Alcatel "yarisxl" Pop C7 (OT-7041D) smartphone, with support for
booting into a initramfs with UART console output.

----------------------------------------------------------------
Christian Marangi (1):
      ARM: dts: mediatek: drop wrong syscon hifsys compatible for MT2701/7623

Cristian Cozzolino (8):
      ARM: dts: mediatek: mt6582: move MMIO devices under soc node
      ARM: dts: mediatek: mt6582: sort nodes and properties
      ARM: dts: mediatek: mt6582: remove compatible property from root node
      ARM: dts: mediatek: mt6582: add mt6582 compatible to timer
      ARM: dts: mediatek: mt6582: add clock-names property to uart nodes
      ARM: dts: mediatek: mt6582: add enable-method property to cpus
      dt-bindings: arm: mediatek: Add MT6582 yarisxl
      ARM: dts: mediatek: add basic support for Alcatel yarisxl board

 Documentation/devicetree/bindings/arm/mediatek.yaml   |   1 +
 arch/arm/boot/dts/mediatek/Makefile                   |   1 +
 arch/arm/boot/dts/mediatek/mt2701.dtsi                |   2 +-
 arch/arm/boot/dts/mediatek/mt6582-alcatel-yarisxl.dts |  61 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt6582.dtsi                | 142 +++++++++++++++++++++++++++++++++++++++------------------------------------
 arch/arm/boot/dts/mediatek/mt7623.dtsi                |   3 +-
 6 files changed, 138 insertions(+), 72 deletions(-)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6582-alcatel-yarisxl.dts

