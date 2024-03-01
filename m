Return-Path: <SRS0=YUml=KH=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0EAC5478C
	for <soc@archiver.kernel.org>; Fri,  1 Mar 2024 16:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7578C43390; Fri,  1 Mar 2024 16:05:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 311F8C433F1;
	Fri,  1 Mar 2024 16:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 311F8C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9D4A60003;
	Fri,  1 Mar 2024 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709309152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4o/mwS40lD6Y9piUSsLHU1mt5la24tTmPRxqL00705E=;
	b=YTR8dsL9bNpe9iqQ7LwMx5ce6vUqIscF1VDfdPhPUZosN9Yk6rv02shtqoXaJ6YiZV/QLG
	ZuIoB98RvcCXAYI2q4wNiHlmW2puvEJ27+vCB/8BJs5itUZwIhC1v52ANXac4hGyRAAsKb
	VmyMaeNVcG1BJis4YwAR9zxeOuOwc7FvAB2UxXHdUMpCW+PoAbqrzlzYoQmZhFMzuxWDLc
	Gya8SMMBlfJskJnWJsv0sCRv14OZlArE/M4eJXsM9D64JzQKYRVpGdJdD0dTpQY0EpK1yr
	S7ZhVD2tvHZQ1B+nqi7xDfSE0rWHMdlBRgxACX5/eBtF8y15EflYOcmD163cag==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.9 (#1)
Date: Fri, 01 Mar 2024 17:05:51 +0100
Message-ID: <87a5nihr8g.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt64 for mvebu for v6.9.

Gregory

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.9-1

for you to fetch changes up to ecd815b862ddf3637275a09ba274a843b9a4d7e0:

  arm64: dts: armada-ap807: update thermal compatible (2024-02-27 17:41:34 =
+0100)

----------------------------------------------------------------
mvebu dt64 for 6.9 (part 1)

Add mmc support for AC5
Reorder crypto interrupts on Armada 3720
Use the correct thermal coefficients for the Armada AP807 dies

----------------------------------------------------------------
Alex Leibovich (1):
      arm64: dts: armada-ap807: update thermal compatible

Elad Nachman (1):
      arm64: dts: ac5: add mmc node and clock

Rafa=C5=82 Mi=C5=82ecki (1):
      arm64: dts: marvell: reorder crypto interrupts on Armada SoCs

 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi   | 31 +++++++++++++++++++++=
+++-
 arch/arm64/boot/dts/marvell/ac5-98dx35xx-rd.dts |  4 ++++
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi    | 10 ++++----
 arch/arm64/boot/dts/marvell/armada-ap807.dtsi   |  3 +++
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi   | 10 ++++----
 5 files changed, 47 insertions(+), 11 deletions(-)
