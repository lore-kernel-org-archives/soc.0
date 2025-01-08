Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09F1F0E3F
	for <soc@lists.linux.dev>; Wed,  8 Jan 2025 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736330921; cv=none; b=juNYtoSTzBNcumeO1aXZRYp/1x7NnDgjyDBRX6coAruVXxGkop/Q3OtOSQrSaAcamLnqzPUhK2JU8ehH7I5ieT4muzZHJvwxy5T+PhJjYPfKzV0PvAdyDHC8UTPVAdcSIs0Y+txaLoxgogs3yZVSk4jRM+DpgEF6EohTlrowh8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736330921; c=relaxed/simple;
	bh=qUE6a1s/T1/9RfaxklpsWiTkF/AvmrQ9PTOphkSNPPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swjFzkRZCQTQ5mp9gMdw5U+CPUr7l+EBfvN0pwmAaNEVYP93KWu4TFBhA+i5WR8cnqWkMO6tauF5I8w8LviwteuM9dTZmDIwdNPuhFmmJok0Vvr+uSC+W+pOdCEze4qc4cbYTr7tKigjcJKsnpc/tvcUFsRq0WOpcZ1CSNVuX4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CoTVEh57; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CoTVEh57"
Received: by smtp.kernel.org (Postfix)
	id 813E1C4CEE1; Wed,  8 Jan 2025 10:08:40 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE147C4CEE2;
	Wed,  8 Jan 2025 10:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE147C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736330916;
	bh=qUE6a1s/T1/9RfaxklpsWiTkF/AvmrQ9PTOphkSNPPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CoTVEh57RI8ExPBsxJKK8lVChF5lUPOTTzpcJAswONzCbwnzr2ZeKWhBK0CFoRKFa
	 LvHvTyreUWL3FtVKvIDZQd2hz71n0FZ5EFhlq80n7KSsscobl3LGGNgqIIRRCXHgMU
	 eZ7VJOaW2N//pk1k8R8oL/18anIoi8+vejCT/rcPc3Z9byI9Kom2JzZGJvhGgpeVB4
	 LTkLrocupac3DrCs+fqfAIRPbRn4CPpwVmjbC4Q47ji6j/QjYZ4gEZN3JcgOyqLj4m
	 WchdHHgw7/c7XW8QaFVJJcJZjsGHsR6rOiZ/9CVWtGCYBBuf+9bHRRFgKWCFzYWmHW
	 l5gzrY4Nm9ovQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8618117E1553;
	Wed,  8 Jan 2025 11:08:36 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/3] MediaTek driver updates for v6.14
Date: Wed,  8 Jan 2025 11:08:23 +0100
Message-ID: <20250108100826.32458-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
References: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.14

for you to fetch changes up to c9c0036c1990da8d2dd33563e327e05a775fcf10:

  soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove (2025-01-07 13:13:57 +0100)

----------------------------------------------------------------
MediaTek soc driver updates for v6.14

This adds fixes avoiding iomap leaks on error paths in
the MediaTek devapc driver.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      soc: mediatek: mtk-devapc: Fix leaking IO map on error paths
      soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove

 drivers/soc/mediatek/mtk-devapc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)
