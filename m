Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A863090CE
	for <soc@lists.linux.dev>; Mon, 13 Oct 2025 17:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760376985; cv=none; b=Q95AN/YGriXfvdsKmBifiqKJZcURs+Xo28h7ji4fAAShVFk0Z/0+0dTJQTSQViq3cLL9Mq7puFpswgVHK1IJDqR9rhPdH3epBDJcodVmI1NozwTEgYjdAbiujq5zP3e9fM7yfPh8mnTVYlINAjdUAd1Ds70pp2v6IeUYdWSm/RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760376985; c=relaxed/simple;
	bh=M+0WBcWrM1Se9SPdQIxdBmXVcrgxDafQGrr/jA0njjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bY5koctRfxtjKZJzLl82GgnMzTfvI5n0s4DhTmByGb9+HPK0bU0RSjFl1E5RaoILvoU1JP9qrgknKqlYRYmBgVEksWdxW1dZTESCMTOJtSHk1tLN7e3HW9GdHNt8LCHc4jpIHDg23swSkkfFttu59s1mwuuOWE/YbJbvj3ICqLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MRYOw7AK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MRYOw7AK"
Received: by smtp.kernel.org (Postfix)
	id 82E59C116B1; Mon, 13 Oct 2025 17:36:24 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A959CC4CEFE;
	Mon, 13 Oct 2025 17:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A959CC4CEFE
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 61E65C0000F8;
	Mon, 13 Oct 2025 10:36:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 61E65C0000F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1760376976;
	bh=M+0WBcWrM1Se9SPdQIxdBmXVcrgxDafQGrr/jA0njjo=;
	h=From:To:Cc:Subject:Date:From;
	b=MRYOw7AKsYSkW2ibWRnp74KN2xiP29bNZPLEMUUtf1ncxGwybpQ/pYHJ4sGUI00of
	 ox5SQohdBLCVSk833brhEuG2x914VmHX6EQ/h9FEisfOhWdhwMTV6HyDaYFXqk/VBc
	 z6rpruwcrtw+i5raHU63sxKUY/sSbGBFvcUM13aQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 07BD318000847;
	Mon, 13 Oct 2025 10:35:46 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Melissa Wen <mwen@igalia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree fixes for 6.18
Date: Mon, 13 Oct 2025 10:35:42 -0700
Message-ID: <20251013173543.2489346-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-fixes

for you to fetch changes up to 4adc20ba95d472a919f54d441663924e33c92279:

  ARM: dts: broadcom: rpi: Switch to V3D firmware clock (2025-10-13 10:31:25 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
6.18, please pull the following:

- Stefan switches the V3D block to use the firmware clock, rather than
  the bare metal clock. This fixes hangs on boot after recent changes to
  the V3D driver clocking went in.

----------------------------------------------------------------
Stefan Wahren (1):
      ARM: dts: broadcom: rpi: Switch to V3D firmware clock

 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        | 8 ++++++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi | 9 +++++++++
 2 files changed, 17 insertions(+)
