Return-Path: <SRS0=iiGd=N6=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACCAC3064D
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 09:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9FE8C2BD10; Fri, 28 Jun 2024 09:50:50 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0D03C116B1;
	Fri, 28 Jun 2024 09:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0D03C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719568248;
	bh=CffpkilqOr6oKwfETinZOL1etCI1pR0gFsxhx1qzNVs=;
	h=From:To:Cc:Subject:Date:From;
	b=fZjkd941FpqgRS3MGGo02AXgieGQrJArjcMXbNa4ef6g1unPiqhFzDDJiUEDQ1xED
	 6a8xtXJX44T9sNBmNFxE5cAT1J3pa762c7wRyqTRkDBf/LfsQl/REa3NxF6PvxFdRu
	 yVjtB80ULMKZEyLO6ZHRg/NZHoQiPrtxkeudhAzTcdivrsV8DPiquOvNkQp12WVmt4
	 sfMT2RBx8QgEnFBLDNbOj6QYptQ1Hx1Lx934+0iG24T89f4jXjOuo62BSdeuyeLpwp
	 5fBG88D6vFOAD8xlxWrjWlSnnwiprLyR5h8qEWbL97ALuufw2mvbU4bgpb0y2n0aYR
	 51RD4pnJTUs6A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CECF83781115;
	Fri, 28 Jun 2024 09:50:47 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/1] MAINTAINERS: Assign MTK Airoha to MediaTek maintainers
Date: Fri, 28 Jun 2024 11:50:42 +0200
Message-ID: <20240628095044.132276-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a single patch assigning (MediaTek) Airoha ARM64 to the
current MediaTek maintainers.

Krzysztof Kozlowski (1):
  MAINTAINERS: ARM: airoha: add entry to cover Airoha SoC

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.45.2

