Return-Path: <SRS0=p1VZ=34=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF948C4332F
	for <soc@archiver.kernel.org>; Mon, 28 Nov 2022 00:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8CBBC433B5; Mon, 28 Nov 2022 00:42:58 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1398C433D6;
	Mon, 28 Nov 2022 00:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1398C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F17A6240002;
	Mon, 28 Nov 2022 00:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669596173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kwsc+0UF9pWSjiOSULBpsn4UHiJ8XxwF6+rG3fDsvcc=;
	b=Q2OfMPfgp6Iz4AjHVHmgb6vTK7PPDwtb0HxqUOgrq1ACX58AsvoP67KyV9yanAaoIjDM1g
	xU9WZ8iXPfyN7r1lZsSPpOWEksozYuIDk8lpqWxkehu73J7/ECt3BwuxjoefWzURZppW+N
	YwIx5BZ1bdZzNQWDqfp4WRuHaz2FssXO21Tpr29/h0Xeb8xFCh4/vhSAULcal62s4pxTKR
	+WjgX25IP+dUz0n4vsrrrhrvGuS24Rh6nr8/lqVAQhW/KxNGxNWp/o4+SiVE7z6ycm9pXw
	AfJNA2BFioz3ySEE4n2gxs8rcOr5SIH1DtcTt++EgV4CSQLjHjhxYAEIOds2Jw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.2 (#1)
Date: Mon, 28 Nov 2022 01:42:52 +0100
Message-ID: <87fse39aer.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt64 for mvebu for v6.2.

Gregory

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.2-1

for you to fetch changes up to 99d2900f5fa4b8021631a604cf54b52b94587722:

  arm64: dts: marvell: add optee FW definitions (2022-11-28 01:23:11 +0100)

----------------------------------------------------------------
mvebu dt64 for 6.2 (part 1)

Update cache properties for various Marvell SoCs
Reserved memory for optee firmware
Turris Mox (Armada 3720 based Socs)
 - Define slot-power-limit-milliwatt for PCIe
 - Add missing interrupt for RTC

----------------------------------------------------------------
Konstantin Porotchkin (1):
      arm64: dts: marvell: add optee FW definitions

Pali Roh=C3=A1r (2):
      arm64: dts: armada-3720-turris-mox: Define slot-power-limit-milliwatt=
 for PCIe
      arm64: dts: armada-3720-turris-mox: Add missing interrupt for RTC

Pierre Gondois (1):
      arm64: dts: Update cache properties for marvell

 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi          | 1 +
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 4 ++++
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi           | 5 +++++
 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi     | 1 +
 arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi     | 2 ++
 arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi     | 2 ++
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi          | 5 +++++
 7 files changed, 20 insertions(+)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
