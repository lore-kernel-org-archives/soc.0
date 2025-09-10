Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F3C26F2AA
	for <soc@lists.linux.dev>; Wed, 10 Sep 2025 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757524762; cv=none; b=dMPumz58D15SY9u1O+PMYdN2FUv3D7+X0Fyh72EVoksuN1EwROJWRonFbw9eRh7OLJ7wlGzaTNB+E+L5O9Wtth8LBXJ8RbtX8m5n93Inq2iJmlPtG7tPNNemVr+J9aLN9sG7poc/q09oDcwx1I6+c6ezMOhPo2xDaPJ5to8hB9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757524762; c=relaxed/simple;
	bh=rl0U26Y/Z4PNUS4Zgspmy5Z7/zfxkT1YPC9XXuffGM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNk814SE4Oe58ymAifjAOfiGjGCQbIfhyCifRJTwL/jyRTnd41jzPVEZk5XjvYismfRdTrPliGvktkQbDAPwvl6jJRl5djZufgBqQBxjjR6rtD07Vqlac3nsf6050VSDslRAy1AQ58hDhsLsivzNeqzq3cugwrEGHaTe/UQexB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=H9RkSk52; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="H9RkSk52"
Received: by smtp.kernel.org (Postfix)
	id 8A53CC4CEFC; Wed, 10 Sep 2025 17:19:21 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DA1CC4CEF0;
	Wed, 10 Sep 2025 17:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DA1CC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C7720C000718;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C7720C000718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757524753;
	bh=rl0U26Y/Z4PNUS4Zgspmy5Z7/zfxkT1YPC9XXuffGM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H9RkSk52AdzdjBwQSbHQbD5zC8U/l/VNFnV5lqYJMVSbs5MT6tsjrOKmNI5CwFzrj
	 js5Wkd/km9Bzx+rL8Ce2QrAN6RG0gTeXflntbxqAyI4+yg80icNsREW1f8S8KCTbqD
	 7bvqMApgBc8jN5ENWiZwIOb5017tT/rYWcNWkfTA=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id A0BBB180004FC;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/4] Broadcom devicetree-arm64 changes for 6.18
Date: Wed, 10 Sep 2025 10:19:09 -0700
Message-ID: <20250910171910.666401-3-florian.fainelli@broadcom.com>
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-arm64

for you to fetch changes up to 70bab1937e39fd8f6efc80fd1a8b4da63622dd81:

  arm64: dts: broadcom: Enable USB devicetree entries for Rpi5 (2025-09-09 15:40:27 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree updates
for 6.18, please pull the following:

- Krzysztof fixes a DTC warning for the ARM GIC in bcm2712.dtsi

- Ivan adds the pin controller node(s), an additional GPIO controller,
  the second SDHCI controller node for SDIO Wi-Fi, and the UARTA for
  Bluetooth to the BCM2712 DTS (Raspberry Pi 5)

- Stanimir adds the Ethernet DT node and enables it for the RP1 sister
  chip

- Andrea deletes a number of redundant PCIe DT node enablement, updates
  a comment to describe the relationship between bcm2712 and RP1 and
  finally enables the USB controllers with RP1

----------------------------------------------------------------
Andrea della Porta (5):
      dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI controller
      arm64: dts: broadcom: delete redundant pcie enablement nodes
      arm64: dts: broadcom: amend the comment about the role of BCM2712 board DTS
      arm64: dts: broadcom: rp1: Add USB nodes
      arm64: dts: broadcom: Enable USB devicetree entries for Rpi5

Ivan T. Ivanov (4):
      arm64: dts: broadcom: bcm2712: Add pin controller nodes
      arm64: dts: broadcom: bcm2712: Add one more GPIO node
      arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
      arm64: dts: broadcom: bcm2712: Add UARTA controller node

Krzysztof Kozlowski (1):
      arm64: dts: broadcom: bcm2712: Add default GIC address cells

Stanimir Varbanov (2):
      arm64: dts: rp1: Add ethernet DT node
      arm64: dts: broadcom: Enable RP1 ethernet for Raspberry Pi 5

 .../bindings/mmc/brcm,sdhci-brcmstb.yaml           |   2 +-
 .../boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 133 +++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  41 ++++++-
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  56 +++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi       |  44 +++++++
 5 files changed, 271 insertions(+), 5 deletions(-)
