Return-Path: <SRS0=RVG4=MC=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9992EC04FFE
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 14:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B5FAC4AF1A; Mon, 29 Apr 2024 14:02:54 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D941C116B1;
	Mon, 29 Apr 2024 14:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D941C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714399368;
	bh=X7IGfbGsT7uQlyjPuobKXUVEAqPWoHd5DZQUwqLMYxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p9Ze86BtQwfVuiWA3h/zaN/siAvRGSrjji4wkDfDr7563mvAdw1zVDbAOll3Zh0AY
	 JZ8oq/D6skwoHNJraTfsroVRToR1sNcvHF4LTRcVGBX0GZZ3O2FbRApVSZUvBLBQoI
	 TzD6vfD4G9CKX1gaa/xvyGdL91q/At/MvQYmjp+B5gqLg1EuMXq6j9ZiobMTPVZIO4
	 rnNJi5L4lUfY7NzeFmZGgHJyVD2WUvqRPC3z4rZjibe8OKstbiB+YmwC/HdAqRo9P0
	 JN2fvk8KCiyscXsZmEmdiYtcEibEFvHSQ5X2l9/Xduf8ZZUK9/0g55tsIO6bLvQt9J
	 nmPqh8lerO0VQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 228453781453;
	Mon, 29 Apr 2024 14:02:48 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/2] MediaTek driver updates for v6.10
Date: Mon, 29 Apr 2024 16:02:43 +0200
Message-ID: <20240429140245.238210-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429140245.238210-1-angelogioacchino.delregno@collabora.com>
References: <20240429140245.238210-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-for-v6.10

for you to fetch changes up to 8a87e1d21ef84fe68913aeba9838222422eef4d7:

  soc: mediatek: mtk-socinfo: Correct the marketing name for MT8188GV (2024-04-23 12:16:56 +0200)

----------------------------------------------------------------
MediaTek driver updates for v6.10

This adds a much needed cleanup for the MediaTek CMDQ helper driver and
also some more helper functions which will be used in drivers using the
MediaTek Global Command Engine (GCE) HW.

Also adds support for MT8188's VPPSYS mutex for MDP3 support, a new SoC
in the mtk-socinfo driver and changes the marketing name for the pre
existing MT8188 SoC.

----------------------------------------------------------------
AngeloGioacchino Del Regno (3):
      soc: mediatek: socinfo: Advertise about unknown MediaTek SoC
      soc: mediatek: mtk-mutex: Add support for MT8188 VPPSYS
      soc: mediatek: mtk-socinfo: Add entry for MT8395AV/ZA Genio 1200

Chun-Kuang Hu (7):
      soc: mediatek: cmdq: Fix typo of CMDQ_JUMP_RELATIVE
      soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()
      soc: mediatek: cmdq: Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
      soc: mediatek: cmdq: Add cmdq_pkt_jump_rel() helper function
      soc: mediatek: cmdq: Add cmdq_pkt_eoc() helper function
      soc: mediatek: cmdq: Remove cmdq_pkt_flush_async() helper function
      soc: mediatek: cmdq: Refine cmdq_pkt_create() and cmdq_pkt_destroy()

Jason-JH.Lin (4):
      soc: mediatek: mtk-cmdq: Add specific purpose register definitions for GCE
      soc: mediatek: mtk-cmdq: Add cmdq_pkt_mem_move() function
      soc: mediatek: mtk-cmdq: Add cmdq_pkt_poll_addr() function
      soc: mediatek: mtk-cmdq: Add cmdq_pkt_acquire_event() function

Jason-ch Chen (1):
      soc: mediatek: mtk-socinfo: Correct the marketing name for MT8188GV

Nícolas F. R. A. Prado (1):
      soc: mediatek: cmdq: Don't log an error when gce-client-reg is not found

 drivers/soc/mediatek/mtk-cmdq-helper.c | 163 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------
 drivers/soc/mediatek/mtk-mutex.c       |  41 ++++++++++++++++++++++
 drivers/soc/mediatek/mtk-socinfo.c     |  14 ++++++--
 include/linux/soc/mediatek/mtk-cmdq.h  | 139 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------
 4 files changed, 292 insertions(+), 65 deletions(-)

