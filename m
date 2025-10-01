Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41737296BCC
	for <soc@lists.linux.dev>; Wed,  1 Oct 2025 22:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759357657; cv=none; b=nh3Ekc3HmcRuXBiDh+4KEkQQFSCocwzeTgNP7nmAN5njapIf5cYNBpNYin5EsGYMj3Gm9FJj0oVKMGN991ekBgSEMI7mOCGrPZY+fIYZsXUiQ1KB55mJB1ZvS7O3Wc6Cd7MQOyz1G289yMAZ1fN6vQ099ZKoSDU4ehmFcX7IbTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759357657; c=relaxed/simple;
	bh=gyG3kRiq/6Z/Fk5v2JEAysffFgdb+GWxJtAymMLoFHc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=EJu4ED4sdq9SD3QxaDd2YaFX+n9xGlhu7r7oWilqREnc8EKQGyEJF1QCKYmUn/skSxV4Z1vK1IHPSGO3klszpTCE0PoWptTTM9ODJ0HfwvutHByN6IzpF6cn/hmRve74G2f1vxzHJNjX0N6dEn4kjwDQwPYYu19zqiB2aanmTjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=2mZpxQx/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UyGb7IX4; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="2mZpxQx/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UyGb7IX4"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8B24E14000E2;
	Wed,  1 Oct 2025 18:27:35 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 01 Oct 2025 18:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759357655;
	 x=1759444055; bh=iJxq0hnHwbo8fhl2bhvu5HKdXSz4YJXOZHwu5EanVLk=; b=
	2mZpxQx/gZ2TjfP7vp4LVqjow6PYFWecBfSZiUiVe25yAjwFcrCQ08O8butDM4OX
	18YkrjAvYAWKf48YBMYAqjk7d74Ljjca7NaD6UfJ3fIts0t6XLCeIQgA3Uu6o7jH
	WQg+Gz9iULhVM2R3pMb5Np/axUvFdGgbmNcpinRkPz1xyT2GOe89P9YjZYRqjbZa
	x+cvqkm4A35xm92/ANlPwebJgGRw7qZPi5rlJ7MsUS5IP6tztsM0GSmefwLzYo55
	pgToaVLWCP1FRwY0f7ECEng8X7bsYgHRltq1Zg1oWAAR1u4CPfuC8H/LbNXKPfJb
	CwCjcLODCwtiBq2WjyQrCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759357655; x=
	1759444055; bh=iJxq0hnHwbo8fhl2bhvu5HKdXSz4YJXOZHwu5EanVLk=; b=U
	yGb7IX4W5gh1ID9StAqnB8/hlnelenX0YXCCulWUZYEvNArK53ROLCm8K/zTTUyG
	jXO7tf4VHV/cbpEh1W74JH5GhautGklnbV0bYjjleSBVfDxvbMz0T4A17TdO0Hpc
	65Pq0dFxoTwjiDOn9HfCw9GoRXi8/DKbsFXTydtwHBpAloXKMXyDrB7OxWIittQx
	PDmq6mIjKM3qt19PqCTvpRMJ+CqvWqFNfip05XqwVke6p9YHCmRloX/j5zTPPcq1
	YBsjVS8ut2FUGmiV4HWm4RxJHK6aASlZcQdgY+3w0OgIszMKhOHsQMOMfBiHKucE
	/LxLG3/QddXFp/cawdumQ==
X-ME-Sender: <xms:16rdaGguSV9j1m_mUY2ZtBbm-tZBvJebh1kKfOGEnHzM5oYMjlM0Zw>
    <xme:16rdaB0GSSU5L32EGu7UFfaivq0ahXfqLAKlVMIzXcusGXGcaJnxU_eyR0UHMsn4W
    fmoTu_F1UDSlsFay1ZSSdNeujyuhXQVOMbAsBG0NHdH1HM83r_LMYY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekgeefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefffelleduheehleejtdfhheegtdffhedtffeileehkeetffevtdegheduhfeiuden
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgu
    sgdruggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:16rdaCMM-yRE0mvKkt1iogWFPSDEsfyp3gVgldonDpYn2AtvIKP9eQ>
    <xmx:16rdaKQM_blNmIz0CwAbGt0g-tCzNepEelrXiJ14WnOaodb2SbHz9w>
    <xmx:16rdaAiJv8965x3k3mlHy9rWQ6auSOva8Y8Qn8Zsjt8hBTyujwkx5A>
    <xmx:16rdaD-nOlxoQRiaN0umvRpZSE1aF1wWPOwP_IWSyiZBD-e7NdpmIg>
    <xmx:16rdaA5GboiOdjMSeEwPFF5ZJnaJC75gmlIq6_rUbQnk0ldyVQP3aukP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3BA43700065; Wed,  1 Oct 2025 18:27:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AjqV-Bcf-9VR
Date: Thu, 02 Oct 2025 00:27:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, soc@lists.linux.dev
Message-Id: <d6fc7506-9700-4462-9842-d20ee54bea5f@app.fastmail.com>
In-Reply-To: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com>
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com>
Subject: [GIT PULL 3/5] soc: defconfig updates for 6.18
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit b320789d6883cc00ac78ce83bccbfe7ed58afcf0:

  Linux 6.17-rc4 (2025-08-31 15:33:07 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.18

for you to fetch changes up to 1f76c941c29bffdc97212969115f1fd5f91a4aed:

  ARM: configs: u8500: Set NFC_SHDLC as built-in (2025-10-01 23:48:45 +0200)

----------------------------------------------------------------
soc: defconfig updates for 6.18

Only a small set up updates, enabling a few drivers for Artpec, THead,
Renesas and Broadcom chips, and cleaning out some Qualcomm options that
were removed previously.

----------------------------------------------------------------
Akhil P Oommen (1):
      arm64: defconfig: Enable X1P42100 GPUCC driver

Alexander Stein (1):
      arm64: defconfig: Enable Marvell WiFi-Ex USB driver

Andrea della Porta (1):
      arm64: defconfig: Enable BCM2712 on-chip pin controller driver

Arnd Bergmann (7):
      Merge tag 'renesas-arm-defconfig-for-v6.18-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'samsung-defconfig-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/defconfig
      Merge tag 'arm-soc/for-6.18/defconfig-arm64' of https://github.com/Broadcom/stblinux into soc/defconfig
      Merge tag 'imx-defconfig-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into soc/defconfig
      Merge tag 'qcom-arm32-defconfig-for-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'riscv-config-for-v6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/defconfig

Fabrizio Castro (1):
      arm64: defconfig: Enable the RZ/V2H(P) RSPI driver

Guodong Xu (1):
      riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC

Jihed Chaibi (2):
      ARM: defconfig: pxa: Remove duplicate CONFIG_USB_GPIO_VBUS entry
      ARM: configs: u8500: Set NFC_SHDLC as built-in

Joy Zou (1):
      arm64: defconfig: enable i.MX91 pinctrl

Krzysztof Kozlowski (1):
      ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410

Petr Vorel (1):
      ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM

SungMin Park (1):
      arm64: defconfig: Enable Axis ARTPEC SoC

Taniya Das (1):
      arm64: defconfig: Enable QCS615 clock controllers

Thierry Bultel (1):
      arm64: defconfig: Enable Renesas RZ/T2H serial SCI

Trevor Woerner (1):
      ARM: defconfig: cleanup orphaned CONFIGs

Yixun Lan (1):
      riscv: defconfig: run savedefconfig to reorder it

 arch/arm/configs/multi_v7_defconfig |  4 ----
 arch/arm/configs/pxa_defconfig      |  1 -
 arch/arm/configs/qcom_defconfig     |  4 ----
 arch/arm/configs/s3c6400_defconfig  |  1 -
 arch/arm/configs/u8500_defconfig    |  2 +-
 arch/arm64/configs/defconfig        | 12 ++++++++++++
 arch/riscv/configs/defconfig        |  6 +++---
 7 files changed, 16 insertions(+), 14 deletions(-)
