Return-Path: <SRS0=Hp3l=TV=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30A1C433F5
	for <soc@archiver.kernel.org>; Thu, 10 Mar 2022 13:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8BBFAC340F3; Thu, 10 Mar 2022 13:57:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38715C340E8;
	Thu, 10 Mar 2022 13:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38715C340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6E201E0004;
	Thu, 10 Mar 2022 13:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646920659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i+V/UjSHh9vQklik2MzY0r06J7QTkxzu6C1z2rXNrSQ=;
	b=cHy/Ib1i/UKfen7v1uc1fF60odC10bM/ipccEE0iQ7Dip+n7FBQnk3zUBuC/TRw3P3NrgD
	7jqCxQWHsryOU/ixtumfpkn1ViBh9/+cpGYBYChQlFoK0zD7YMi0dD3ZITUvkE1dTtCT5x
	VWp/rtVgBYDiwHtqdTNJLeqmI2eAIXvD7ZStIrxo1ma0YCh8rX+KGAruLMPBllPXMeb77F
	TUIOOpnmYnh3ZEx2zHDkvOPUb5L8TmLekXJLR9RKwOL/eOo2UvMAzMy6crIQe09bIUKSBn
	0GVfKW2aywvL6BO7yPAYF6keTkv/QaNCb34US7TC8XwCxe41MVP1dlnJb95NCQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v5.17 (#2)
Date: Thu, 10 Mar 2022 14:57:32 +0100
Message-ID: <87bkydj4fn.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the second pull request for fixes for mvebu for v5.17.

Actually on the first pull request was not merged and only one fixes has
been cherry pick. So this tag is directly based on v5.17-rc1.

Gregory

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-fixes-5.17-2

for you to fetch changes up to a1cc1697bb56cdf880ad4d17b79a39ef2c294bc9:

  arm64: dts: marvell: armada-37xx: Remap IO space to bus address 0x0 (2022=
-03-10 14:49:10 +0100)

----------------------------------------------------------------
mvebu fixes for 5.17 (part 2)

Allow using old PCIe card on Armada 37xx

----------------------------------------------------------------
Pali Roh=C3=A1r (1):
      arm64: dts: marvell: armada-37xx: Remap IO space to bus address 0x0

 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 7 ++++++-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi           | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
