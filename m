Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D51B13C9D9
	for <soc@lists.linux.dev>; Sun,  5 Jan 2025 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736070717; cv=none; b=cphsrx/VzYy43VYPDM+6smNjqpWyoOPd0Tbbd6cjxY3op45PYTLfApZBxFxT2z6z/N9hS69CPbCMeYFHM2yLKoU9odsP8HGKc1s5efxSV2BAoXAP6o2PEk4p5RPbOW2FyQix4kroA1dtZmyGPF3+p9Q45OOt0rraE1VyhuL/Yss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736070717; c=relaxed/simple;
	bh=/Sh5KOE59Aui8PfGjqhIZobjeZ/zYvSj9HOW+x5WOFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oSvwmv6wlO8+Y1rJcl6EGy2ptW1jn33NsYhpQwvEN685GG/PAQ0ShIUb0Ft0c9imYiFQS3gtg2gjeBggF8UIxYv4I/DryO7nllfdDFHzveYvgGTBj1YHjzNrywTsBFEjEGXuwMV9IjYoekxgmVsB6XmmJpRz1bGS1wwWI0Y5Q8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=p+4mRzd3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="p+4mRzd3"
Received: by smtp.kernel.org (Postfix)
	id 3DC14C4CEE8; Sun,  5 Jan 2025 09:51:57 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.kernel.org (Postfix) with ESMTP id 92385C4CEE2;
	Sun,  5 Jan 2025 09:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92385C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LsIb6
	OZ4T07vFbCXdxpznnWsqzl75iiZFjf5L5ekvZg=; b=p+4mRzd3s/Fm8HKUSzUuK
	99kyU1m3r5gYrDTwEBnqhBbpmsA5px5fvSxKj+qC6ebdGV1AolJh0TSXfjnBVNiM
	A7o2MrNfeIdMtQkyhJ7uDt59VfvxFhlXr15zrNeg+ACcUcwI9IlKEkFx4gHbn73O
	O/Zhnmsvi+cyeRGzXL3wfU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXGWwuVnpnZZRPBg--.62165S6;
	Sun, 05 Jan 2025 17:51:45 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig change for 6.14
Date: Sun,  5 Jan 2025 17:51:38 +0800
Message-Id: <20250105095139.714590-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250105095139.714590-1-shawnguo2@yeah.net>
References: <20250105095139.714590-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXGWwuVnpnZZRPBg--.62165S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxXry8Jw4ftr4UArW7CFg_yoWkJrX_AF
	y7Ga4DGrn8CrWUGF15Xwn7Gr4UKF1UX3WUJr1UtrW3Xr1aq3W5Aw18XrWfXr1UX3W8Gr1D
	ArZ8Aw1DAr1UCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8TGQDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxnLZWd6UukIDwAAsd

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.14

for you to fetch changes up to 2b21c2306a9006e401c1ee3c694ecd327de4dc16:

  arm64: defconfig: Enable ITE IT6263 driver (2024-12-09 19:51:03 +0800)

----------------------------------------------------------------
i.MX defconfig change for 6.14:

- Enable JC42 temperature sensor driver support in imx_v6_v7_defconfig
  (Alexander Stein)
- Enable ITE IT6263 LVDS to HDMI converter driver support in arm64
  defconfig (Liu Ying)

----------------------------------------------------------------
Alexander Stein (1):
      ARM: imx_v6_v7_defconfig: enable JC42 for TQMa7x

Liu Ying (1):
      arm64: defconfig: Enable ITE IT6263 driver

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 arch/arm64/configs/defconfig         | 1 +
 2 files changed, 2 insertions(+)

