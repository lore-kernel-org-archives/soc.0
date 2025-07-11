Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E814C201034
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 08:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752223029; cv=none; b=mAHnTT7hszF/MBilv5WyzK4e6yM2XnhvXorT8yfhHr3axd7yOUhwYRKWaU/epr23/OcRbmpna495com/oeW5CWnkFv67YL0NRReL60mJeuO7Ot0o5cYEpXHgZcimu3vOoQXT9jYA26zRqoaaVWpT8pnaKduPdnpPB0++2yoRNU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752223029; c=relaxed/simple;
	bh=32oAzLL23cgtBdy6KHUFdoKoZ4dyr8I9KxFCxhpq180=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G36bHaFQZTzGt/u6z/8h0SPqIuNhT8G0eIBNQSqfdUyNAW8uFpHBUHKx7xzhXGyok98arrjAUFUP06sfxYI6y5go4pkPqiqC6SADROQC7WSWtzp84LqqHfgRPTmRjay8VzGdLusvwIt4uyKDIYPZECEMKqWs6Bpj0DJwa2851zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fmQjl9kH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fmQjl9kH"
Received: by smtp.kernel.org (Postfix)
	id D06C9C4AF0D; Fri, 11 Jul 2025 08:37:08 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A5F1C4CEF5;
	Fri, 11 Jul 2025 08:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A5F1C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752223020;
	bh=32oAzLL23cgtBdy6KHUFdoKoZ4dyr8I9KxFCxhpq180=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fmQjl9kH+goG8h/Rt4mVrlBbkMhkxNX9wCXtGxKGb5gmM/EnaBCggw41WolqtF82X
	 dPWbMGBRWShMlG6DOSbEevvy2NS9nTTMVblVAVX9w2LiN3J/w6xwUre+YuFREb2b2b
	 LE7HaFQL6R/sWf43KfRVBIdPefOD/LnXFFASdV2AKFmOqrRN7JeTiKeUZsBp3ieSaR
	 NAVcJy7QtxhZZ+0vZ0Xula5VCe9IFb8FECJq+aPUkXxPtgVCivt0dg7H5A5ubdvNzL
	 uffg6l+YTl7fEktXnqQj/w8izH9XCCsKa+ORF+r7HWAhh7ZsFxs7cZ/8IC0B8Iavdr
	 Iy0PA+H+aeU3Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34DC717E1090;
	Fri, 11 Jul 2025 10:37:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,4/4] MediaTek driver updates for v6.17
Date: Fri, 11 Jul 2025 10:36:48 +0200
Message-ID: <20250711083656.33538-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
References: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.17

for you to fetch changes up to 331db44e70dacfb6bf1e17d92fae7b1c9517ca6c:

  soc: mediatek: mtk-mutex: Fix confusing usage of MUTEX_MOD2 (2025-06-25 15:59:00 +0200)

----------------------------------------------------------------
MediaTek soc driver updates for v6.17

This adds a single cleanup commit for the mtk-mutex driver,
clarifying the usage of the MUTEX_MOD1, MUTEX_MOD2 registers
for applying display controller sub-component mute settings
on all MediaTek SoCs.

----------------------------------------------------------------
Jason-JH Lin (1):
      soc: mediatek: mtk-mutex: Fix confusing usage of MUTEX_MOD2

 drivers/soc/mediatek/mtk-mutex.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------
 1 file changed, 56 insertions(+), 53 deletions(-)

