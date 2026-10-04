Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2164148125C
	for <soc@lists.linux.dev>; Sun,  4 Oct 2026 20:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791146097; cv=pass; b=N8S55DBcTyOLi+VLz36e0d3/sco89GkHOoKgdSh3dV6Dmv+v3g8x3TJpAXnDQqRLKiwV08u48+yseyqSB1LbYYXJroyqmw5kMH5QxWGCKNOacIQE+yfjfOBo6je76jsW5U8LugCMg0FNHrCADRWHhsvEoMBmE4AxhgMwq7yBmks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791146097; c=relaxed/simple;
	bh=w2iyjsmV3HTuvh7sdxWY2eu7/nEvxkswHObKZ4bTebU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fokY40WDs06aiAQ346zDuX88y9qGvImb+tq/DHJTu7R10tTlh5D176Aa2rKDKMwM9M+5HU+CQDR4MtdsL36XRU1lQZgHuFE1naaRkiTqTZF5jBLdcIhdNpox6RIE2bffrL+ILyC7ZEcV29NEgUdcX2HuwGq0u4UlKdPU25OHSpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0yzQYGwm; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0yzQYGwm"
Received: by smtp.kernel.org (Postfix)
	id C6B461F00893; Sun,  4 Oct 2026 20:34:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791146094;
	b=I12hG/6XGB+04nbttRiA+P9KtSM+WchnCc9Jbxr0s21jOJwW05ybE+7qBWcggNv674gH
	 118EXkBE5oRimcVLkhijnutF/oKAR2Td6h76HIZdbLcGjeX3cxkyBvZ7wLLOZJKNw7UY1
	 htdOtQV+smbwo9Wfq7SB5Uj53ZKxWKjxtswlFX8z1LcVRYIsLeIUTyVx10gOq+UfZRsoD
	 gobSQyQlSggifbPB1J7TQGz5rybG6bQQchuftoWI75or6czyJlQSMR/8Eq3Rk03Sji8vs
	 ZHp9tsnu9GbTt6kcKX+slXAeMOaWh328ZAfB0leRyHrq5xz7JLbXK6Ta6YumjiXEHjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791146094;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=1pLbVNzpT4k4uzm/tuI3sNHGXY3AO/i5v4vy/cMAy5M=;
	b=cTKfLiYKjfnLJ02DsbHLDbD7lQkC94dd1YPJqvLa5dP+MRgD4Xc7dl/BcJpvZAQglP9t
	 2i1KLbNdBX+8io3Rl4dc+bHScU2nK7T6TgmpM3V48PvS954GMokHBgnz6P5IIDgtRjj6p
	 WIiY+3uE4/uRMfhYJxxEcLDOgnUvSlYrCCCi7ryZ0eW4Jg1Y9C+IOk6Kk2Pd2W8TQl1r5
	 ugXfKMb60iXmpJ+dnO2LGJY2ewmYFiTBkbdHhaiUjEr8cPfY4RXTNZJS/R2qYaiwDf5gR
	 ptsijl6qjmS6B1qvRITFrIumcdcdyU2fcSPVkVjfWiDtfIuNtW9viB8jZgMSXFPu7UQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0yzQYGwm;
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EECF91F000FF
	for <soc@kernel.org>; Sun,  4 Oct 2026 20:34:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0yzQYGwm
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EECF91F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E18DC1A1138;
	Sun,  4 Oct 2026 20:34:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7204604FE;
	Sun,  4 Oct 2026 20:34:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7E501032820F;
	Sun,  4 Oct 2026 22:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791146084; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=1pLbVNzpT4k4uzm/tuI3sNHGXY3AO/i5v4vy/cMAy5M=;
	b=0yzQYGwmusJsIxmTjYFWxhjC4uF+JeaScpF48UTpoFVYGGeeAt5IJB+d1AaCPDiTA2zCfR
	JTUMHAS1qxn2OJ21xouHV9Yukj+IYkFA+9hZ8Q31XOYhziH++1ER/TIO2NiMGSwdITNBcg
	F8+ct5i/cnb4pbOFo5Gwqy5CAHOUo8+KS7zwSCOz6fe8xdGA+jjGBZl6zbnrKEoW79RAmS
	dMpUdtaWeTZ0YiU7ktsMvlVgeHf+sxaIMOu6jtSijGPaFJ04KjpYhc1hUSILTl5szGJyZN
	2EB3QOYgl3uuJlhU9PDIPfLRfHSHamXZtPb9EflPfDIeKPdk+nsHL82RzCsGaw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v7.4 (#1)
Date: Sun, 04 Oct 2026 22:34:43 +0200
Message-ID: <87o6d96w7w.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Here is the first pull request for dt for mvebu for v7.4.

Gregory

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-7.4-1

for you to fetch changes up to 6dfda79476538a9aad1d2dac45453e62c6939522:

  ARM: dts: marvell: armada-388: use onnn,pca9655 compatible (2026-09-30 08=
:48:51 +0200)

----------------------------------------------------------------
mvebu dt for 7.4 (part 1)

Various fixes for Armada 388 based boards (helios4, clearfog)
Clean up indentation in dove, kirkwood and orion5x dtsi files.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: marvell: Replace spaces indentation with tabs

Rosen Penev (10):
      ARM: dts: helios4: fix lm75 supply name
      ARM: dts: armada-385-clearfog-gtr: fix vmmc property name
      ARM: dts: marvell: add missing SDHCI clock-names
      ARM: dts: armada-395-gp: drop unsupported SDHCI clock-frequency
      ARM: dts: armada-388-helios4: fix vmmc property name
      ARM: dts: helios4: fix vbus-supply for USB2 PHY
      ARM: dts: helios4: fix spi1 location
      ARM: dts: helios4: use national,lm75 compatible
      ARM: dts: helios4: add #phy-cells to USB nop phys
      ARM: dts: marvell: armada-388: use onnn,pca9655 compatible

 .../boot/dts/marvell/armada-385-clearfog-gtr.dtsi  |  2 +-
 arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi |  7 +----
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 36 ++++++++----------=
----
 arch/arm/boot/dts/marvell/armada-38x.dtsi          |  1 +
 arch/arm/boot/dts/marvell/armada-395-gp.dts        |  1 -
 arch/arm/boot/dts/marvell/armada-39x.dtsi          |  1 +
 arch/arm/boot/dts/marvell/dove.dtsi                | 22 ++++++-------
 arch/arm/boot/dts/marvell/kirkwood-6282.dtsi       | 15 +++++----
 .../dts/marvell/kirkwood-guruplug-server-plus.dts  |  4 +--
 arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi       |  4 +--
 arch/arm/boot/dts/marvell/kirkwood-synology.dtsi   | 12 ++++----
 .../arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts |  2 +-
 12 files changed, 46 insertions(+), 61 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
