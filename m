Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF4B54788
	for <soc@lists.linux.dev>; Sat, 15 Aug 2026 08:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786782692; cv=pass; b=K9MEBStQIt2mHwcZeJdEz6X59uYCUoT+byhDfDV0VtF/fqGkWsUTHAgmeQ73BI2qXlEUXXxRcqd7UEtkAELV9ytEVH252V4fXLs1qYtoQR6DgXVINsLQ+24HiqQQVZIUzyvaRrqM9AnEGE9YFf4mDNO3h+zmnoB1Lthgch20VZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786782692; c=relaxed/simple;
	bh=Pl9WqLL31UwQEWN1bKL0ryOIeVQr0cKCZYc6vKqnAQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hl8x51T9JAHSAIpzKiqmwClAkYZNwiWD6ZPOb3PQW0YPMVj8rCrWeJSGXWPT2VUsHkYY1s2CMJ927/w5l9D9PdPj2mpDn3hJNqk/cERRUwqp3vUmRyWdE1simbLtRl/m2ngF4CxRdRwesoATS6t2h8jMWIaNDIvtV2pax6swnTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BtW1aBUi; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BtW1aBUi"
Received: by smtp.kernel.org (Postfix)
	id 5B1211F00A3A; Sat, 15 Aug 2026 08:31:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786782689;
	b=eMla+pWOHmj/RPliyzuGmU9klHTri48zTVPRlTYsCJ/W7fkTuHV3ZWy4q9enJ00AZuwX
	 Cd6eLg1jHwBsiiMOnAPUioSyWOov8SYoRKAUJKwdDlpxazWvx5tHn8ugWgPB7EE5JBnyB
	 b9bE4ZDt5sn6yJF7aECiQGYOs7LsDS2TNBMCbm2lhy7RRD20fp39w/MG+/kkqy5krwD5v
	 NvlftGYqOkFLDTqsOEL01Q7uwdcvTq4oRafhLvIa4ywX1+VM1iczZ4GLgmFgLZCLxFONd
	 qg2sgvxFA55dl5aP+n+MGT0T6C7MM7Hl9WDDAcUFwL7BSXsOqJ3hbc5gdnVI55ssgwg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786782689;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=TG4dt0eY+JRqs2ZUkBGkr0HGfFEd7ziAQfB8YGDuGjs=;
	b=VOkZSz9S67zxwrrePpWm9yB4KQHyF5ZqPlzXAP+7/nDND+BNDkKSQIlzSd0x4td7yPtt
	 JiWCWRSg4227jBKsbz0RllcbemBF1j9aJm9roKrrGrDQiLfKOjrq+dGm9So8CCdzj6A3U
	 G3VjXmKisUaZvkZaHMdAYj8+dWC3sG3P7HbgfiNWk86ds7b+mTdzroUBvCNTBDXPQ1+xP
	 FMF1PO9VpI3cZCEP6x0StMaJpT1lhV5DcrOPq0ku8epBHxBAPWKq8AOEG8AVrsSK2Xox2
	 NDe34Biu9JDm2ULjwbUORT5qkgUt1J5Sj7oCNLVNTNmf7EXYqTdA7gjO/hSrZGLS7Tg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BtW1aBUi;
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F8891F000E9
	for <soc@kernel.org>; Sat, 15 Aug 2026 08:31:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BtW1aBUi
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8F8891F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D7B831A151B;
	Sat, 15 Aug 2026 08:31:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94B3F604AA;
	Sat, 15 Aug 2026 08:31:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45EA011C4F436;
	Sat, 15 Aug 2026 10:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786782680; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=TG4dt0eY+JRqs2ZUkBGkr0HGfFEd7ziAQfB8YGDuGjs=;
	b=BtW1aBUi0LzZfrmMB6heB14cLJkmiGJZgwhFr5TgzEpaksKZVDHpntcNdjd9cDPxaqt8f+
	WIbjtWoBMZ53onqm0XO+g2jCHhE1/aACVr2FrvJLL6v3s78tpUs+0HRSd2PcvdTLLpI5XO
	Wmpazgwssc10R5p5oAHzuZRAxUjX6IgyuHu+O51p4Sm7dD3WrE2pGTuDU0jLNdEBAciX74
	9HrjsNohG5f1GMa0RzqdddqZMuYC75I69KWPQ4U1xqEliLgGHU2K2Ud//iI7AU6IRxe/rA
	SgMndDFtZ/3elPTuPTJNyr3OyLXQ0e+kQN5OicD/0VsCVJNKtEfmQBhgRA0hFA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v7.3 (#1)
Date: Sat, 15 Aug 2026 10:31:19 +0200
Message-ID: <87ik5bokdk.fsf@BLaptop.bootlin.com>
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

Here is the first pull request for dt for mvebu for v7.3.

Sorry for the delay. I only managed to push my branches for linux-next
last Sunday, so I waited a few days for them to be merged before
creating this PR.

Gregory

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-7.3-1

for you to fetch changes up to 7a90520e8c9a8f48fe6f3e741cf34d8c2b6dbc61:

  ARM: dts: helios4: add SATA regulator supplies (2026-08-09 12:47:04 +0200)

----------------------------------------------------------------
mvebu dt for 7.3 (part 1)

Add regulator supplies for helios4 (Armada 388 based)
Correct indentation on dts files

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: marvell: armada: Correct indentation
      ARM: dts: marvell: kirkwood: Correct indentation
      ARM: dts: marvell: orion5x: Correct indentation

Rosen Penev (3):
      ARM: dts: helios4: add vcc-supply to EEPROM
      ARM: dts: helios4: add vcc-supply to GPIO expander
      ARM: dts: helios4: add SATA regulator supplies

 arch/arm/boot/dts/marvell/armada-370.dtsi                  |  8 ++++----
 arch/arm/boot/dts/marvell/armada-388-helios4.dts           | 13 ++++++++++=
+++
 arch/arm/boot/dts/marvell/armada-xp-gp.dts                 | 14 +++++++---=
----
 arch/arm/boot/dts/marvell/kirkwood-b3.dts                  |  4 ++--
 .../boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi         |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts       |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts       |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi              |  2 +-
 arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts     |  2 +-
 .../boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts   |  2 +-
 11 files changed, 33 insertions(+), 20 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
