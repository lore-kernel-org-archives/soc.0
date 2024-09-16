Return-Path: <SRS0=FrRY=QO=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401C4C3ABB2
	for <soc@archiver.kernel.org>; Mon, 16 Sep 2024 16:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25467C4CEC5; Mon, 16 Sep 2024 16:33:18 +0000 (UTC)
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26ACAC4CEC4
	for <soc@kernel.org>; Mon, 16 Sep 2024 16:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26ACAC4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2D47711402C0;
	Mon, 16 Sep 2024 12:33:16 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 16 Sep 2024 12:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726504396;
	 x=1726590796; bh=vZIcbrAnjSA4s0p+zFS0c7vxQRLPVZtsGWABr76p9TM=; b=
	Omy2mdbx6J6goCyiYQrovp/HecGw/tZLTLQzm2LFZ4oGGY4qnoBmS29abgnuITc2
	IEUUiamm1/p4qPrMynfqSd/44x17lzYdQ/wL6GklDIb6LELrT4mjBDuGKj7BEBMX
	bz6wFMTUUFHYDEQ8BYErcw+TBEkhgn7J9dkwMeNikNXeVL4pq1IJwoOdLiinTXMI
	w2QZqPyE63iPuwUVtd1z4Xn3SD3F3K+XTnkvdAFnO1Jj/7+li+KgtuTPP+u5dSzu
	4Aq3W2sFJTFyeb43uiZp8H1PSMUzFu8sM3F1NGpHyA6BQ8HwAhAK5w3xCRx8aWY2
	xnpA5ZGm84/p0yDf6A0/NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726504396; x=
	1726590796; bh=vZIcbrAnjSA4s0p+zFS0c7vxQRLPVZtsGWABr76p9TM=; b=R
	wT2LOkEIDa1rzyvQvZfkmxfwDwb7JLLygkgTMszEwpIBSwpxQ/a7OpoQVgUjfpRK
	izoioPQDcTrd3tamZN4UDc/ikDkoXnj39Wzi/wWwWRuMpOMHjVA4lGHBb4sZUQAx
	WnOfiG0PKyzqg+p7ZrzOF9FZMKOek7qqgNS+0S6kxyzIF+3qq+5xpwPaZJ7cZkOK
	FH0zAo63hMCAemnKITP7Kd1HQcj/8AVcgJpPTaWs1jNWgCyVclFTsFbSs9x652Qf
	YYF9bdHIaBGuUdKl3MIk4JgzYtgpnJgynWPHv+nvF7TjYQIbXbdpu5ThabOGnchN
	7ZxhUBPwpmo6FODZhnSvQ==
X-ME-Sender: <xms:y13oZjDxMKA-11zLBsST4FdmnGiNdVur_LBVDoKcFeFZqPu_FpIG7A>
    <xme:y13oZpjtvW1w84AGbRBSAH38Xd4jhonvh6ODSPSjyGuRmx3U8BEIYQ288IFwovVPs
    cI5nY0HAXaqyThbD_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudekhedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeekvdeuhfeitdeuieejvedtieeijeefleevffef
    leekieetjeffvdekgfetuefhgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhorhhvrghlughs
    sehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:y13oZukR1SzPug3tf5XswXKO6kGdCtQebFHDH8Bwa2SaVBfGhiZZ-w>
    <xmx:y13oZlxif1pGDGOzhEn18T4s1TxfvATCsdG3B9c9mIAKy5sbq2obSg>
    <xmx:y13oZoRNr6tlua6TC5CMJeAixAS9SmpRZwNdBgcS-woGMat3UxD-Ng>
    <xmx:y13oZoY13wexUpWikjKNfN8gNO9MSb480YJf4ZZYBG2DtXRIXd0waw>
    <xmx:zF3oZueFCoK86f37f6LE03UgamHS4QmWegeM5Fw3naBsAl7c0ByGtrVb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D37D5222006F; Mon, 16 Sep 2024 12:33:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 16 Sep 2024 16:32:53 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <3618c698-8305-460f-bddb-67e4e06f524a@app.fastmail.com>
In-Reply-To: <a40b4b3a-5d61-4bef-b367-745ba058be9e@app.fastmail.com>
References: <a40b4b3a-5d61-4bef-b367-745ba058be9e@app.fastmail.com>
Subject: [GIT PULL 3/4] soc: defconfig updates for 6.12
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 47ac09b91befbb6a235ab620c32af719f8208=
399:

  Linux 6.11-rc4 (2024-08-18 13:17:27 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
efconfig-6.12

for you to fetch changes up to 7eee0f8bbd1b6946236624d25a938cb34c1ba2a9:

  Merge tag 'v6.11-next-defconfig' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/mediatek/linux into soc/defconfig (2024-09-11 09:05:18 +00=
00)

----------------------------------------------------------------
soc: defconfig updates for 6.12

The updates to the defconfig files are fairly small, enabling
drivers for eight of the arm and riscv based platforms.

----------------------------------------------------------------
Alexandre Mergnat (1):
      arm64: defconfig: enable mt8365 sound

Arnd Bergmann (8):
      Merge tag 'at91-defconfig-6.12' of https://git.kernel.org/pub/scm/=
linux/kernel/git/at91/linux into soc/defconfig
      Merge tag 'renesas-arm-defconfig-for-v6.12-tag1' of https://git.ke=
rnel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'tegra-for-6.12-arm64-defconfig' of https://git.kernel.o=
rg/pub/scm/linux/kernel/git/tegra/linux into soc/defconfig
      Merge tag 'ti-k3-config-for-v6.12' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/ti/linux into soc/defconfig
      Merge tag 'imx-defconfig-6.12' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/shawnguo/linux into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-6.12' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'riscv-config-for-v6.12' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/conor/linux into soc/defconfig
      Merge tag 'v6.11-next-defconfig' of https://git.kernel.org/pub/scm=
/linux/kernel/git/mediatek/linux into soc/defconfig

Chen Wang (1):
      riscv: defconfig: sophgo: enable clks for sg2042

Devarsh Thakkar (1):
      arm64: defconfig: Enable E5010 JPEG Encoder

Dmitry Baryshkov (1):
      arm64: defconfig: build CONFIG_REGULATOR_QCOM_REFGEN as module

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Enable slab hardening and kmalloc buckets

Inochi Amaoto (1):
      riscv: defconfig: Enable pinctrl support for CV18XX Series SoC

Jon Hunter (1):
      arm64: defconfig: Enable Tegra194 PCIe Endpoint

Kuninori Morimoto (1):
      arm64: defconfig: Enable AK4619 codec support

Liu Ying (1):
      arm64: defconfig: Enable ADP5585 GPIO and PWM drivers

Niklas S=C3=B6derlund (1):
      arm64: defconfig: Enable R-Car Ethernet-TSN support

Varshini Rajendran (1):
      ARM: configs: at91: enable config flags for sam9x7 SoC family

 arch/arm/configs/at91_dt_defconfig  |  1 +
 arch/arm/configs/shmobile_defconfig |  1 +
 arch/arm64/configs/defconfig        | 10 ++++++++++
 arch/riscv/configs/defconfig        |  7 +++++++
 4 files changed, 19 insertions(+)
