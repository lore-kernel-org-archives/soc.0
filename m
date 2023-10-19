Return-Path: <SRS0=Y2Br=GB=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECD9CDB465
	for <soc@archiver.kernel.org>; Thu, 19 Oct 2023 15:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5CF4AC433CA; Thu, 19 Oct 2023 15:11:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4940BC433C7;
	Thu, 19 Oct 2023 15:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4940BC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B5C3E0005;
	Thu, 19 Oct 2023 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697728282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=LzU9o8aL8qYSfnTfbZtI7YEw5Ut6K4FVwFL0uJoJPxA=;
	b=Ys1nfwfN/8UNjHqsYiaMf9Kft11lr+h+2lUiObo4KdZhxNUynh+imbw4cUB3wNkzvpObA2
	CVB2XTuZUNsyi+DHeIInHf4ofK0D8aPvAfRsAdXYAF1A6Sc45woWO7psxeM0Td8Zaimq9h
	1JG7gwRg77dNwtnslFrn+9D6+ejfTT9AvPjvuxtEAfz6LvhTRBQLmh8InKcFDlBD2tXdP4
	ir6Qr83gzBHvWYNC14+qTqU06Zra+LnJ6Y44HA6E2y3230K4OIfS7iUJ2itwzfJbOkzdln
	QaXiA6T1XIiY+w6QmZtPhz6FNPSSdRsM08s1rssbC4hfzWTbNbQ7BUpYa/w6EQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v6.6 (#1)
Date: Thu, 19 Oct 2023 17:11:21 +0200
Message-ID: <875y32abqe.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for fixes for mvebu for v6.6.

Gregory

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-fixes-6.6-1

for you to fetch changes up to 1122a9c2ebe02435014a0f40dcc50f4333286f0f:

  MAINTAINERS: uDPU: add remaining Methode boards (2023-09-20 11:47:13 +0200)

----------------------------------------------------------------
mvebu fixes for 6.6 (part 1)

Update  MAINTAINERS for eDPU board

----------------------------------------------------------------
Robert Marko (2):
      MAINTAINERS: uDPU: make myself maintainer of it
      MAINTAINERS: uDPU: add remaining Methode boards

 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
