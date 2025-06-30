Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909E143151
	for <soc@lists.linux.dev>; Mon, 30 Jun 2025 19:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310149; cv=none; b=Oc/4GUfCKNt4gLP7EyCmumD49mgrqxmqlOv6FhXRDsa7dl9h2D21RTmYlFXITNw80gB0C0JuAR3icIEwREQgjgR+xRxtOJ+9WH8f6z4GhOXDf9RieTP1QBRvDwzz+0SbMl9eqtncYz4t1I7iTJjFt/WmFX9Gt56yIZHluZoAJF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310149; c=relaxed/simple;
	bh=DxngdZTCXB3RrhxRGvXeovYfJ2Dg0ax80WtH2OTFOpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mCCaDY+Fgi3uaX9fKRAo7THOTUiz5dlXPEv/jyv04boZhLRO/EuqrlOdGBdhk4MRwumrhqH8emcESwKWNhkgHKCzP6XZulNw9KaV9G3fAoaLbmGz2w8XOjMVFB+awlmPGPhpXSExIacpmackM6etFP7bGOnfdPEUYL2VV7tV9hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KQa8YH08; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KQa8YH08"
Received: by smtp.kernel.org (Postfix)
	id 5919FC4CEF1; Mon, 30 Jun 2025 19:02:29 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72424C4CEE3;
	Mon, 30 Jun 2025 19:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72424C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 20D30C0000E8;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 20D30C0000E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751310142;
	bh=DxngdZTCXB3RrhxRGvXeovYfJ2Dg0ax80WtH2OTFOpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KQa8YH087mqLSZpm0iYkcWRs+XKYrzLRkM+c7UdEP0/iNF6kNR+BhC52pBuafewZU
	 NB9PQkhwPN0h6ocyvlGw/PTHrdEmJYa1xaZoM1XayeM0u7bGVXBpdXRxl8exT0oY44
	 GJdE769Hjl5s//cftRVj/k1amlZxrtV4nvE2TwxU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id EFE1318000847;
	Mon, 30 Jun 2025 12:02:21 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	William Zhang <william.zhang@broadcom.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/5] Broadcom devicetree changes for 6.17
Date: Mon, 30 Jun 2025 12:02:13 -0700
Message-ID: <20250630190216.1518354-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/devicetree

for you to fetch changes up to 8df00d6bdb0ab976637ba15829be5771dad2073f:

  ARM: dts: bcm958625-meraki-mx6x: Use #pwm-cells = <3> (2025-06-09 10:10:41 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree updates
for 6.17, please pull the following:

- Linus makes a number of updates to the BCMBCA SoCs Device Tree files
  to correct UART interrupt numbers, add interrupts to the RNG block,
  and leverage the fact that all SoCs have the same peripherals at the
  same aperture

- Uwe corrects the Merakia MX6X DTS file to have #pwm-cells = 3 as per
  the binding

----------------------------------------------------------------
Linus Walleij (8):
      ARM: dts: bcm6878: Correct UART0 IRQ number
      dt-bindings: rng: r200: Add interrupt property
      ARM: dts: bcm6846: Add interrupt to RNG
      ARM: dts: bcm6855: Add BCMBCA peripherals
      ARM: dts: bcm6878: Add BCMBCA peripherals
      ARM: dts: bcm63138: Add BCMBCA peripherals
      ARM: dts: bcm63148: Add BCMBCA peripherals
      ARM: dts: bcm63178: Add BCMBCA peripherals

Uwe Kleine-König (1):
      ARM: dts: bcm958625-meraki-mx6x: Use #pwm-cells = <3>

 .../devicetree/bindings/rng/brcm,iproc-rng200.yaml |   6 +
 arch/arm/boot/dts/broadcom/bcm63138.dtsi           |  79 ++++++++++++-
 arch/arm/boot/dts/broadcom/bcm63148.dtsi           |  64 +++++++++++
 arch/arm/boot/dts/broadcom/bcm63178.dtsi           | 112 ++++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6846.dtsi            |   1 +
 arch/arm/boot/dts/broadcom/bcm6855.dtsi            | 127 +++++++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6878.dtsi            | 120 ++++++++++++++++++-
 .../dts/broadcom/bcm958625-meraki-mx6x-common.dtsi |   7 +-
 8 files changed, 510 insertions(+), 6 deletions(-)
