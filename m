Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C70638F94F
	for <soc@lists.linux.dev>; Fri,  9 Oct 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557329; cv=pass; b=mu4tnV8TU0Pcu7a0+R58He9Y54SlLpgWSv7epQxMhrEehY3q4crsYOOyr5zaPKCJsG03gQLAeuE5ljwAM7ckWI3ppIM+5zvvpYbxzvexZq7JbRgd0nhvd6kW7+U7YAB3SHlYWRu2e/pWwB2qAioMt/QNEIujcrZ5CHnvj/SEQAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557329; c=relaxed/simple;
	bh=8IwhtHMVe8AXvixgTlwj44UuZoHL8+7TmK+OHGE3GE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X66i16l8AzYqzg+Oaxc283drhjpK/Mg8zIGxwpL0VlVO7rdyjg43XXnueuRswf1UbFpnoTg6I7vlajAIjv0WETxgD5Q700A7e723f8SOgbljZ9Ny68Xj8BfwV3ebg8FC/y+bkBn1aDrGey+9h7rcsV6E2AJCFQo9s8ndZEIkydc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lXBeS3sB; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lXBeS3sB"
Received: by smtp.kernel.org (Postfix)
	id 198B21F000FF; Fri,  9 Oct 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791557327;
	b=n++JG1ij6xX/Hkhp5m1a9NEh+99BCDjMlyXeeHiufd0cQ7fOgn3eQ7WaVawsfAS2+eKg
	 lQxUdlG3jkJ/kK9IRrU2hC4Aw6hRd/qRSD/W+OYf6vGGM4KsOBG/UhsU8JbQz2ys5lqR4
	 Np+JyDFlPXTkguKuQaAA7DxG6abNb1uSUYChXm1T1pCGMB/Nle0bNzYePYDLUK8OHmk9U
	 yRYpO0XLd2HXzJke5hfg2WuExGFDafjZgVard6ETy8nUupxqoNLA6Lv7XZ/YEHAKO3HTN
	 OYr/zctiyWnPxOno6a8GuvW3RLE/J0kW4vO6u23KGQUYIrnMQvI/nWI6NO6Q5Ti1h+g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791557327;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=scmNF+46DLi47sIsqDRc0pGdZ0vlaMSMU1w1wYTd5PA=;
	b=BU/lihAO5mLlNXRexAb7E122wTNqv2/NpY30/6pVVUoyAPhdKNLviMVhggimWJypChgB
	 V1BXhl0I6GMhNiUct/VCrnu2rSMKSTsyv2XpIXSdQPYjoGOMeDRQtcMRzR11RaMC5Ynl2
	 elXIJKol5YPo+dsyikFrSGxTy13ll0wQ6oe90jr48OsfsZK3eAmqCFI+0nXxDIL8SmK84
	 y9PL5V1ZHXRG4uOEa8q79r034+K+QMF4qwyBqcUVZuUfIj/AQzuohpsXMxre3XQSmN1zW
	 oYsjChUHxX9pzIb0lm8YQxKt8UuqbJmr4vGRWyt8RxlIANy1SOyN5o7hEbJFsayzFKg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lXBeS3sB;
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45C061F00893
	for <soc@kernel.org>; Fri,  9 Oct 2026 14:48:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lXBeS3sB
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 45C061F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A1D564E410FE;
	Fri,  9 Oct 2026 14:48:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DE3960754;
	Fri,  9 Oct 2026 14:48:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59D6C11D708B4;
	Fri,  9 Oct 2026 16:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791557318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=scmNF+46DLi47sIsqDRc0pGdZ0vlaMSMU1w1wYTd5PA=;
	b=lXBeS3sBtikQ+kqLl5aIhWy5pok18OOS5k1HR6XGQ/E9lAzbB/HcljLlWg5FoHB6PhL4i1
	DvTldtMIKH5GPoMNk3RUh5pl1HnE25MChj3liDr0w/mvm9+O7GuoWEBMatVXcbJN0v19Fv
	8tK9v5eqX5hAadFQl0cJ4bm/E+e+MbIGObc3hAHiIOZUEdHXAjOMop8d7G3y9LwOUMSsmA
	MGejHU5unlM/RzT8w2D//+CGrmARdnWqZbos2tIdMi/Y3J2ibdqskAbMxv827R+yczlFdg
	EgPcmyG+y2fgFEjJS9HZI9zfgyCBADDGSMEjPP8xR86IsDAHlf24POSde9KY/Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v7.4 (#2)
Date: Fri, 09 Oct 2026 16:48:36 +0200
Message-ID: <87v77b53qz.fsf@BLaptop.bootlin.com>
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

Here is the second version of the first pull request for dt for mvebu
for v7.4.
Compared to the first version I have just removed the patch introducing
new warning because of a missing dt binding.

Gregory

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-7.4-2

for you to fetch changes up to a7b2dbf2a48d30e49f141883e605874595d5942e:

  ARM: dts: helios4: add #phy-cells to USB nop phys (2026-09-30 08:34:58 +0=
200)

----------------------------------------------------------------
mvebu dt for 7.4 (part 1 v2)

Various fixes for Armada 388 based boards (helios4, clearfog)
Clean up indentation in dove, kirkwood and orion5x dtsi files.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: marvell: Replace spaces indentation with tabs

Rosen Penev (9):
      ARM: dts: helios4: fix lm75 supply name
      ARM: dts: armada-385-clearfog-gtr: fix vmmc property name
      ARM: dts: marvell: add missing SDHCI clock-names
      ARM: dts: armada-395-gp: drop unsupported SDHCI clock-frequency
      ARM: dts: armada-388-helios4: fix vmmc property name
      ARM: dts: helios4: fix vbus-supply for USB2 PHY
      ARM: dts: helios4: fix spi1 location
      ARM: dts: helios4: use national,lm75 compatible
      ARM: dts: helios4: add #phy-cells to USB nop phys

 .../boot/dts/marvell/armada-385-clearfog-gtr.dtsi  |  2 +-
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 27 ++++++++++--------=
----
 arch/arm/boot/dts/marvell/armada-38x.dtsi          |  1 +
 arch/arm/boot/dts/marvell/armada-395-gp.dts        |  1 -
 arch/arm/boot/dts/marvell/armada-39x.dtsi          |  1 +
 arch/arm/boot/dts/marvell/dove.dtsi                | 22 +++++++++---------
 arch/arm/boot/dts/marvell/kirkwood-6282.dtsi       | 15 ++++++------
 .../dts/marvell/kirkwood-guruplug-server-plus.dts  |  4 ++--
 arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi       |  4 ++--
 arch/arm/boot/dts/marvell/kirkwood-synology.dtsi   | 12 +++++-----
 .../arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts |  2 +-
 11 files changed, 44 insertions(+), 47 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
