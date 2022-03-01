Return-Path: <SRS0=TJev=TM=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DA7C433F5
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 14:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B0E3C340F0; Tue,  1 Mar 2022 14:20:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F173C340EE;
	Tue,  1 Mar 2022 14:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F173C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CEC6D4000E;
	Tue,  1 Mar 2022 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646144444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1j8fGmj0E2qiVpOhY8IerMojlTGPQI9UqWpyD2z5i8k=;
	b=XeZGgfAal2R+aUjUhJbAkYF242o554t2IIhzbNKVOdRZ1qEDxNerhNE55IzdOXlZfeB6lC
	OyAvUzEBbcCXRyctXIa00XR+YaSJLL7YbBftgpKqYD/PJIpJwJ0uGjWJ7QmNhfoOXlRpAe
	coKaPOzM9wKLK+8sJZ2oK2V5jHww7plHrNVXoeHGIxCyaowloq8Ur1FMbPPVuhxB+h/zVB
	rkBYl7thr0A2qIhVC1dUQ8CEXK628/3Py4IYwU2qSbp5ZlRG/Q5fk72rfkp3b2Ic4n5pjJ
	iSJsmNvV1KQf6pd9CijfO72HPQalIsGV7Q9YwlaY8B/RS2JFp6v7E1+Quh+vhg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v5.18 (#1)
Date: Tue, 01 Mar 2022 15:20:43 +0100
Message-ID: <87pmn5zrd0.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt for mvebu for v5.18.

In this pull request there is also a patch updating the device tree
documentation, if you can't take it, I can do a new pull request without
it.

Thanks,

Gregory

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-5.18-1

for you to fetch changes up to c4deb8344a76831879540f3bd9c0b3cdc1d4b2ef:

  ARM: dts: turris-omnia: Set PCIe slot-power-limit-milliwatt properties (2=
022-03-01 11:47:13 +0100)

----------------------------------------------------------------
mvebu dt for 5.18 (part 1)

Add new 2 bays NAS:
 - Ctera C200 V1 (kirkwood based)
 - Ctera C200 V2 (armada-370 based)

Add support for PCIe legacy INTx interrupts on Armada 385

Add PCIe proprty to limit the power on miniPCIe slots in Turris Omnia

----------------------------------------------------------------
Pali Roh=C3=A1r (2):
      ARM: dts: armada-385.dtsi: Add definitions for PCIe legacy INTx inter=
rupts
      ARM: dts: turris-omnia: Set PCIe slot-power-limit-milliwatt properties

Pawel Dembicki (3):
      dt-bindings: vendor-prefixes: Add Ctera Networks
      ARM: dts: kirkwood: Add Ctera C-200 V1 board
      ARM: dts: mvebu: Add Ctera C-200 V2 board

 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/armada-370-c200-v2.dts           | 388 +++++++++++++++++=
++++
 arch/arm/boot/dts/armada-385-turris-omnia.dts      |   3 +
 arch/arm/boot/dts/armada-385.dtsi                  |  52 ++-
 arch/arm/boot/dts/kirkwood-c200-v1.dts             | 310 ++++++++++++++++
 6 files changed, 749 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/boot/dts/armada-370-c200-v2.dts
 create mode 100644 arch/arm/boot/dts/kirkwood-c200-v1.dts

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
