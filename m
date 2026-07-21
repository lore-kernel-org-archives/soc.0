Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB35397E9A
	for <soc@lists.linux.dev>; Tue, 21 Jul 2026 17:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653743; cv=pass; b=n0l7rjzdTsFUKsgKakkMK0/HPbdYr1VlWkCHG408Faja/syjg0BBHIAKv8z6xpTa98GgyC4HlEUeJ69YtXOKBkBNBP7zxkiM5l3EUJ3OQbHA3krOeiOhdU9GEMNNZqjV+CSL9VZLhT23XF8Q47D/ThG1Njk55vl9v6LFIpAYIzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653743; c=relaxed/simple;
	bh=2GNkgOjfx7RIocLM0CmhReELD/lA/lYDcSHiga2Rdp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mtPZcMfLdt+VK33LFgz42z4dQLHgY7OC4j2mGSWgUe1oblVyeiWUw5ghI3p5VjmvcPNnqPjsnFHH1jev4wJY8kDdiJe+o5UpoxDYr2Js6rK+d2Ku1vCHWh0o/V0PlYkBvADl8yTywMF21plc/xuwdRT9C0+yBoM0ZoJpGX2iqhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=po02jqgc; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="po02jqgc"
Received: by smtp.kernel.org (Postfix)
	id CC1981F00AC4; Tue, 21 Jul 2026 17:09:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=192.19.166.228
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784653741;
	b=d2fx/ShRWIb6On07DTiMldeBRXZlR5msy3epl+PLeSoeOnlVjiURQluHLIUAKyRcThZb
	 PyBnfUUOI2gRYctRy0oM8j++77ftpivygqn/wnlFp7s7h7ygqASCmXjLaP1c1VL39Jn1E
	 7qMbERYIexcM1Qn5rkrTsUeRFulhP5utQqv245BHUbp1qG1NP8+ypBxpQbKG+U9QRQIZs
	 hp/IDpn7L9UJ3BbZqBeJpWx8+7I6uH/Xa0cOWgUc6PtmsqhLHrZNcghaE+Tml0vIiclwZ
	 XBN7k2LBj8Grd8POkKiRANeVDsGFae4RNaOlJK7rI5B3GDopxC6fCAAvS/JxuAYtJqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784653741;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dXrNvzFEwTnXTRDjKuPyJdSsIoFSJx6o/cMMTvBChdE=;
	b=XLZLVxMqcJN+PQtytzV1Ic2DfnmudUuGNudlFPDy1ofhtZrFerms5DFtfE432RFQZCjZ
	 efJSmGVtgrRQLIh9AZlAcqwRcTktyb+WaH3w9RZpzYiboAfKkH4VlKdSMLo9I3YSiFRWW
	 nqGN7o0OXoeN9YrO6fHbaeBkP0owT8GTx8ay36ouZBe+7S0XNN9xBGy2kol5jcmts8FWH
	 qsTgHrvmRBKGTVciylbuv2kbNdsHXF42gw9wSTPq6K/DRfvev6EFJXblpuPVDMvj1UZ27
	 ZUouwkbHE/+olwU8K/DT+bB11V0U8+l5WRW0SHue5pftllCL3tenUZPR4xsGFLoq7vA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=po02jqgc;
	dmarc=fail header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	arc=none smtp.remote-ip=192.19.166.228
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4A551F00A3E;
	Tue, 21 Jul 2026 17:09:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=po02jqgc
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A4A551F00A3E
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 08BC8C0000E0;
	Tue, 21 Jul 2026 10:08:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 08BC8C0000E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1784653734;
	bh=2GNkgOjfx7RIocLM0CmhReELD/lA/lYDcSHiga2Rdp8=;
	h=From:To:Cc:Subject:Date:From;
	b=po02jqgcIfrK+K48mLSGiPKp2iYCKXyiED35eKji+hMQrfafE+O8i3hs0bRThpYJ1
	 AUo8IBBuUg3/Z50iIpVDGAIb4pZSljINfW9QCuU919Y0vOjZWCexxuHBOZXdBh1WAY
	 0rDtWfchYhsGA/pw2tkmdmrdaeurKcXHYQtRChjc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E04BFACC;
	Tue, 21 Jul 2026 10:08:53 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Daniel Drake <dan@reactivated.net>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 7.2
Date: Tue, 21 Jul 2026 10:08:51 -0700
Message-ID: <20260721170851.3581392-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1590cf0329716306e948a8fc29f1d3ee87d3989f:

  Linux 7.2-rc4 (2026-07-19 13:54:41 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree-arm64-fixes

for you to fetch changes up to 75952cfc7752c52a2b692b59d34ce160d3edabb2:

  arm64: dts: broadcom: bcm2712: Remove non-functional EL2 virtual timer (2026-07-21 10:04:56 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree fixes
for 7.2, please pull the following:

- Daniel removes the non-functional EL2 timer interrupt which is not
  connected on 2712

----------------------------------------------------------------
Daniel Drake (1):
      arm64: dts: broadcom: bcm2712: Remove non-functional EL2 virtual timer

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 --
 1 file changed, 2 deletions(-)
