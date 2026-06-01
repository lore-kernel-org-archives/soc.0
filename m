Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD19C38E8BD
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780305161; cv=pass; b=A1f2AoaWDWHrPRx2VXWthUrZ/VXzeS4bjmEI9udgz8hTyoOv2ffv/60pIcooSTKy15g02xf1DY7VlBopk/PAKQ8di/m82t9sReeU8JHzBFqs7X15Hk0AgrfsFC8IECVkNhlazDQZXTjQfyIBlQgzvoubLD7HqP4xqLjH0R06OEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780305161; c=relaxed/simple;
	bh=ZMQig1G0kI/9KDHbMpaDNt380R1SRF5p144eDOFLNgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JThzecw5ovo+724CmidTJEs6zeNdlVRjJe2Q1w3S7hMjCsYQAv0kNJAWL+s8SeXVW0L/+52WQCvdZpRi+72vs2qmUMbTc3/nNXXy9uKW9X6fmHSJQCyDLMVGpN4xuBGlMhgV1bpSmuctS+2vP9d1X4c0bc6PwGfaRungSwX4/6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pxmwyCIX; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pxmwyCIX"
Received: by smtp.kernel.org (Postfix)
	id 711E11F0089C; Mon,  1 Jun 2026 09:12:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780305159;
	b=OpZ78aDJF/krFFkeu0CfZHw/KOhsYlPqxYCp63r5+EnVzYt3Y2raxvuCLUyI7GEpO6J9
	 YjE6FzxULtQvztCCmryZqa4fYqqY6NRXp/XKtXtmt73LezmxW0joqOs62K41w/VB8MUpB
	 iQNsnLgr/W/PaQK1bnepGtJSxUavM8wFhKe/Ggt6obnvtkqjG02zki6P/TTOM0qbmrWTO
	 /nGX0QMOeAIsEV7nC1RaI8KHJJGyGJuhGaM+VoecgHjs3iolqLEHEqtrsXA0b1bgc5CaW
	 V12UJDRgizfUJ8ZZtAtBrrUAJCI3cUIrsdZPg5mX1Zx8MTAY2qM28NGz1YPKwDJgl9g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780305159;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pQHXnv+zTI6JRHEdJGtJjegFX1lIGlI0OuTgX9tK2C4=;
	b=QKBOsimed81Dc4qlTQ53YaqZvmW1Fpz4SRW7WFotrrFxFF3MhHLLvskV0aea8DJ8r2Yp
	 R9TphTDk0qjhdMn9Ls+YadAyWtBUQTGGn4ATJmPgPUo6dya4mPUbg4tnohuNC/lmQJnlP
	 Zs4f3goAOMtEbJ1mBOi4Ct88O0LQgz9UjoEbqmGj9ISPGDWZkEp2U3wX3vBqo04v1NsES
	 W1UbbLKog/BnKbscLF/MEHfdgd82+f4mQXSld1ftv86G+d9579a2DFEvgE05WXOaGJCND
	 Q+XGNphAW5cpPrL0P+jRCix0YwU4oz+Z7r5jCzQMay/So3XWD4tIB1YF+Gr+5m9WwZg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pxmwyCIX;
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E1701F00899;
	Mon,  1 Jun 2026 09:12:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pxmwyCIX
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9E1701F00899
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780305151;
	bh=ZMQig1G0kI/9KDHbMpaDNt380R1SRF5p144eDOFLNgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pxmwyCIXwbzWqHXCNEbgl0y5hr9CjXFyBXtIj/H/oV4FHhjUM1WulsHn6MEI8CFc/
	 Zx3ykqnlb3qTd6FbYQVnrRXFV2030kvf82xnh28iiVIfrqK3ow/QeZn9TP4Ii+RXxu
	 47Sy/H7x3qjAa01qBwINyQqrvuptKd4VJOhoGjEF62QNQkzjtUu/W32JoYIE0U/Pxn
	 S2qQMEEcG+mPW6jj7S23ZmWw+eIFeAdyrTxOX1/t9uN36SKvoC6C0l7oPY5bW70EsF
	 eb2Nz4BY/fbSw1lYIK19Tl7TSliK/efZKnUTJ8SGdtcONzmsHKocV+hmGOQUEkIJyI
	 94NZQsDmkxVFg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3148717E0B66;
	Mon,  1 Jun 2026 11:12:31 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	matthias.bgg@kernel.org
Subject: [GIT,PULL,2/3] MediaTek SoC driver updates for v7.2
Date: Mon,  1 Jun 2026 11:12:22 +0200
Message-ID: <20260601091225.5223-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
References: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-for-v7.2

for you to fetch changes up to 7d462de9f65b002b439b1b168bf3b5579b0de48b:

  soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge (2026-05-11 11:20:48 +0200)

----------------------------------------------------------------
MediaTek SoC driver updates

This adds subsys ID compatibility in MediaTek CMDQ, paving
the way for adding support for the MT8196 SoC, and fixes
the Multimedia System (MMSYS) routing masks for the MT8167
SoC.

----------------------------------------------------------------
Jason-JH Lin (2):
      soc: mediatek: Use pkt_write function pointer for subsys ID compatibility
      soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing shift_pa

Luca Leonardo Scorcia (1):
      soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge

 drivers/soc/mediatek/mt8167-mmsys.h   | 11 ++++++++---
 drivers/soc/mediatek/mtk-mmsys.c      |  8 +++++---
 drivers/soc/mediatek/mtk-mutex.c      |  5 +++--
 include/linux/soc/mediatek/mtk-cmdq.h | 24 ++++++++++++++++++++++++
 4 files changed, 40 insertions(+), 8 deletions(-)
