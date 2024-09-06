Return-Path: <SRS0=bPQw=QE=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28152E6FE3D
	for <soc@archiver.kernel.org>; Fri,  6 Sep 2024 18:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E38DBC4CECA; Fri,  6 Sep 2024 18:06:54 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5203C4CEC7;
	Fri,  6 Sep 2024 18:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5203C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1AD77C0000FF;
	Fri,  6 Sep 2024 11:06:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1AD77C0000FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1725646007;
	bh=HH8NtsunwQns1uNnTpjRV7dgtaL+15wKzRmdamiYryM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QvUCD9BYDid0rkz1VSGHCX4ok67Ca1OBjL+HNIs3sixh7t1wBvjK80jXUoiSrwOTt
	 bAJi4P4ZRql2Qzv1AwvVP4u+QCxAU7Kz0QxC/8IRZYT79D8Kcyn4gysfVOKwsSNtXb
	 YbE3eM1XKDy8uzQ5HDP9keHC/HNPSRZICsFJV6nc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id BD49318041CAD2;
	Fri,  6 Sep 2024 11:06:46 -0700 (PDT)
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
Subject: [GIT PULL 3/4] Broadcom drivers changes for 6.12
Date: Fri,  6 Sep 2024 11:06:42 -0700
Message-ID: <20240906180643.2275460-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240906180643.2275460-1-florian.fainelli@broadcom.com>
References: <20240906180643.2275460-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.12/drivers

for you to fetch changes up to 70c2cf283c2ff475e3a07d62ead91a11b18376b1:

  firmware: raspberrypi: Improve timeout warning (2024-08-13 13:21:28 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoC driver updates for 6.12, please
pull the following:

- Stefan improves the timeout warning within the Raspberry Pi firmware
  driver

----------------------------------------------------------------
Stefan Wahren (1):
      firmware: raspberrypi: Improve timeout warning

 drivers/firmware/raspberrypi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
