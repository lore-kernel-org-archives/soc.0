Return-Path: <SRS0=B5jS=MC=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A562C4345F
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CE37C4AF19; Mon, 29 Apr 2024 21:37:08 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 383C1C4AF17;
	Mon, 29 Apr 2024 21:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 383C1C4AF17
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E5C30C0000ED;
	Mon, 29 Apr 2024 14:37:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E5C30C0000ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714426626;
	bh=KIwtlIj7N04Omnwd9DoqXCPZK34dNsnXgS98p4ZIqcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NpCDBiMdLZOBY8f9THj4HNH9d/MoTJtbr2qfqSTJ4zhdTKChpqX/gadT5EJdhZHu/
	 wNmYOGz7eIBiQ4fLjVKs4h2YRxqGIyP9c6MSmJZBS075Ja5a68J6SI2zj+wZchj7v2
	 0KgbpSTpsseX1kK3HMlMnmwqHxSBxgoxQnvHPoqk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 15A6118041CAC8;
	Mon, 29 Apr 2024 14:37:04 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/4] Broadcom drivers changes for 6.10
Date: Mon, 29 Apr 2024 14:37:03 -0700
Message-Id: <20240429213703.2327834-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429213703.2327834-1-florian.fainelli@broadcom.com>
References: <20240429213703.2327834-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.10/drivers

for you to fetch changes up to 4cf39b01c1745439197532f3d736875630d93cb3:

  bus: brcmstb_gisb: fix module autoloading (2024-04-10 10:55:05 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoCs drivers for 6.10, please pull
the following:

- Krzysztof fixes the brcmstb_gisb driver module auto-loading by adding
  a missing MODULE_DEVICE_TABLE

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      bus: brcmstb_gisb: fix module autoloading

 drivers/bus/brcmstb_gisb.c | 1 +
 1 file changed, 1 insertion(+)
