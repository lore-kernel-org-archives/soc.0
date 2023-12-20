Return-Path: <SRS0=RoS7=H7=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9308CC3DA6E
	for <soc@archiver.kernel.org>; Wed, 20 Dec 2023 16:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 858B5C433CA; Wed, 20 Dec 2023 16:57:47 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF32DC433C8;
	Wed, 20 Dec 2023 16:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF32DC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C4F6E0009;
	Wed, 20 Dec 2023 16:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703091463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Ksr3fOzgbhr9kmbDax9H5cMCc7Gm1eI+BGoxEfVuj7M=;
	b=d+O45OuBSgXX4TG9tbqh76K4TNaIx4AM/bqzkJYIbZA08yxZERgkIComzINUk0YTGaeRyW
	EXWRGlRSz8Ds8RYeVQQeRXk/3bJSrwgp0MKB3cOgg2pHNRzY4VKxM7eQVhCEOUXet+EIWs
	15Fm0C9Izf+tQ6cHg/kZ1zi4SSCUqc+uONPZ0dNeyNqunRfP3rGlApcU1NPAd+oDGFAroO
	qAMMhGwNntpD1FuPz4MX4DXf+s7o4D6vQ2vgev+FXhWUp7m/Q8IYD9v4RwweTyEZa6E874
	c2pOhBOlBlAFqVGPPjmaRWdY9fZ7c5jXgkA2j7kf7g+I2BlxBjdbAutLmLqhsg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: drivers for v6.8 (#1)
Date: Wed, 20 Dec 2023 17:57:43 +0100
Message-ID: <87il4sbym0.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for drivers for mvebu for v6.8.

Gregory

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-drivers-6.8-1

for you to fetch changes up to aaafe88d5500ba18b33be72458439367ef878788:

  bus: moxtet: Add spi device table (2023-12-15 15:44:11 +0100)

----------------------------------------------------------------
mvebu drivers for 6.8 (part 1)

moxtet bus fixes

----------------------------------------------------------------
Sjoerd Simons (2):
      bus: moxtet: Mark the irq as shared
      bus: moxtet: Add spi device table

 drivers/bus/moxtet.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
