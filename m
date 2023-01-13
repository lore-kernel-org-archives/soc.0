Return-Path: <SRS0=1ZFw=5K=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4407C54EBD
	for <soc@archiver.kernel.org>; Fri, 13 Jan 2023 11:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A043BC433F1; Fri, 13 Jan 2023 11:09:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43199C433D2;
	Fri, 13 Jan 2023 11:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43199C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B91661C0008;
	Fri, 13 Jan 2023 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673608143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Qy+BYfMc3I1HUcrXyTy8CKps5bUh9EQZeZpk0EIjNfQ=;
	b=KGOFVSaNBZuI02J8S7tnrygcJzQiYF79O/0kH0ggtnzwmy1zLRtFkvB8HV+KOHrDUuITNv
	Iv8/r5+yRWDaJ5you9KzqLmKA00s9cNogC5tPtCEmW8v5b2piDGJCjVBKbTL2uPKVfJnKx
	nks1T+WhRjmZRu7RsxccuiqgT/BCFc5jwpKexfGPwtC8wr66n8tn/7rNjCu/tw0VvlAhJv
	BLcEFCr5EfxV5fc/019s7+sFGT45j/vqZOS0SB1hM/tt1E9UajF3sGrUkEDET+h7WSbXwu
	lGhKNXbdnFbv6/CjB1P4KgYW9UyPvRFe5SerSI96kCXwbfiQ9Jl1ixkW9fU1GA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v6.2 (#1)
Date: Fri, 13 Jan 2023 12:08:59 +0100
Message-ID: <87mt6mg08k.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for fixes for mvebu for v6.2.

Gregory

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-fixes-6.2-1

for you to fetch changes up to 80502ffab2fa92ba9777e381efea2efddc348d13:

  arm64: dts: marvell: AC5/AC5X: Fix address for UART1 (2023-01-10 10:29:03 +0100)

----------------------------------------------------------------
mvebu fixes for 6.2 (part 1)

Fix regression for gpio support on Armada 38x and Armada 38x

Fix address for UART1 on AC5/AC5X

----------------------------------------------------------------
Chris Packham (1):
      arm64: dts: marvell: AC5/AC5X: Fix address for UART1

Klaus Kudielka (2):
      Revert "ARM: dts: armada-38x: Fix compatible string for gpios"
      Revert "ARM: dts: armada-39x: Fix compatible string for gpios"

 arch/arm/boot/dts/armada-38x.dtsi             | 4 ++--
 arch/arm/boot/dts/armada-39x.dtsi             | 4 ++--
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
