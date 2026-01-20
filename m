Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E096149C6F
	for <soc@lists.linux.dev>; Tue, 20 Jan 2026 01:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768871750; cv=none; b=Iwvu0/bJIaTzhohxuv63WMdSMqSZO4us11c1mrErX8+StU7n3CKmBwgr34s3L8hnHuhSx8yBiqCHPeo6VAkRPSJyM6UHAw6FV9vohsO7ZiKxfXaE4mEqOAjThsWI078HJagLtAd6UwIYL8me6iP9Pipmfrzv5P+8GLFYlyLrVPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768871750; c=relaxed/simple;
	bh=SwRWjq7nIZvpk2yAris4KcgjXjN/ttaf4VtZx8wvoiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJazputCsarZoLl20XY8in5avXewiEujaPBiPFBYdxtxZPzCd6d9rQEVU4f/3YvxukvYVOHBTa3FswUgRohEtZCR/qRTpgL8Ow8U6rqfJsX4wtV83uFupFk6xPwFEqJ0nRd6jwvjzKpVcyWpsmzgipI3lByPqVgxRdocfuzUZBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=g7FVIaeX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="g7FVIaeX"
Received: by smtp.kernel.org (Postfix)
	id F1C07C19425; Tue, 20 Jan 2026 01:15:49 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01AADC116C6;
	Tue, 20 Jan 2026 01:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01AADC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=LR
	Afl4D2uTEsWA1KQu1nJ+mfn6CoZ0Qv29ZjkhbnglQ=; b=g7FVIaeXkjA0KdHYnR
	lmKR9QyvILMNuXymARoDJyXxtGufvEjEznnhEk29OWqLTUgkX7VwnoNGu+1G8SY5
	Iprhbw0jQUKQ1G75UiwYFxwWlvMnIvsnCkSCREsYYl/1zT9uHRaOOoz71cp3xA8c
	ggvNZBG4GLnaSDT4xwOSCCoao=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_+V71m5pGbEbAg--.16504S4;
	Tue, 20 Jan 2026 09:12:31 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX ARM device tree changes for 6.20
Date: Tue, 20 Jan 2026 09:12:16 +0800
Message-ID: <20260120011221.4387-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120011221.4387-1-shawnguo2@yeah.net>
References: <20260120011221.4387-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3_+V71m5pGbEbAg--.16504S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFyDCr1kAr4fXw1xKr4Durg_yoW5ur17pr
	4S9rsxJrs7Gr1fJrWav3y8K3s0vw18AF1F9ry3Jay8KF43ZF1UAr9Iqwn3try5XFWFqw1f
	trn7Zry7GFyDWaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jThF7UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIh-KMGlu1n+QtQAA3M

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.20

for you to fetch changes up to f325a91895d8a9167a7f1268569c1877272f897c:

  ARM: dts: imx: e60k02: add tps65185 (2026-01-18 10:11:38 +0800)

----------------------------------------------------------------
i.MX ARM device tree changes for 6.20:

- A few changes from Andreas Kemnade to correct LCDIF compatible
  for i.MX6SL/i.MX6SLL, add EPD regulator for imx6sll-kobo-clara2e,
  support TPS65185 for tolino-shine2 and e60k02
- A series from Frank Li to clean up GPMI CHECK_DTB warnings
- A change from Alexander Stein to add default GIC address cells
  for imx6qdl
- A change from Josua Mayer to add EPD PMIC for imx50-kobo-aura

----------------------------------------------------------------
Alexander Stein (1):
      ARM: dts: imx6qdl: Add default GIC address cells

Andreas Kemnade (5):
      ARM: dts: imx: imx6sll: fix lcdif compatible
      ARM: dts: imx: imx6sll-kobo-clara2e: add regulator for EPD
      ARM: dts: imx: imx6sl: fix lcdif compatible
      ARM: dts: imx: tolino-shine2: add tps65185
      ARM: dts: imx: e60k02: add tps65185

Frank Li (3):
      ARM: dts: imx6qdl: add '#address-cells' and '#size-cells' for gpmi-nand
      ARM: dts: imx6sx: update gpmi #size-cells to 0
      ARM: dts: imx: move nand related property under nand@0

Josua Mayer (1):
      ARM: dts: imx50-kobo-aura: add epd pmic description

 arch/arm/boot/dts/nxp/imx/e60k02.dtsi              | 35 ++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts      | 60 ++++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi    |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi       |  6 ++-
 .../boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi    |  6 ++-
 .../dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi    |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |  3 ++
 .../boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts    | 55 ++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts | 26 +++++++++
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi              |  2 +-
 .../boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    | 61 +++++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts | 26 +++++++++
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts          |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        |  6 ++-
 .../dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi     |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi     | 12 +++--
 .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 12 +++--
 .../boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi    |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi        |  8 ++-
 25 files changed, 347 insertions(+), 29 deletions(-)

