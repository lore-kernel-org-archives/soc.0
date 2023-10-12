Return-Path: <SRS0=M8Ud=F2=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1902CCDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 13:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7FB0C433C9; Thu, 12 Oct 2023 13:09:39 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D83CDC433C7
	for <soc@kernel.org>; Thu, 12 Oct 2023 13:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D83CDC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id A50803200949;
	Thu, 12 Oct 2023 09:09:36 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 12 Oct 2023 09:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm2; t=1697116176; x=
	1697202576; bh=cZMmYkqHafcy9r9IqECYBJlSxMS9CljvUiH0C1OF7xE=; b=O
	pT0mWlV8K32Yoa/bTIYumB/dRHc+0SddvVSKHKYAZI9OJjnEQGQLFxD98DwYFilO
	oGW9rUmxvIe9XsoSqWuzPXwz+hjSlHbSftw45eWYG7KZ3pgxP5sB5P4uPVwyqGbT
	hq8SXPjvIZDYUgB4v5dMkmRFNmmmhIyr8wGkQgTGhelePH4MZj70UqylbIe++ulf
	yJfvhLh+WmOVYJAmV2fxax0qR3X0BGoQ/T0rqX1VGX/gbwsTj5mSarlGgg+Mjp8k
	I+qcuDkrOcGoi/FF5nLXCgDqSj9Da8oIXhr2/5rYkDu3II/6kzrnOU0B1nkf0rZT
	ncA7gQ6IXlRujRCsjeS/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1697116176; x=1697202576; bh=c
	ZMmYkqHafcy9r9IqECYBJlSxMS9CljvUiH0C1OF7xE=; b=dUdOnIgaOd+BeQxhz
	dbR5rLpI7Gnlpa4eBLDrLlBOla89T7aDrPnBUeLso8oBbdZLB3Tfrffw8FFYE5wH
	Ckuf1hhQcAJhZgEPqPVK+1dswgFsdLT2x4IafrC/GKW0f1OUtELNqOCGuUintnwz
	rWnUGwF5lIZ0v+oONktNyqKaynA0o4j73jBV4dehhUu5rlKgrsT2VYnp3pih/JWw
	aBQN+PjlXg0iH2tBHJwjFLC7x5JYDHdFHvlYPRcRU76uLfzg2SewK9Ymp/qp5bxS
	THuU0kbEOsZMGBMvoBj+aDFtKjxCm1dqGfhUhCf7CHN2GXv2EoHmUPAVIITGiJ5x
	D3MOA==
X-ME-Sender: <xms:D_AnZUFlAfslxS5HItdQlB9ZCPk5dyZ80am_YnocUKfCICVKB4Fwwg>
    <xme:D_AnZdWech7XBt4RFrmnBoCuVcKN-wt6iEs3OR-4JZVC6PElVuU5awOirqH2qn3Xd
    Hy_omtM1zJVvmUSxHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedriedtgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepleekveevheekffdtiedthfeiffeugfdtgfetffffteejtdfgfeevheegtedvveeg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdplhhinhgrrhhordhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhn
    uggsrdguvg
X-ME-Proxy: <xmx:D_AnZeJWPQtyq13UZwN-aTmn6sRXuGT8uHQyRrlW-G1DIklra-etwQ>
    <xmx:D_AnZWF2aD4AcGMLRW_255TmfAC2BM9XQXpzpjW77nJofDAbRWDGIQ>
    <xmx:D_AnZaVRhejCMrZccBEN-zxnTzCxlI6Bt6bsC3VWsLxsr-LE0Erh-g>
    <xmx:EPAnZdeMWWOLvDfQfh1WP6c7nMx_dSn12EbHIXS4SCNmFAteMlzFTw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BDBB7B60089; Thu, 12 Oct 2023 09:09:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <36814910-2a98-4567-af7f-684318a1ebef@app.fastmail.com>
Date: Thu, 12 Oct 2023 15:09:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: SoC fixes for 6.6, part 2
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 6465e260f48790807eef06b583b38ca9789b6=
072:

  Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-f=
ixes-6.6-2

for you to fetch changes up to 26de14831cf6e6a6ff96609a0623e1266a636467:

  IXP4xx MAINTAINERS entries (2023-10-12 13:11:30 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 6.6, part 2

AngeloGioacchino Del Regno is stepping in as co-maintainer for the
MediaTek SoC platform and starts by sending some dts fixes for
the mt8195 platform that had been pending for a while.

On the ixp4xx platform, Krzysztof Halasa steps down as co-maintainer,
reflecting that Linus Walleij has been handling this on his own
for the past few years.

Generic RISC-V kernels are now marked as incompatible with the
RZ/Five platform that requires custom hacks both for managing
its DMA bounce buffers and for addressing low virtual memory.

Finally, there is one bugfix for the AMDTEE firmware driver
to prevent a use-after-free bug.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer

Arnd Bergmann (2):
      Merge tag 'amdtee-fix-for-v6.6' of https://git.linaro.org/people/j=
ens.wiklander/linux-tee into arm/fixes
      Merge tag 'renesas-fixes-for-v6.6-tag1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/geert/renesas-devel into arm/fixes

Eugen Hristev (1):
      arm64: dts: mediatek: fix t-phy unit name

Jisheng Zhang (1):
      soc: renesas: Make ARCH_R9A07G043 (riscv version) depend on NONPOR=
TABLE

Krzysztof Ha=C5=82asa (1):
      IXP4xx MAINTAINERS entries

Macpaul Lin (2):
      arm64: dts: mediatek: mt8195-demo: fix the memory size to 8GB
      arm64: dts: mediatek: mt8195-demo: update and reorder reserved mem=
ory regions

N=C3=ADcolas F. R. A. Prado (1):
      arm64: dts: mediatek: mt8195: Set DSU PMU status to fail

Rijo Thomas (1):
      tee: amdtee: fix use-after-free vulnerability in amdtee_close_sess=
ion

 MAINTAINERS                                  | 27 +++++++++------------=
------
 arch/arm64/boot/dts/mediatek/mt7622.dtsi     |  2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    |  2 +-
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 39 +++++++++++++++++++++=
++++++++++--------
 arch/arm64/boot/dts/mediatek/mt8195.dtsi     |  1 +
 drivers/soc/renesas/Kconfig                  |  1 +
 drivers/tee/amdtee/core.c                    | 10 ++++++----
 7 files changed, 50 insertions(+), 32 deletions(-)
arnd@studio:~/soc$ git request-pull mainline/master origin soc-fixes-6.6=
-2 | xclip
Error: Can't open display: (null)
arnd@studio:~/soc$ git request-pull mainline/master origin soc-fixes-6.6=
-2 | cat
The following changes since commit 6465e260f48790807eef06b583b38ca9789b6=
072:

  Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-f=
ixes-6.6-2

for you to fetch changes up to 26de14831cf6e6a6ff96609a0623e1266a636467:

  IXP4xx MAINTAINERS entries (2023-10-12 13:11:30 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 6.6, part 2

AngeloGioacchino Del Regno is stepping in as co-maintainer for the
MediaTek SoC platform and starts by sending some dts fixes for
the mt8195 platform that had been pending for a while.

On the ixp4xx platform, Krzysztof Halasa steps down as co-maintainer,
reflecting that Linus Walleij has been handling this on his own
for the past few years.

Generic RISC-V kernels are now marked as incompatible with the
RZ/Five platform that requires custom hacks both for managing
its DMA bounce buffers and for addressing low virtual memory.

Finally, there is one bugfix for the AMDTEE firmware driver
to prevent a use-after-free bug.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer

Arnd Bergmann (2):
      Merge tag 'amdtee-fix-for-v6.6' of https://git.linaro.org/people/j=
ens.wiklander/linux-tee into arm/fixes
      Merge tag 'renesas-fixes-for-v6.6-tag1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/geert/renesas-devel into arm/fixes

Eugen Hristev (1):
      arm64: dts: mediatek: fix t-phy unit name

Jisheng Zhang (1):
      soc: renesas: Make ARCH_R9A07G043 (riscv version) depend on NONPOR=
TABLE

Krzysztof Ha=C5=82asa (1):
      IXP4xx MAINTAINERS entries

Macpaul Lin (2):
      arm64: dts: mediatek: mt8195-demo: fix the memory size to 8GB
      arm64: dts: mediatek: mt8195-demo: update and reorder reserved mem=
ory regions

N=C3=ADcolas F. R. A. Prado (1):
      arm64: dts: mediatek: mt8195: Set DSU PMU status to fail

Rijo Thomas (1):
      tee: amdtee: fix use-after-free vulnerability in amdtee_close_sess=
ion

 MAINTAINERS                                  | 27 +++++++------------
 arch/arm64/boot/dts/mediatek/mt7622.dtsi     |  2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    |  2 +-
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 39 +++++++++++++++++++++=
+------
 arch/arm64/boot/dts/mediatek/mt8195.dtsi     |  1 +
 drivers/soc/renesas/Kconfig                  |  1 +
 drivers/tee/amdtee/core.c                    | 10 ++++---
 7 files changed, 50 insertions(+), 32 deletions(-)
