Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A991D932F
	for <soc@lists.linux.dev>; Wed,  8 Jan 2025 10:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736330921; cv=none; b=tRQ3Cx2PxU/TiD1knIMCxaWoG1uiCGL4N4MUsmdpJAJRKflyrrtP8fZKkkn2JfNJruf4ahwcYq7jD4TjzBX9mST+niQ+IxHFNzs57FlsbCf2lZDycFdJ3SaCKJA8Kf7GK2CV109cJI9ajlifUpox2HBAxv8M5G4aUB08It0WjW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736330921; c=relaxed/simple;
	bh=XNjr7+7H8RUJt2sqVP/iNW1KTrzDKKV78lvp4eyy0HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mLUURXpIX2X1YX3ja7cUgGb7nnQZ/tQDarR5l0cAD1lY+XyesLW+2OS5NTpwy2Sn8GW0yAZxvLR7e8hbeSVHty9mUyop3pXsjqYf9Wv65rOnDXmiK/cjqh/qr5ORYSNQCysVypA4lX5+IVQ4BPTFakEljYh7tRfp83QcAQNlDd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OVyOKK8m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OVyOKK8m"
Received: by smtp.kernel.org (Postfix)
	id 4F8D1C4CEE2; Wed,  8 Jan 2025 10:08:41 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1DE75C4CEE3;
	Wed,  8 Jan 2025 10:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1DE75C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736330917;
	bh=XNjr7+7H8RUJt2sqVP/iNW1KTrzDKKV78lvp4eyy0HU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OVyOKK8mQVXl/TXIcHhNxU7TONEN4o89LU7FehSU8zgoP/LxwpQ6Fquq2y1w27Q+3
	 yiOV/Yxuf9cLNw35tNhOxyHz7evCfgsd9CocxAXcUVE0+zcEfkswOvCaF/Xcndkqyq
	 7V68srxUSv6U7ZE866NeAAI0JUcc1HycAkNTlwngq2EIEDCVALd0ldQzHqz2rWy/5P
	 Bcf4AnpogZmKOhadrmW1Q3qyPJM8Jpn02pcmCBvBL7hlktv9CbUTmAmBwoi63WS5Nz
	 slffg9qk+9kJffF8ljkGlJPveZrIUBiEa95hbLqxLt+T4j+QC9AmuLNaRwd0SL4erR
	 HLSXr2v8bmwnw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 12AE117E1555;
	Wed,  8 Jan 2025 11:08:37 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,3/3] MediaTek ARM64 defconfig updates for v6.14
Date: Wed,  8 Jan 2025 11:08:24 +0100
Message-ID: <20250108100826.32458-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
References: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-defconfig-for-v6.14

for you to fetch changes up to cab316255951188fb2847af04f2123c1ab85dadf:

  arm64: defconfig: Enable MediaTek DWMAC (2024-12-23 12:08:29 +0100)

----------------------------------------------------------------
MediaTek soc defcofnig updates for v6.14

This enables building modules for the integrated Ethernet
controllers (MediaTek STAR and MediaTek DWMAC Glue layer)
found on various MediaTek SoCs, and building modules for
enabling the sound card on MT8188 and DSP on MT8186.

----------------------------------------------------------------
Nícolas F. R. A. Prado (3):
      arm64: defconfig: Enable MediaTek STAR Ethernet MAC
      arm64: defconfig: Enable sound for MT8188
      arm64: defconfig: Enable MediaTek DWMAC

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)
