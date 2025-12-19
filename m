Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B85285050
	for <soc@lists.linux.dev>; Fri, 19 Dec 2025 20:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766177170; cv=none; b=eOOK2mE3+1XYuIntmIioAUXWsa1md3NeLQzvqvlqOQndDpXVQPHbrS7OI8OzbGrYDLYag4+Vl/N7Y+gi3xKtbB/OIn9MIbf+uFcoKPeWuHAyZNNeIxCAO1RAVKtsqS0BtTONBOes2cQz2GcJAQTlnIlU01D1rb1v7U+DbqHA0Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766177170; c=relaxed/simple;
	bh=uFoiAnmfkJdBKjec/SKY3O4A9OIGwgwAd5zYY2hU5Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqZ2GY/72XeT1pY43RtVi5uNAKt2UgqCiWZIYXdC+Lju/da6Od2ZhD+6bBS9DYUDuwoRlInz0hTFxK9VWMwpkXgzsX/hNKmZCboZUpg6+pX53BxhGbm/RsG236yV2f4E+2PwYb3w8CfUkN1YGIA2MyHQQ52s7E86DM+Jnh1i1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZFS//D1I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZFS//D1I"
Received: by smtp.kernel.org (Postfix)
	id 520DDC16AAE; Fri, 19 Dec 2025 20:46:10 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77195C4CEF1;
	Fri, 19 Dec 2025 20:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 77195C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7D89FC0005DE;
	Fri, 19 Dec 2025 12:46:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7D89FC0005DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1766177167;
	bh=uFoiAnmfkJdBKjec/SKY3O4A9OIGwgwAd5zYY2hU5Mc=;
	h=From:To:Cc:Subject:Date:From;
	b=ZFS//D1I/a0QX+ABNCQJZtABaTiQ6RWS0MyTmE20f9Y8DgfjATxiaNTmLRJdPpQhw
	 z9ssngQr1ueVBA6UTzcNbWwuCcUn0pWJcSKEvbB5ofwjz7Pev9Gdplno+UoUnRmsWc
	 iLN39h4srKBJ0lhyvdeBrdY/jDDTKpfgmxeJv0U4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 302D9A340;
	Fri, 19 Dec 2025 12:46:07 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 6.19
Date: Fri, 19 Dec 2025 12:46:03 -0800
Message-ID: <20251219204603.1016528-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.19/devicetree-arm64-fixes

for you to fetch changes up to 9a96cc8bbeefbc64654ac9c3da619443c22f6d32:

  arm64: dts: broadcom: rp1: drop RP1 overlay (2025-12-19 12:42:36 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-SoC Device Tree fixes for
6.19, please pull the following:

- Andrea fixes the RP1 DeviceTree hierarchy and drop overlay support,
  this resolves a number of DTC warnings and other issues

----------------------------------------------------------------
Andrea della Porta (4):
      dt-bindings: misc: pci1de4,1: add required reg property for endpoint
      misc: rp1: drop overlay support
      arm64: dts: broadcom: bcm2712: fix RP1 endpoint PCI topology
      arm64: dts: broadcom: rp1: drop RP1 overlay

 .../devicetree/bindings/misc/pci1de4,1.yaml        |  8 ++++-
 arch/arm64/boot/dts/broadcom/Makefile              |  4 +--
 ...i-5-b-ovl-rp1.dts => bcm2712-rpi-5-b-base.dtsi} |  0
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   | 39 ++++++++++++++--------
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi        | 14 --------
 arch/arm64/boot/dts/broadcom/rp1.dtso              | 11 ------
 drivers/misc/rp1/Kconfig                           |  6 +---
 drivers/misc/rp1/Makefile                          |  3 +-
 drivers/misc/rp1/rp1-pci.dtso                      | 25 --------------
 drivers/misc/rp1/rp1_pci.c                         | 37 +++-----------------
 drivers/pci/quirks.c                               |  1 -
 11 files changed, 40 insertions(+), 108 deletions(-)
 rename arch/arm64/boot/dts/broadcom/{bcm2712-rpi-5-b-ovl-rp1.dts => bcm2712-rpi-5-b-base.dtsi} (100%)
 delete mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
 delete mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 delete mode 100644 drivers/misc/rp1/rp1-pci.dtso
