Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB6B7262E
	for <soc@lists.linux.dev>; Sun,  4 Oct 2026 21:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791150422; cv=pass; b=YMAIJNFToM+XQUrkLEQWDZ17no7vMTWr3UcsIS6zDgIumjK8sAz8hK3uDl1fP0LMXnV1NzKVKU3FvKhtVbSviwK6FiDusDgj2ozKSuma5bqBHvyXlEZhDgW1Z+dpXvomf7F/N7vHmTHn0NdhkFNjMl2VhVE9LGnqX9Xu9pjeXkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791150422; c=relaxed/simple;
	bh=bRUWrJ2CS8ivwjKOAa6Si6cD3U2mZn7J+1XW+RnbU7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MQ6xAcKU5Z1jZVQKZG5PHMWDLxp5jp7/Hu5wbgkyzncYlOztqWmQEP6zp3oOgJ5ePD/w0CJX3dqGULHWB1L07pT/rKyz+F69lLHvzmmlrYmfIUAB5iNaIgnnSPLwa9IeFc7ZozrAwzmWrPQETKFE4N4pZYtR/o7v2pVCf7W7dYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JgyFuJIh; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JgyFuJIh"
Received: by smtp.kernel.org (Postfix)
	id 44E1E1F00893; Sun,  4 Oct 2026 21:46:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791150419;
	b=H8qOVVSnlhntR4qaLQEMNBVvsRU+4f+XfI5fCHQL6+xiB1egmNT9vRHX8mR6Ofu5jjTN
	 GnvVUg6O0dEf04EZnXInJJC0hBWVyWJyOxJHpRGgdC+RUJsXp0Whpn1nudXTlTJu66k0M
	 dpMaAlzabQ8DlSr5TPvbD9DSbfxwFs6aMWSZ4MX762eVEOqcRs3BDcdfUqflgIN3KjTBF
	 g2RNty7BmAWbUdJFPbvmxwC9tA1fGy8BIeZwpOKQGjRZq1O2XCmxqKPqYcLG6XFRtWPpj
	 qltLS7fnernz4yvd9JjBMHyMbUemCIx+Td8eiajPa7g6lJxGWsHiJeLMX8SphfE0lFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791150419;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=JD6bVYc2N3S5atXb5HxS0QL0k9uB54dvuwIHqeroLl8=;
	b=s+c5W043pt3XzUio27V8+zpCa/uhGWWNj1Az0cUxAh5sdeElvCDjl6WVaxVtH3vomYYd
	 PiXp80XCJklOU6psNzFLhk3nu3EgH3C/zA5YZjuuwJGerdLC+3TESrGuaoRIwBJjjyE/V
	 Yhg+ZqjVArkgah8nCYzdNzD8H44v1CYN9j3GrejroeSqP/u1gtNk/C5tzcEuYVYaiQza3
	 8mVquSK1+CHMPvMAYI4r9pM/TXX4CLG2zVmQLrP8xXsAyyriI4xq1ic1TRjuLHQ+qQryM
	 VMz3VvskjAlhwn4VP7m4NFTQXLFkmBzBxT4awrM0ZXhITg1R9AM92ETYpfNugk0gw6w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=JgyFuJIh;
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8152A1F000FF;
	Sun,  4 Oct 2026 21:46:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=JgyFuJIh
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8152A1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=JD6bVYc2N3S5atXb5HxS0QL0k9uB54dvuwIHqeroLl8=; b=JgyFuJIhfBAhQLnYhFUhSEka5K
	mUKo6xaF08QV+3FZvoFrfv8HpqASAHcRR+EFh4dyMIcoy8k/mDbB5bkBVLnFg8QYt95IF4tWAFi2F
	EOlKgdp1KcFxfPriShpFJgQ94SeK05wBxgnkdDaQCi0I4uRY8TpD2OyPcBYfuS424W7oeKiFEG3p6
	WqKzUIf1squCnkgr8pJf/yOk9Wh9UUqvxmZ4mUh5Qzb0fq2LOOSCECniM/wESptGwF2pr26AwukJU
	4ENpQy6AgACmQPSmshDCN87zRJvJ3oalRSKXLspQkX1ZegDd9P3R64STb101lncpzarIdZLQZebaX
	WYcCzmCw==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.4 #2
Date: Sun, 04 Oct 2026 23:46:55 +0200
Message-ID: <2088481.8hb0ThOEGa@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below some more Rockchip dt changes for arm64
for the next merge window.

Please pull

Thanks
Heiko


The following changes since commit 7aa165b62ccaf340da22c517074e7c6853db55cd:

  arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 Jaguar (=
2026-09-02 13:07:56 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v7.4-rockchip-dts64-2

for you to fetch changes up to fa932a9b632ff0d80390b940e6aabe38ac305fe1:

  arm64: dts: rockchip: Add MangoPi M28K (2026-10-01 00:22:48 +0200)

=2D---------------------------------------------------------------
New boards: MangoPi M28K, NanoPi R28S, DFRobot UNIHIKER M10 V1.2
The gpio controllers on the RK3576 are always on, so they can get aliases
in the main soc dtsi.

Apart from that some cleanup of MMC properties and some board changes.

=2D---------------------------------------------------------------
Adam Wermuth (1):
      arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B

Alexey Charkov (1):
      arm64: dts: rockchip: Set gpioN aliases on RK3576

Chukun Pan (2):
      dt-bindings: arm: rockchip: Add MangoPi M28K
      arm64: dts: rockchip: Add MangoPi M28K

Diederik de Haas (1):
      arm64: dts: rockchip: Add supplies for es8316 on RockPro64

Mizuno Miotsuki (2):
      dt-bindings: arm: rockchip: Add DFRobot UNIHIKER M10 V1.2
      arm64: dts: rockchip: Add DFRobot UNIHIKER M10 V1.2

Peter Robinson (1):
      arm64: dts: rockchip: Add missing audio codec supplies to Pinebook Pro

Shawn Lin (2):
      arm64: dts: rockchip: Remove broken-cd on Rock 5 ITX SDIO
      arm64: dts: rockchip: Remove cap-mmc-highspeed from SD-only slots

=E5=AE=89=E5=AE=B9 (3):
      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
      arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
      arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S

 .../devicetree/bindings/arm/rockchip.yaml          |  22 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   3 +
 .../boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 248 +++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts    |   1 -
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |   4 +
 .../boot/dts/rockchip/rk3399-rockpro64-v2.dts      |   4 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts  |   4 +
 .../boot/dts/rockchip/rk3528-mangopi-m28k.dts      | 412 +++++++++++++++++=
++++
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 160 ++++++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 290 +--------------
 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 291 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts   |   1 -
 arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts |   1 -
 .../boot/dts/rockchip/rk3568-fastrhino-r66s.dts    |   1 -
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts |   1 -
 .../arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi |   1 -
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts    |  51 +++
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   |   2 -
 .../boot/dts/rockchip/rk3576-armsom-cm5-io.dts     |   1 -
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |   1 -
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |   1 -
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  |   1 -
 .../arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts |   1 -
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts     |   1 -
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |   1 -
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   5 +
 .../boot/dts/rockchip/rk3588-armsom-sige7.dts      |   1 -
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts  |   1 -
 .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |   1 -
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi |   1 -
 .../boot/dts/rockchip/rk3588-lubancat-5io.dts      |   1 -
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |   1 -
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts   |   1 -
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |   2 -
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |   1 -
 .../boot/dts/rockchip/rk3588-vicharak-axon.dts     |   1 -
 .../boot/dts/rockchip/rk3588-vicharak-vaaman2.dts  |   1 -
 .../boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts  |   1 -
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |   1 -
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |   1 -
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |   1 -
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |   1 -
 .../arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts |   1 -
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |   1 -
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   |   1 -
 45 files changed, 1204 insertions(+), 325 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.d=
ts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-mangopi-m28k.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi



