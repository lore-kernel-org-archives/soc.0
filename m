Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC00F426688
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769032821; cv=none; b=nWAyzimZcB7cbczjcasCRQ2KbDF6+pjpdhxmVZ4kWykJdKr6uAl2uG7NBsOTj1MsPje1X9Fg299EvLaudUHgtu1TAV24DQF7elj4phtwmtBYPMOmv8l9mfo++YgbkLwij0QdoPeJKPD7sDQAU/b5oXWPUM8K+XbrjSMzhMBDpgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769032821; c=relaxed/simple;
	bh=g3/bxkBn8gvWh3KBWEL3vyNV4zkCOXwGakLVpiKenIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kpev0wUHa7g4HObhCf6AUrlXWAui2nme0nxh2ankMcs4xv6Y4DLOSYKBRcUSjT2ia2x4pvLSQaSvIRH2PwkMSjDayOaZ/JH1iUuNBUPf4X+qwbO9NSckijvY1YKc1XmOeF8RTWwv+JOjgzTknkwv5KLoaWehIDs7fNHTbHq1QVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RsqEx+YA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RsqEx+YA"
Received: by smtp.kernel.org (Postfix)
	id 8C56BC19425; Wed, 21 Jan 2026 22:00:21 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97483C4CEF1;
	Wed, 21 Jan 2026 22:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 97483C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9CA78C00ED5B;
	Wed, 21 Jan 2026 14:00:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9CA78C00ED5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769032812;
	bh=g3/bxkBn8gvWh3KBWEL3vyNV4zkCOXwGakLVpiKenIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RsqEx+YAl97+H87DVdetV7dTSaYhNc/xaSH8IJqLweQH/FFJpEjIPEv2PNzj+6vU2
	 BfP1i8zJoDMC6n/yislIa2f7YHYtWnoXc7TnYs/LYPMuya4mmYXrle233kN++CS1rL
	 GnQSZGuxRZqGtdRSMOlrINJcOh+Lp5e+jV0ONYzk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7C7FF1A187;
	Wed, 21 Jan 2026 14:00:12 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 6.20
Date: Wed, 21 Jan 2026 14:00:11 -0800
Message-ID: <20260121220011.1171930-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121220011.1171930-1-florian.fainelli@broadcom.com>
References: <20260121220011.1171930-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.20/devicetree-arm64

for you to fetch changes up to a95e1d848972dd7d5cbabd62921b9b85501d891e:

  arm64: dts: broadcom: bcm4906-netgear-r8000p: Drop unnecessary "ranges" in partition node (2026-01-16 13:48:58 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs DT changes for
6.20, please pull the following:

- Peter enables the RNG on 2712 (Raspberry Pi 5)

- Stanimir adds the watchdog DT node on 2712

- Rob removes undocumneted nodes, reworks clock nodes, fixes the
  "simple-bus" node names, and cleans up additional properties and nodes
  for all Broadcom ARM64-based SoCs

----------------------------------------------------------------
Peter Robinson (1):
      arm64: dts: broadcom: bcm2712: Enable RNG

Rob Herring (Arm) (11):
      arm64: dts: broadcom: Remove unused and undocumented nodes
      arm64: dts: broadcom: stingray: Rework clock nodes
      arm64: dts: broadcom: stingray: Fix 'simple-bus' node names
      arm64: dts: broadcom: stingray: Move raid nodes out of bus
      arm64: dts: broadcom: Use preferred node names
      arm64: dts: broadcom: ns2-svk: Use non-deprecated at25 properties
      arm64: dts: broadcom: northstar2: Rework clock nodes
      arm64: dts: broadcom: northstar2: Drop unused and undocumented "brcm,pcie-ob-oarr-size" properties
      arm64: dts: broadcom: northstar2: Drop QSPI "clock-names"
      arm64: dts: broadcom: northstar2: Drop "arm,cci-400-pmu" fallback compatible
      arm64: dts: broadcom: bcm4906-netgear-r8000p: Drop unnecessary "ranges" in partition node

Stanimir Varbanov (1):
      arm64: dts: broadcom: bcm2712: Add watchdog DT node

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  15 ++
 .../dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts |   3 -
 .../boot/dts/broadcom/northstar2/ns2-clock.dtsi    | 105 ------------
 .../arm64/boot/dts/broadcom/northstar2/ns2-svk.dts |  26 +--
 .../arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts |   2 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |  87 ++++++++--
 .../boot/dts/broadcom/stingray/bcm958742-base.dtsi |   2 +-
 .../boot/dts/broadcom/stingray/stingray-clock.dtsi | 182 ---------------------
 .../boot/dts/broadcom/stingray/stingray-fs4.dtsi   | 114 ++++++-------
 .../boot/dts/broadcom/stingray/stingray-pcie.dtsi  |   2 +-
 .../dts/broadcom/stingray/stingray-pinctrl.dtsi    |   2 +-
 .../boot/dts/broadcom/stingray/stingray-usb.dtsi   |  21 +--
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 148 +++++++++++++++--
 13 files changed, 290 insertions(+), 419 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/broadcom/northstar2/ns2-clock.dtsi
 delete mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-clock.dtsi
