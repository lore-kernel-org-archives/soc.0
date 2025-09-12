Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7393427B356
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757690074; cv=none; b=XYIu1x6Dk/7bcRs4YuRZVNaL8qzsrwk6FdhYXAffkuznpVVpeFoFNiQrL9VzJS/jtahcN7UP5QjK6EYWzaV+p7T0/Hdc5498427WN/OVrPaMG9OpcWC5gQSOHSe6qoCp4OJdJnuODun8pGQ+yy1hI4aX2V7WCw1b4EBpnvIzKIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757690074; c=relaxed/simple;
	bh=pck3viMGcBAg06qNFnSEyPeB+YTq5nUeAT0ugqYhJu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YuURVkR1LKS5ZHZVd7uToSIJoJUVk897wL59/QZrxemkojx8cU8WmrnRvIz6Yk3UOiCmj0pS/15TBX4RdG/xjGSaDUTOJTpahLAnYj7KGiSlJORF3bMcZnKDe+w3iFLBXDm8qAsERRR2rNpFMzfOb30xE7o8GQna4PXKYdhgb/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qFZ8MoBP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qFZ8MoBP"
Received: by smtp.kernel.org (Postfix)
	id 29398C4CEF8; Fri, 12 Sep 2025 15:14:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F3ACC4CEF1
	for <soc@kernel.org>; Fri, 12 Sep 2025 15:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F3ACC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E1DCA1A0DC0
	for <soc@kernel.org>; Fri, 12 Sep 2025 15:14:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8B3E60638;
	Fri, 12 Sep 2025 15:14:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F263102F29C9;
	Fri, 12 Sep 2025 17:14:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757690070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qRNeTZ+u8UvNkq31cCoxDlR1+TEzwsLgubNQ4d+PvEc=;
	b=qFZ8MoBP5r0YRGWSHGljyD1LxncG97xt4lr3mF7t5BDSWW8YEEjPUgnceVlAh+AXRw2gnV
	Z+wV2k/zPCkpd51DTOUJ6HYn43Z8IE8Lt/Q+PLeT7VBLFNkue7Ka615lxTTKLGdDm387XC
	KrbYNx2rJ7E3bz9O8bdRwEBtE0WRyAM8k3Gjy5r43yVjCHxLzGZquCPv1VVM62x06dZisv
	WUl62M4FFC4AyvJDbsZoDFXS4lO2HlWYGHfJ7FSIOrpf1KfNg+CE7jU1sT8bhVajGffzrp
	CnbrIFB1JKA5fyZ6yASjMIss6r5oC6UpTjo3zqi0PsOwpwahpBhJClh2dPF8pw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.18 (#1)
Date: Fri, 12 Sep 2025 17:14:23 +0200
Message-ID: <87frcrn1o0.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Here is the first pull request for dt64 for mvebu for v6.18.

Gregory

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.18-1

for you to fetch changes up to 1cc3d6c8640e4a75dab4077121b8cafd15eab8b0:

  arm64: dts: marvell: cn9130-sr-som: add missing properties to emmc (2025-=
09-12 14:59:19 +0200)

----------------------------------------------------------------
mvebu dt64 for 6.18 (part 1)

Improve device tree correctness:
- Whitespace cleanup
- Add missing address-cells

Add new board definition for RIPE Atlas Probe v5, based on Turris MOX
(Armada 3720 SoC)

----------------------------------------------------------------
Josua Mayer (1):
      arm64: dts: marvell: cn9130-sr-som: add missing properties to emmc

Krzysztof Kozlowski (3):
      arm64: dts: marvell: Minor whitespace cleanup
      arm64: dts: marvell: armada-37xx: Add default PCI interrup controller=
 address cells
      arm64: dts: marvell: armada-cp11x: Add default ICU address cells

Tom=C3=A1=C5=A1 Macholda (2):
      dt-bindings: marvell: armada-37xx: add ripe,atlas-v5 compatible
      arm64: dts: marvell: add dts for RIPE Atlas Probe v5

 .../bindings/arm/marvell/armada-37xx.yaml          |   1 +
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      |   2 +-
 .../boot/dts/marvell/armada-3720-atlas-v5.dts      | 110 +++++++++++++++++=
++++
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |   1 +
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |   1 +
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     |   2 +
 arch/arm64/boot/dts/marvell/cn9132-clearfog.dts    |   4 +-
 arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi    |   2 +-
 9 files changed, 120 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts
