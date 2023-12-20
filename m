Return-Path: <SRS0=RoS7=H7=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A25C3DA6E
	for <soc@archiver.kernel.org>; Wed, 20 Dec 2023 16:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BAFDC433CA; Wed, 20 Dec 2023 16:49:57 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEBB6C433C7;
	Wed, 20 Dec 2023 16:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EEBB6C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7588A1BF208;
	Wed, 20 Dec 2023 16:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703090992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=aq5WmVdyvHOt8QCRCr4HYpv3hceTi2MUsTrq0b9WcqM=;
	b=lCfT3kataBjE3GtTcnhfeXo2NBabH/489SQjs++HqXdetD7YLlhmJioBV5YAvQJM2O1CQn
	wp5mR661gKAd8Io5qIhUc5O3msLrNO8dP2LF9a4yb1isFNoAKZpvdlaR/MaFIu0AJMMK09
	jZvfS+HkNxizyoouxCTWPAdMBV+DDxttu+5LmvnFXZeSav97uo6Ftvpwz/uNlaDOpwuN0b
	CzC5Uihu6TJx3zZxiai3jRRnoO2lskWVrRlbYaY4g6IKqKm+ZMeasuzlxYtvklnAg/edfw
	CwhBmzGNitZrvrwiDpCw+eZbiTmGANalS9y4WkbIxhS6hShpug/b0vifdhCw2g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v6.8 (#1)
Date: Wed, 20 Dec 2023 17:49:51 +0100
Message-ID: <87r0jgbyz4.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for arm for mvebu for v6.8.

Gregory

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-arm-6.8-1

for you to fetch changes up to a2c568ad9936014020e5586a0bdb5f5bf1d94e21:

  MAINTAINERS: add Marvell MBus driver to Marvell EBU SoCs support (2023-12-15 15:25:11 +0100)

----------------------------------------------------------------
mvebu arm for 6.8 (part 1)

Update MAINTAINRES entries for Marvell MBus driver

----------------------------------------------------------------
Lukas Bulwahn (1):
      MAINTAINERS: add Marvell MBus driver to Marvell EBU SoCs support

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
