Return-Path: <SRS0=FUiy=D5=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AD2C0015E
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 21:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36C3BC433CA; Sat, 12 Aug 2023 21:24:32 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 045F2C433C7;
	Sat, 12 Aug 2023 21:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 045F2C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DD3720003;
	Sat, 12 Aug 2023 21:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691875466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=fJK5m69TEgMRKl5CNdDDuhjBwZhgd9GgfEtaTWo9xKA=;
	b=NpTVLSu5oWmYXMq75XNn2W4aTzZ4aIovV1q2gI7x1gllKsm/7L8hRVO4nzDrQA2vvmj8Iw
	egq/DH3XkLyPRRI3K89SYcnL0gePyGqmeJuN6gbdrtXuBf+M0pBsV+Ztq7CUZEraC231Wr
	wQElzbwbCvzWbXvxx+OQVPYeZKWIMbzlJ0WKs6xrx3g5PIHt+1rd+2bXVK+eXZ1h7PtU4m
	R4Ul35lI2x/MdCTFbysEpTaAI5AnZw6sIGBGFdCmg6bEUNKf1FdV1JSTFJYfThI8V58zxN
	/6ypqm5Trr4y0KVMYwVWlAdXY9NhVm1yIlCJ9j67KGuW4q5i1dcU/h8OMXXm+w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v6.6 (#1)
Date: Sat, 12 Aug 2023 23:24:25 +0200
Message-ID: <87jzu0t0mu.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for arm for mvebu for v6.6.

Gregory

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-arm-6.6-1

for you to fetch changes up to 693d28730db31cbd6f57ab7591950ca734a7bf1d:

  ARM: dove: Drop unused includes (2023-08-12 17:00:30 +0200)

----------------------------------------------------------------
mvebu arm for 6.6 (part 1)

DT related headers clean-up

----------------------------------------------------------------
Rob Herring (2):
      ARM: mvebu: Explicitly include correct DT includes
      ARM: dove: Drop unused includes

 arch/arm/mach-dove/common.c    | 2 --
 arch/arm/mach-mvebu/kirkwood.c | 1 +
 arch/arm/mach-mvebu/pmsu.c     | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
