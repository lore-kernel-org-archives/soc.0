Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC882C1595
	for <soc@lists.linux.dev>; Wed, 27 May 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871303; cv=none; b=Rv29C95zkcdKS00XqWTQenFg7G+TGzpwRW8bkajFT8j/OyWjWlXTsN44WZVvqUemOaKdJzeuIzPN7zV44xa7yq3NaJa5NAZRRfT6co+I4hr0wmIDjdAb9e0hm1h/IeYkRWkFD1mEkEVxOrA9ybUfrOW6GtPM5cYcR6ep/BmhRrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871303; c=relaxed/simple;
	bh=FyuM9uP7EGUCC6PE/7IfacwsoIFdTNeZTL1U3liym2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkWU5w501fYpbmUExoo8zaHkRS2IMLmgHc/eOwRNBjNY/HFbbFJM8Un6zYcd9SC29851XatMtI66rBJmYeySce3qQuwjLQMHhKUs8Z3rxNqGgQ4SaYfpyQYVYQDPUAa5oxVsD8vloR1o7mziIxTNBDoyF42ivObpylUFm7QIh+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooUVImLn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooUVImLn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F4A1F000E9;
	Wed, 27 May 2026 08:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779871301;
	bh=7EaBwtsdPlRjQeziiV/37Nfopb7lDpqCDauSU1czjKs=;
	h=From:To:Cc:Subject:Date;
	b=ooUVImLnvoEmd4oKrq7Xs+/PE6JbyaHP8zWBqKFTUtaIAL6RoL0wSFSHY5X9OEeDG
	 lLQqZsvD6kufLytQ5MfWForiZ/svMqQdlRowcMUrD1H9pJ+Z7CycTeZRMyZKvirRCt
	 C0XF5yvxy8sTZoENfHmM8FUl0jiw3iNNWbMROvV7YZVubS2lqYmCV5ta/SZ4U6rXOz
	 sTbeXdR7GYOdwrG4dU+ASQ7dgGDrEXeD8xyjQQa561P6Lp+HLgurm7Se0cYhKIDljX
	 K768ho+aGbwHtqxu8ecxOIIgrALzZdAHviuIrppgBkqlbBRZhgsVFIDD2d32jto5bx
	 8R6uRSgr0E5yg==
From: Maxime Ripard <mripard@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Davis <afd@ti.com>
Subject: [PATCH] ARM: multi_v7_defconfig: Enable dma-buf heaps
Date: Wed, 27 May 2026 10:41:35 +0200
Message-ID: <20260527084135.842736-1-mripard@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the system and CMA heaps can be built as modules, enable both
as modules in the arm multi_v7_defconfig.

Suggested-by: Andrew Davis <afd@ti.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2891eeba9032..3345a8eb8422 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1073,10 +1073,13 @@ CONFIG_RZN1_DMAMUX=m
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=m
 CONFIG_STM32_DMA=y
 CONFIG_STM32_DMAMUX=y
 CONFIG_STM32_MDMA=y
+CONFIG_DMABUF_HEAPS=y
+CONFIG_DMABUF_HEAPS_SYSTEM=m
+CONFIG_DMABUF_HEAPS_CMA=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_STAGING=y
 CONFIG_MFD_NVEC=y
 CONFIG_KEYBOARD_NVEC=y
-- 
2.54.0

