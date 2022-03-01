Return-Path: <SRS0=TJev=TM=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B2FC433EF
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 14:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3E2EC340F2; Tue,  1 Mar 2022 14:15:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7988BC340F0;
	Tue,  1 Mar 2022 14:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7988BC340F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D783D40009;
	Tue,  1 Mar 2022 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646144143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F3x3lkFJT+ZRj61/DNlVXG7ArvV5MVZ+fAxKdhm4608=;
	b=U708p2T8Mit9I7xir3u5rszvGTOYeECZfHLmG6UFozEfp60xXA0+A74k0o9MlTIgSYbO1i
	OYeBCARboKQQl3buap8qHTow54zHURJnHb33fI8lrZ4yIJcOH02UgVqt+3xCfGHRLTF+Pw
	4xSgV2imRmn3EZNo/uR7Of7idY6CGcwybTih5ZPB4OWMNq1eb8w+5UvWoamupTyLFqDKQk
	CV1o4jVmFNhF/B0VtIRwESA+yw9YqJWcK9VI8ElPD5Hfb4Q83epElvpAbKyG3OEbviObae
	QGfyCILKyJdIJrcG4vXCXhBJqpCjHjNybmvjdheKUWQ5yQ3kGVSV71606qm3fg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.18 (#1)
Date: Tue, 01 Mar 2022 15:15:31 +0100
Message-ID: <87v8wxzrlo.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Hi,

Here is the first pull request for dt64 for mvebu for v5.18.

Gregory

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-5.18-1

for you to fetch changes up to 5344930c64ab7416bc845142dd1367120614b51c:

  arm64: dts: marvell: armada-37xx: Add clock to PCIe node (2022-02-28 16:51:32 +0100)

----------------------------------------------------------------
mvebu dt64 for 5.18 (part 1)

Add PCIe clock resource for Armada 37xx

----------------------------------------------------------------
Marek Beh.ºn (1):
      arm64: dts: marvell: armada-37xx: Add clock to PCIe node

 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 1 +
 1 file changed, 1 insertion(+)
