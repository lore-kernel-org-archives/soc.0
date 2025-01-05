Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A074B1F5F6
	for <soc@lists.linux.dev>; Sun,  5 Jan 2025 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736070716; cv=none; b=oV7Nor0q2uSXGG5ga+bk0Fr+U0KE5yFTiQ3Hh3jG4kTtPePNgD0kxFgd8hkD6y3633lEZ4ufDNrTrDBxPSZnIE88jncBipUUZcK7U3WsPCqaII9k2Rsr3GemuvbNCoUdh8Q9G4N2NCstS6tdaAMr3xugvpx/zHFYxDNSTLlGHDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736070716; c=relaxed/simple;
	bh=zCsB99Kol/SqL+CCZCUnDvI/M+vNIrE+qLCy82bMk2w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OaNb/VzXdnFmVcOz9CaOtFg6PyP53erT6RDWBO2o88X5UGmjzLgP9OHOODMzlnTURHLGa5m7smvVAeH11lbkidqAbfDqqPhNN8MhfGLQPA2z9jRAkz+tDrMqMNU15S/z61Uq8lbKxV5PsByrnXcgimUcxmmo9eCH2i3gholC7Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=fLxZ+zBg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="fLxZ+zBg"
Received: by smtp.kernel.org (Postfix)
	id 3DB37C4CEE5; Sun,  5 Jan 2025 09:51:56 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.kernel.org (Postfix) with ESMTP id C6289C4CED0;
	Sun,  5 Jan 2025 09:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6289C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CRzs+
	lBteckHuBiMPASLvCpYpP9+LhqXWoobnD31UvA=; b=fLxZ+zBgWI8P5hD4HoLHb
	L5eywEIW7d9KwzWNkGKdUwNJB0icGlTyO9CA0RMDZSenBydCrZJCMrjfhqlRzKZj
	KqAbOgYeho959U8FNi6cM+8+vUTHchg8VF7kFyqvlaYORy/ACHNTUKUz/HVK+e7j
	Z4EmkgBf41TRNUJc/Qoil0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXGWwuVnpnZZRPBg--.62165S2;
	Sun, 05 Jan 2025 17:51:43 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers change for 6.14
Date: Sun,  5 Jan 2025 17:51:34 +0800
Message-Id: <20250105095139.714590-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXGWwuVnpnZZRPBg--.62165S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxXry8Jw4ftr4UArW7CFg_yoWDJwc_CF
	y8Xa4UJryUJF17Ja45Cr10vryjyF47Jr97AF18KrWUJr47Jr15JF18Xr4xXr1DXr1UJF1D
	Jr1UXr18Ar4UJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbc4S5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAjLZWd6TKsXngAAsR

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.14

for you to fetch changes up to 0b4dc35529f87d99fca91b259d50f54613bf9ec0:

  soc: imx: Add SoC device register for i.MX9 (2024-12-09 20:31:39 +0800)

----------------------------------------------------------------
i.MX drivers change for 6.14:

- Add a SoC driver for i.MX9 (Alice Guo)

----------------------------------------------------------------
alice.guo (1):
      soc: imx: Add SoC device register for i.MX9

 drivers/soc/imx/Makefile   |   2 +-
 drivers/soc/imx/soc-imx9.c | 128 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/imx/soc-imx9.c

