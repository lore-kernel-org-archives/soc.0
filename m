Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625C213DBA0
	for <soc@lists.linux.dev>; Sat,  8 Mar 2025 15:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741446342; cv=none; b=tX7TsOMPzsEnToBsbT2BboFqWHZceD5ffKTQcicE6aloIf1QVOITkha2IhhG22ykbmyzFH8KYxGlhN1WxM8pZBLuA29n3q7WA4D7wVL0dIhwhq24AGnKA5oqe3DsvuleB7fxhmNFPuuRulF/wkxmI6jJhi3K15f+0oCUq7mPInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741446342; c=relaxed/simple;
	bh=B+Gq/2+MF8fl1OnIPd3GKAn4DQ0rzPiBBwdtmpyDsZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qnXYjR1CbIcA4tVlk8SUCfNOzO40iN/P5wsfKZ/1Igz+EqoOqC1WZzLDEUyaspyWwJXDk0enrPe+DOWclgdUhzMwFeVxq5RInILeCmBnMb3P4BXKKkbqoLSo32Vh3kizhdDYD/W0Ia9KrMhT/xXk3+kPVz7WIlYjKKKc/SqFFgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=mwnpKLxA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="mwnpKLxA"
Received: by smtp.kernel.org (Postfix)
	id DFFD0C4CEE8; Sat,  8 Mar 2025 15:05:40 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A29FEC4CEE0;
	Sat,  8 Mar 2025 15:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A29FEC4CEE0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 27291C003DF1;
	Sat,  8 Mar 2025 07:05:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 27291C003DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1741446332;
	bh=B+Gq/2+MF8fl1OnIPd3GKAn4DQ0rzPiBBwdtmpyDsZ4=;
	h=From:To:Cc:Subject:Date:From;
	b=mwnpKLxAzG+nX2ywY5/RN0cXhYU2n/mAakXUwREpQhtOO4mckC+JqV2hFvwAgL/li
	 fqzRpzVLktbEljWVbQabIcZfnXJ5rovgX9XO8njs8j1C/hLkFeRk6pUOXwrg0Sg6Gb
	 mKpWh/2dmiU7YKdKpRa+qpP8ezh50grhoUj+QRdw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id B64D61800051A;
	Sat,  8 Mar 2025 07:05:31 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Tom Brautaset <tbrautaset@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom devicetree fixes for 6.14 part 2
Date: Sat,  8 Mar 2025 07:05:28 -0800
Message-ID: <20250308150528.1900822-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/devicetree-fixes-part2

for you to fetch changes up to 24d4c56dd68906bf55ff8fc2e2d36760f97dce5f:

  ARM: dts: BCM5301X: Fix switch port labels of ASUS RT-AC3200 (2025-03-08 07:03:46 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
6.14, please pull the following:

- Chester fixes the switch port assignments on the ASUS RT-AC3200 and
  RT-AC5300 routers

- Phil removes a Device Tree property flagging the BCM2711 ARM timers as
  not being configured which would have prevented the use of vDSO on the
  Pi 4 running a 32-bit kernel

----------------------------------------------------------------
Chester A. Unal (2):
      ARM: dts: BCM5301X: Fix switch port labels of ASUS RT-AC5300
      ARM: dts: BCM5301X: Fix switch port labels of ASUS RT-AC3200

Phil Elwell (1):
      ARM: dts: bcm2711: Don't mark timer regs unconfigured

 arch/arm/boot/dts/broadcom/bcm2711.dtsi                | 2 --
 arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts  | 8 ++++----
 arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts | 8 ++++----
 3 files changed, 8 insertions(+), 10 deletions(-)
