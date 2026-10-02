Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EAB44213A
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 19:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970677; cv=pass; b=DtJQEa9mMp/Mo7So0RwkNeG4mxlK+SccoVeYBixgEBpD05NATKTuIMqG4l6cX6EJ+Kpbv1d2NsS+9ESBB0R+3RT/jz2G8LKpiD8tGtYOLMHezHhr4gCKopxQLs1t46c4Y3qAHWyvfkZXBus3fulnSu0tjsy0o/2SousW9OpfZsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970677; c=relaxed/simple;
	bh=WiNBuEQv6dMvTXhO9orx74TnReKesSrj/Ai1PYKpad4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCbJOavcAB5CiDT3WRbi1rKnyu7zAGtWZL9/fVJ/CfHegBvDWiVBSiZmMWK8Tqf1CTUWqzk9B8sAnI3o08/sxvWv9ioXjuKG59oCjmLYEDc6MmEN7JwIJWjt1MW4yFIGuTUIk+El/Yn4skjWbZhZDkdFrj50wsSxYUskVL9FOO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HEqIMhHd; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HEqIMhHd"
Received: by smtp.kernel.org (Postfix)
	id D54361F00893; Fri,  2 Oct 2026 19:50:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=192.19.166.231
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790970656;
	b=K/PRIee4T29KPtVCR6hzwW0ukEGRkFK9SWH6Yu8QtAOOGyUHP4BX/G3NE2MJ7Hks4sE8
	 VszWOkInPWthI46tBVfrBxeuYlUZEmenfDaR57BvqDeCse+f+sSMXDCE2UPJqye9gkfRR
	 YuZjYzt3f5xaCmeNfbVR+IoeYpZwrHoDKG0phK4OL/WOX96r7u6g8VJKHZNXsNHfGXTWb
	 I4Y+6MrEULR3GW/W6+CafbTjHs/ys5EIAgpIxec8IdU7lwTG+tiZgBtJTUi8AID18xbWl
	 U9WNDI1HHT9L9aEUn3jrzACvY/Ap32uzaZcuF5AhRlk51jl5CDtAFcmIRBzjrcLaZ+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790970656;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m0VvAogCPfC8hL2UvXxXnVJMr1C6NdDN0eRshYZll/E=;
	b=v/r3x5BDYzV/89tQKD+l2nstVIyIwUbFugLbU2SKLpwv+XTS4Lgz24K79fQSZXhDZWnC
	 5mhXoDDlBrdkDSnXFbrnvxrlPU6FxxgqrAmRfjfW/APTliCQ2TBgvQJgGqUyrH9+pPCs0
	 fMMM7hMBeFVdt+1alpadVfYLlxJ4yhnJKQpKC5N25bNWS4B/fElDfyVOPxqm3bOwc89qf
	 uYj4I7rLHD4pVQfSr/ey3WC9bhI1wFi/hPHQmfsK/WX0XtEXXQL8LbEULXKCM/NJAq86m
	 LBpdWmynO2Ahabb34lSYcTJQk+3/bkObxDx8lCNA0VFXvvehpQj4/ZKwmeknHAc68FA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=HEqIMhHd;
	dmarc=fail header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	arc=none smtp.remote-ip=192.19.166.231
Received: from relay.smtp-ext.broadcom.com (lpdvsmtp11.broadcom.com [192.19.166.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18CF21F000FF;
	Fri,  2 Oct 2026 19:50:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=HEqIMhHd
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 18CF21F000FF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C255FC0000D0;
	Fri,  2 Oct 2026 12:50:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C255FC0000D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1790970648;
	bh=WiNBuEQv6dMvTXhO9orx74TnReKesSrj/Ai1PYKpad4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HEqIMhHd8hcJlFaIrYL6xLoVkeb0M3qDObAnx8przMPDOHpeVMmJ6mgMIOPyGAtig
	 GgaaF8WHin83kyHVL96lGK4UV0HiiIkp/iKCRktde3ebhOl3nsCqab34KMYvuLMNQ0
	 s8FtrbmqbIUg1Wbr3wGTydwkVC13mKYgI12pXQ1M=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 97BE5A88;
	Fri,  2 Oct 2026 12:50:48 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Daniel Drake <dan@reactivated.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.4
Date: Fri,  2 Oct 2026 12:50:46 -0700
Message-ID: <20261002195046.364682-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002195046.364682-1-florian.fainelli@broadcom.com>
References: <20261002195046.364682-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.4/devicetree-arm64

for you to fetch changes up to 4db272ba40c09eafda1ec0a4d59c0423561c8f7a:

  arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes (2026-09-28 11:24:14 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree changes
for 7.4, please pull the following:

- Peter adjust the display DT nodes status properties since it may not
  be used by default and therefore that must be done at the board level.
  He also adds the ARM PMU, thermal monitor (TMON), USB OTG nodes.

- Gregor adds the 2712D0 stepping compatible string because there is a
  need to differientate the D0 stepping to avoid crashes on boot when an
  incorrect DTB is selected. He also adds the SPI controller to the RP1
  southbridge chip

- Stanimir adds the RP1 PWM node

- Daniel adds the GPU IOMMU and IOMMU cache nodes to the 2712 DTS

----------------------------------------------------------------
Daniel Drake (1):
      arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes

Gregor Herburger (4):
      dt-bindings: arm: bcm2835: Add 2712-d0 Stepping
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: add compatible
      arm64: dts: broadcom: rp1: add spi controller
      arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0 interface

Peter Robinson (4):
      arm64: dts: broadcom: bcm2712: adjust display status
      arm64: dts: broadcom: bcm2712: add arm PMU
      arm64: dts: broadcom: bcm2712: Add thermal monitor
      arm64: dts: broadcom: bcm2712: Add USB OTG port

Stanimir Varbanov (1):
      arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |   6 +
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |   5 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  41 +++++++
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  34 ++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  91 +++++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi       | 128 +++++++++++++++++++++
 6 files changed, 305 insertions(+)
