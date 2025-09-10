Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2E526F2AA
	for <soc@lists.linux.dev>; Wed, 10 Sep 2025 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757524762; cv=none; b=NnQANyu2aUoJkpIlg7/H+8KhEgc7n/d+tySAsNQnBllJ5XlDuyBtelhyfP1xSvdFBhdKd00oZTpJe0C3JdMPHC+Zq94MdHdiKpmrjDHU/V52+bYU2EDqz8Kw+8bRnFWiiFX5iiKymTFGaT8kUURHnQMeOJuY/8+09wfQRmCp954=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757524762; c=relaxed/simple;
	bh=3JaGGkYPrj7W26R9HVw+X9h4UiLIja9300j/1qO4xYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7YQc0Sf83gaKBjvpj0aOluG89XjL6CR62b6blFvX2v8wYUZgmCijYWWSGiFbZ2t32gHn9hwXXQ2Oxz/pu3lY76hvvRWk3Q1KHVU0wyAuBh8zBvhQZzIRkQt5Hm4EOXrKuuAN+4H7uCACmzan2F8OEY8idi2ib2Ow93cqt/VylU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PfuRpLAO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PfuRpLAO"
Received: by smtp.kernel.org (Postfix)
	id 357E6C4CEFB; Wed, 10 Sep 2025 17:19:22 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3609C4CEEB;
	Wed, 10 Sep 2025 17:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3609C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D4782C003AA1;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D4782C003AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757524753;
	bh=3JaGGkYPrj7W26R9HVw+X9h4UiLIja9300j/1qO4xYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PfuRpLAOnwsafeLxMg4m3s575vJ3s3c/1itfgDfAYYDicvh/K93IelECfXa9eKK2P
	 SOWZ+ho/vJSoZYN+jcBMJJx1dzpUBeaPSWpbhpx/Fz+0t6im7VLtVA1MgNTtOgicX5
	 rNihvjzINWXSxL1SUdrqhQ75WrFCD1ClDC1jL1V4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 8464518000847;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Taishi Shimizu <s.taishi14142@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/4] Broadcom devicetree changes for 6.18
Date: Wed, 10 Sep 2025 10:19:08 -0700
Message-ID: <20250910171910.666401-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910171910.666401-1-florian.fainelli@broadcom.com>
References: <20250910171910.666401-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree

for you to fetch changes up to 484199a02aca6c7ea99501eec2fc73cb808e209d:

  ARM: dts: BCM5301X: Add support for Buffalo WXR-1750DHP (2025-09-03 13:47:46 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM SoC Device Tree changes for
6.18, please pull the following:

- Taishi-san adds support for the Buffalo WXR-1750DHP using a BCM4708
  SoC

----------------------------------------------------------------
Taishi Shimizu (2):
      dt-bindings: arm: bcm: Add support for Buffalo WXR-1750DHP
      ARM: dts: BCM5301X: Add support for Buffalo WXR-1750DHP

 .../devicetree/bindings/arm/bcm/brcm,bcm4708.yaml  |   1 +
 arch/arm/boot/dts/broadcom/Makefile                |   1 +
 .../dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts   | 138 +++++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
