Return-Path: <SRS0=B5jS=MC=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29920C4345F
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18903C4AF17; Mon, 29 Apr 2024 21:37:13 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2637DC113CD;
	Mon, 29 Apr 2024 21:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2637DC113CD
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7FD20C0000E4;
	Mon, 29 Apr 2024 14:37:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7FD20C0000E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714426625;
	bh=oWT+0Khnmg+xAKaGQ/qWGePo5HCudKfsSC3599rV1n4=;
	h=From:To:Cc:Subject:Date:From;
	b=T+ulanJvW5XIcT0ronCV7KaIiF4I/QBRR7xRnOgyB7szWUM4VGWzQeRTTK9Kd20Ko
	 9VIFDcXHwott3Q84vNwbHZOKHsBZTqwCqWM1yETVoKVqqhDFL3Um8l9RF4E9FgBZwB
	 TqF6zIhiewrxjMis1mKfH07fbx/y+ORVGPlOs0Yg=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 9AF3918041CAC4;
	Mon, 29 Apr 2024 14:37:03 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/4] Broadcom defconfig-arm64 changes for 6.10
Date: Mon, 29 Apr 2024 14:37:00 -0700
Message-Id: <20240429213703.2327834-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.10/defconfig-arm64

for you to fetch changes up to 4b792989c64f008d74a8a071280752660bb99d27:

  arm64: defconfig: build snd_bcm2835 as module (2024-04-14 09:05:08 -0700)

----------------------------------------------------------------
This pull request contains updates to the ARM64 defconfig file for 6.10,
please pull the following:

- Stefan enables the snd_bcm2835 module build to mimic what is done in
  bcm2835_defconfig and improve build coverage and testing

----------------------------------------------------------------
Stefan Wahren (1):
      arm64: defconfig: build snd_bcm2835 as module

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
