Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3162C234E
	for <soc@lists.linux.dev>; Mon, 23 Mar 2026 19:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292574; cv=none; b=P6wWqYx+POyijHkYmKuQK73Qq7HtIK0mN3q9q3kg+UpfrPV6Tr6TwEvDETka27d0xxQKlz6iabBvxp4/xA5YtIw7s5IDfWJWaBOfR73oCU4A68Cv1xFXgZP556HPsxXSZ0E8fFR8luczbRqnaREPHtV/CANEnMPLWmUNxLUnfX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292574; c=relaxed/simple;
	bh=yqpAc7V9WCTRIGe30R7iuLeFEQo1jVQHIymH9wVe40M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AezoQharqO5zd4TKQo1MkIclGp+JuDDb7dW1nR8UkUAVfz7EKnUIi7XPLdszbsB0rHuaMcghrA+tpRVXe8JpUiDx07A1420tmpEMgNwydKvYpEsDmj425Y4zU9oOtZ+ggSDb9q4wYPDUT3Nc09k16MY51w8NmBWNhScMs+zDIbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TKKnRNMs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TKKnRNMs"
Received: by smtp.kernel.org (Postfix)
	id 3F94FC2BC87; Mon, 23 Mar 2026 19:02:54 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65A32C2BC9E;
	Mon, 23 Mar 2026 19:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65A32C2BC9E
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B4EB7C0000E3;
	Mon, 23 Mar 2026 12:02:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B4EB7C0000E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774292565;
	bh=yqpAc7V9WCTRIGe30R7iuLeFEQo1jVQHIymH9wVe40M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TKKnRNMsCn1pFUClgZL2Z7hmqgnjCPI4RUJIjMzyneGMFQvyucJqVua3ShEyLPe5H
	 RQaBYafLZXe4FEylLL69b3vOuZu3fk0Fan+XORk96B0PLri0sMsJ12ZZqgfAZQKpMi
	 U/yKBjdLbMsHSPR3vIWl2oNpg+yOU+Twx0jcNncc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 94A7BA88;
	Mon, 23 Mar 2026 12:02:45 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
Date: Mon, 23 Mar 2026 12:02:39 -0700
Message-ID: <20260323190239.1890505-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.1/devicetree-arm64

for you to fetch changes up to 0acb1de2b4df426a62dba33bcd80f3939636f97b:

  arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level (2026-03-20 10:17:30 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree updates
for 7.1, please pull the following:

- Maira adds the V3D DT node to the 2712 (Raspberry Pi 5) SoC

- Gergor adds the I2C controller, CSI (camera), ISP (image signal
  processor), fixes the pinctrl node and updates the UART10 interrupt
  for the RP1 sister chip to the 2712 (Raspberry Pi 5)

- Rob moves the firmware and GPU to the root level to fix DTC warnings

----------------------------------------------------------------
Gregor Herburger (6):
      arm64: dts: broadcom: rp1: add i2c controller
      arm64: dts: broadcom: rp1: add csi nodes
      arm64: dts: broadcom: bcm2712: add camera backend node pispbe
      arm64: dts: broadcom: bcm2712-rpi-5-b: add pinctrl properties for csi i2cs
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: add fixes for pinctrl/pinctrl_aon
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: update uart10 interrupt

Maíra Canal (1):
      arm64: dts: broadcom: bcm2712: Add V3D device node

Rob Herring (Arm) (1):
      arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level

 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |  14 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  55 +++++------
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  24 +++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  29 +++++-
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi       | 105 +++++++++++++++++++++
 5 files changed, 196 insertions(+), 31 deletions(-)
