Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9B9159209
	for <soc@lists.linux.dev>; Fri, 24 Jan 2025 15:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731363; cv=none; b=WkWFH/Bbks+cB4uDd8Rdq0h7Xwz0WfEupHJTx4L3zkCT2Th6cgHd8Hg/r3XEyhWjHl7Vp+2de7Y2NtNhwce2zXor+/5bq9e7v/hYtG88TT4IBm6cffdfj+lt60kzH3lIhxuKvkqCAOKQpPb5MpqqVOmZDCb1oedBf8Kc+FN1HTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731363; c=relaxed/simple;
	bh=ef7iNYq42cZXkauvrKbGI/FJ4Os6pDk5KTyzEh21XA4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qJOrRzPyIFw3hWPitZ9SZgtgNdhqOxP3XEOZQpjC+AMv3kc2Ps5ACxpi1PA/1/9KL9BDio5WusuNhW+0Amm44IZtJ3SwOjrCuTOmh5cUDDUAHwkd8FXbRA8t5qcn9QUHfEMfcrjcSqM2Kez0aV+Fx/4B+rt90n55nzHTbLxAJ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=djkfvsz8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dW1ufnZX; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="djkfvsz8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dW1ufnZX"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 581E611401A8;
	Fri, 24 Jan 2025 10:09:20 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 24 Jan 2025 10:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737731360;
	 x=1737817760; bh=+0Mqs7iOlVquPP3UP3a2iTIsdV7BIk9K1d6vObYVMh0=; b=
	djkfvsz8J8u3SJzI3ErSHCzD19Lq3r7BDohbMwF3iH8cb9KuDcO7a5jPhDn/0BgS
	wLnMjqbbfLsct/NzzMBRPE+CF9nVXF+OUlaZWdV/Fl948iJp5aM+Z4APTq7uxTvL
	svrZAXOC5L1fjyrI5whs1nCdBaJ5AVNLBMk5AH5lFT4ucG7GBStH1h8pGFoDu5o2
	+XQhOvOy0JMa4tOIbVVjj7jIP0Q2FE6V0u8E10HDkM9nrgDoIkT8qN9BCueAhSNH
	o1KRjSP/qEHZflVqgOMYvjuKlNJJdtCiwdkNTqrx51FZFFAhrBGz4SFUR/6CY2t2
	Q7m9o5CSUAgCuNF7kGNrFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737731360; x=
	1737817760; bh=+0Mqs7iOlVquPP3UP3a2iTIsdV7BIk9K1d6vObYVMh0=; b=d
	W1ufnZXXMMFbPAc0NCL78MseC8HPfgVLzgN5JoLOlmWuyS5tedyuGxLouzCo5zYH
	4OFJD+Q6zGNnwnT2fTlvyCZbP0SU9fu4tXYZx6TIKp4mMtpBZriNJzkbIU1axXNt
	mj7kb0oBzRKqKNPACOFuEMizd0zUUHTFX7YcKxbHqW47+Ht2VD+87BZCjt88nmIy
	Rbblw3vZdvYE/93rNIQnFB0vdWG882bcnp2zBCmKKMrN9mfnXiZn+HP4SJsIGPk8
	OLMjLKT6YtHl7STOgb0jTV2JhHe87Bcvd7VZNVM+yag1ncnZAxb46zCXBYl6Txnl
	a+PIBaX9StV97zuwD9H4A==
X-ME-Sender: <xms:IK2TZwH_LWjuVyiXwxBKCFGlaGldp79co93BCOMMpoku8zBtp7mE9g>
    <xme:IK2TZ5WVkunllhted929lVOlmKluITSSm2hvkYcoXvTquaZvKLhgQGfQQ01MEUqHE
    sBj7IIVxz3EpgJ-X7s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedggeekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefueegkeffveeugeehieehiedukeegfefhffeu
    tdettdffteeluefhheetkeekvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgih
    hthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhn
    uggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlse
    hlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishht
    shdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IK2TZ6LmiTif2T4YbPxQOWRNgt9mNOQ-sCTcJUDgxy8vuwDEh-9ChA>
    <xmx:IK2TZyErKFYOqI7sru-xnnFM89F1gQQiUpS9eoueFIpnCRYyjC0a7w>
    <xmx:IK2TZ2XHiWIcT5Pwc-2L4zbopl0ewukAEjFfI2vgpmJI7FC6Z5xmPg>
    <xmx:IK2TZ1NA0aVyJiAXptAlJKoTVWltAc5iVThGAo6NNybQyd-qFxuA6w>
    <xmx:IK2TZ1Q9lBVHBQxD-tJ7qW_MzKPhqYqTj8mRQ0kFxvuTepKmQ4qY_qsi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 202942220074; Fri, 24 Jan 2025 10:09:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 16:08:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <fdf46fd8-2449-4579-b85b-265c693addf8@app.fastmail.com>
In-Reply-To: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
Subject: [GIT PULL 5/5] soc: defconfig updates for 6.14
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0d=
ca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
efconfig-6.14

for you to fetch changes up to 309f64469cd5d09d5f1207e57d42f2eff9bd9311:

  Merge tag 'arm-soc/for-6.14/defconfig-arm64' of https://github.com/Bro=
adcom/stblinux into soc/defconfig (2025-01-24 13:08:51 +0100)

----------------------------------------------------------------
soc: defconfig updates for 6.14

As usual, a number of new drivers get added to the defconfig to
support additional hardware. The stm32 defconfig also turns off
a few options to optimize for size.

----------------------------------------------------------------
Alexander Stein (1):
      ARM: imx_v6_v7_defconfig: enable JC42 for TQMa7x

Andr=C3=A9 Draszik (1):
      arm64: defconfig: enable Maxim TCPCI driver

Arnd Bergmann (9):
      Merge tag 'renesas-arm-defconfig-for-v6.14-tag1' of https://git.ke=
rnel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'imx-defconfig-6.14' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/shawnguo/linux into soc/defconfig
      Merge tag 'at91-defconfig-6.14' of https://git.kernel.org/pub/scm/=
linux/kernel/git/at91/linux into soc/defconfig
      Merge tag 'mtk-defconfig-for-v6.14' of https://git.kernel.org/pub/=
scm/linux/kernel/git/mediatek/linux into soc/defconfig
      Merge tag 'ti-k3-config-for-v6.14' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/ti/linux into soc/defconfig
      Merge tag 'v6.14-rockchip-defconfig64-1' of https://git.kernel.org=
/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-6.14' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'riscv-config-for-v6.14' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/conor/linux into soc/defconfig
      Merge tag 'arm-soc/for-6.14/defconfig-arm64' of https://github.com=
/Broadcom/stblinux into soc/defconfig

Biju Das (1):
      arm64: defconfig: Enable R9A09G047 SoC

Cristian Ciocaltea (1):
      arm64: defconfig: Enable Rockchip extensions for Synopsys DW HDMI =
QP

Drew Fustini (1):
      riscv: defconfig: enable pinctrl and dwmac support for TH1520

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.13-rc1

Hari Nagalla (1):
      arm64: defconfig: Enable TI K3 M4 remoteproc driver

Igor Belwon (1):
      dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible

Jingyi Wang (1):
      arm64: defconfig: enable clock controller, interconnect and pinctr=
l for QCS8300

Krzysztof Kozlowski (1):
      arm64: defconfig: Enable basic Qualcomm SM8750 SoC drivers

Lad Prabhakar (1):
      arm64: defconfig: Enable Renesas RZ/V2H(P) Watchdog driver

Lijuan Gao (1):
      arm64: defconfig: enable clock controller, interconnect and pinctr=
l for QCS615

Liu Ying (1):
      arm64: defconfig: Enable ITE IT6263 driver

Luo Jie (1):
      arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller

Mark Brown (1):
      arm64: defconfig: Enable Amazon Elastic Network Adaptor

Nicolas Dufresne (1):
      arm64: defconfig: Enable RFKILL GPIO

N=C3=ADcolas F. R. A. Prado (3):
      arm64: defconfig: Enable MediaTek STAR Ethernet MAC
      arm64: defconfig: Enable sound for MT8188
      arm64: defconfig: Enable MediaTek DWMAC

Patrice Chotard (4):
      ARM: configs: stm32: Remove FLASH_MEM_BASE and FLASH_SIZE in STM32=
 defconfig
      ARM: configs: stm32: Clean STM32 defconfig
      ARM: configs: stm32: Remove CRYPTO in STM32 defconfig
      ARM: configs: stm32: Remove useless flags in STM32 defconfig

Ross Burton (1):
      arm64: defconfig: remove obsolete CONFIG_SM_DISPCC_8650

Ryan Wanner (1):
      ARM: configs: at91: sama7: add new SoC config

Stefan Wahren (1):
      arm64: defconfig: Enable pinctrl-based I2C mux

Taniya Das (1):
      arm64: defconfig: Enable sa8775p clock controllers

 .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
 arch/arm/configs/imx_v6_v7_defconfig               |  1 +
 arch/arm/configs/multi_v7_defconfig                |  1 +
 arch/arm/configs/sama7_defconfig                   |  1 +
 arch/arm/configs/shmobile_defconfig                |  1 +
 arch/arm/configs/stm32_defconfig                   | 12 ++++-----
 arch/arm64/configs/defconfig                       | 31 +++++++++++++++=
++++++-
 arch/riscv/configs/defconfig                       |  2 ++
 8 files changed, 43 insertions(+), 7 deletions(-)
