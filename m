Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9163FADF7
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346190; cv=pass; b=js9MFQGajoAMx8sjUNA8cA7kYg4fItfq97caZTIAT+8/0ePI1N4ADFX//teicTK6kKtzjvf1klux2To3LYXwTJdEK0JwyfLN0WflANGdXNzRV4aGHL+77VBhGG0PJIABe5z63WysQhN7eEybtk7ERiUVowOkuG31oxTSWg1L+0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346190; c=relaxed/simple;
	bh=G4oU62CUQadvll5EAWMjruuePvHqhrGR1ahicdrQqRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kKy3T/gi7NXFuA+9t5W9eV8EQY+df6uV3e74kBUTZDrobr4nwq46hFmZj83YxOyKI0C6YCh2nFoF6kbxsDGWlgYtSjXSul1SA3Efc3RrYLozSGmDztpX6Q7X4KBJHVQxXgTaoVMgfYuwEPVEpMx2lGPIUSSx+t19nPL/xLDl9a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=n6llIeD1; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="n6llIeD1"
Received: by smtp.kernel.org (Postfix)
	id AC1D81F00898; Mon,  1 Jun 2026 20:36:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=192.19.166.231
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780346189;
	b=gRC0NjlRVZCm+4A8M3ObeJRLjiyxBTbQE0ENMDkzYr+02AXXBY3TvBIR5Bb5ZQ8Udtjt
	 K5h0LiInSnSII8kMnYPQ00qj/pZ0G4vqA6oq/GEGniW/gaeQxsgweJfU7UrmJ7vSpT1sf
	 hA4nZhUv56VN9DpYPGZOjlSG+Icez/NZBcHo1+IQQkdUU+L2kmyYuPJ+QLS+SUldM5rjr
	 j7gUDx69jyvbj3elFiUZsx2hcrct7fe2NnTs2temUBw2M9w1RWgFFIvMSA31quK1kxJ7B
	 zeCEcq7YPVvn4Z3iviXdAyDswD4rxk8B9YVzRUtwEZRGeYbKkeTMWholgEvUJRup3Gg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780346189;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D4H+JnTZW6KO04WWEAQxwl+7TOTxRSkwLBTB8ksO/ts=;
	b=hH5cQZ+av5DGZ3Naz7qmibcLVoT3Grv9bneOIYAysvuqIMmClOP+2NQfAZ92CZNNPrzx
	 xJ8KkarVAqLwqwM/Ham50+V5ZFOGmZkfmfyz+bXi1HiHfHQZ+DW7Y/j8djkr2lL96xuZ2
	 HYofEVn3OYWe1+pjlNt24tXTkZcKpkmtBNXdlsRAS3VwGjl7t535wyrDPYNf0k1IfFnDl
	 LI9sIJogXhY0FrokyPT/sA9W+wo6e8wXoG3JvNl1eRjsmOoeUnHiJneUX28MXAvTfEIM5
	 Z/zPRDCKcOUH2KjIs+U9sDuwRBsJyztNq1OZdraedwhH4Zh9kA57ZwFt8YFAxeN836w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=n6llIeD1;
	dmarc=fail header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	arc=none smtp.remote-ip=192.19.166.231
Received: from relay.smtp-ext.broadcom.com (lpdvsmtp11.broadcom.com [192.19.166.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B6921F00893;
	Mon,  1 Jun 2026 20:36:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=n6llIeD1
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0B6921F00893
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3982BC0000E3;
	Mon,  1 Jun 2026 13:29:51 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3982BC0000E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1780345791;
	bh=G4oU62CUQadvll5EAWMjruuePvHqhrGR1ahicdrQqRY=;
	h=From:To:Cc:Subject:Date:From;
	b=n6llIeD1cKjfF70q91nbAZYrPBtGiVYT3KNpDGE/h5YXoafjNNfXQxG7N5Jte4u4N
	 a4UkGCByYrXtv0bsECZKdiUAK7khA+g7ogoY0jcwDjelLv3y3gU3ypMM4bqthAD/so
	 tZBHOpHBBpaGzlg6hZHj1PWD9NIsGIVUqD6oQ/Go=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 1EDD3AAB;
	Mon,  1 Jun 2026 13:29:51 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Jinseok Kim <always.starving0@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree changes for 7.2
Date: Mon,  1 Jun 2026 13:29:44 -0700
Message-ID: <20260601202945.1195228-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree

for you to fetch changes up to 245552af869d35ae27cac2121696dd630f15b3bf:

  arm: dts: bcm2711: Fix typo in gpio-line-names (2026-05-29 11:13:56 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 7.2, please pull the following:

- Rosen moves the Meraki MX6X pinctrl configuration to the PWM node
  where it belongs, also fixes the USB3 GPIO for the R6300v2 and
  EA6500v2 routers

- Jinseok fixes a gpio label for the bcm2711 systems (Raspberry Pi 4)

----------------------------------------------------------------
Jinseok Kim (1):
      arm: dts: bcm2711: Fix typo in gpio-line-names

Rosen Penev (3):
      ARM: dts: NSP: Move MX6X pinctrl config to PWM node
      ARM: dts: BCM5301X: R6300v2: fix USB3
      ARM: dts: BCM5301X: EA6500v2: fix USB3

 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts               | 2 +-
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts            | 2 +-
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts     | 4 ++++
 arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts      | 4 ++++
 arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi | 6 +++---
 5 files changed, 13 insertions(+), 5 deletions(-)
