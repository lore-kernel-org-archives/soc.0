Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81663377000
	for <soc@lists.linux.dev>; Tue, 28 Jul 2026 15:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252130; cv=pass; b=mor7qWT5kiD1++0LuhlgjIf7ih/GOYpNu4l1L2r+4Z7yDcdfuBKAxKW3O4YCQvTwkfRFpz8+zBlm99najtSNc7o/+KY9EyaEzS+xUPp+x7zrb9oN3RrdH8ZHolrDTwIv6sMRJOnJBGRySWreES7j+zQhrE+p/HFzVZitOxF+FRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252130; c=relaxed/simple;
	bh=xv/lfj27D8nWH8/h1B+Y2FJ+da5WA/DsLr9PRBN/t6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PNAnwJYcED3ZHrQtK3g4x3HYNOpqFq9PX+9XB5KGhjMHdv01WCIitgSn658xWTbTuiXwS0bvXbKQ3fszHzsDgRdgCWRjqYjp2JeX5eWRz6QPV1+dbAxaD8UkQnKgBfOuEeImAxJQ0xP1btGj9ibXyaYtnDvvGZt3+N3Pjdg2jxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=AtlQ7Vj5; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="AtlQ7Vj5"
Received: by smtp.kernel.org (Postfix)
	id 6EA7B1F000E9; Tue, 28 Jul 2026 15:22:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785252127;
	b=CCl/bpPHzPZiWGaYcnQObxiNALT4kHBswTVNfIXV8vokHE0QmdRCHqPt08TEPM6WdlCg
	 BTMBQzo7zw6XZkyd1OIYDRQWm8hX5Vc89Af3FgqcYDhSO8n5SbbntsWsqlMS05lizzTIE
	 g5GRfjF5jpw46L8mibTRSz6P7Dy2YqdtFhAG2LN2wI91Lo7xR/fWVgkVBi8NuRIjVE/+4
	 QcbZ8SRuuKDIRKLVsC3CkUqBCFj6fHFnm/e8UY69tLhdhDhC2e+LhdfNTFkeLfg3IsmhA
	 rZF1NdLdUzJiEHz05oXntGmUK4ylYZwcDWOd747PuJ1HNRvJQhfMxmVZSIO+p+VGfiA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785252127;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=GYgWCp7NGaAFjYa0ok9PVd0tJSm0v/Qnvp18IDoxXVA=;
	b=KkKnpB4VwkWIvE9ifvnDylmbqPvSTFsRuFYaBIxwqET4rF79SOsFxD3NDEY0UUrwdiIZ
	 r9TWWNRR1XnQnImAFSS6/kHKUmB2aETWeSvV6/cMgI5tnfJw6nmXwp1EXHZLmrVlkTRF6
	 yNk/2TYLZVFqTIHwFw5iJJsYOmUti61QvxrWaVQt6MK6HTshzdIZVfGyp2Kjh7x6q4zbw
	 LovosqY+PBtaDSdhJAYRA3qCz+WeExbdC1oyk/FoEc217zmBUMXRox0406han6KMnlmZc
	 /jrAG6Kz1jtcC0p0r+uWmFXN+lgOXsP10q/qj/ABEbZyty7N6/rgjTpJFuAIp828qbA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=AtlQ7Vj5;
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3A5B1F00A3E;
	Tue, 28 Jul 2026 15:22:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=AtlQ7Vj5
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A3A5B1F00A3E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=GYgWCp7NGaAFjYa0ok9PVd0tJSm0v/Qnvp18IDoxXVA=; b=AtlQ7Vj5pbnebPXyB1yaKo2SxS
	+MeQSqwHHhvlqwnhRyIPPE07iGve4TzfOVFPBoU8JHOt63VZOhHUKUBFTADxbLQXtRr1XmPUhjmQ/
	YY0TGQw9IYItUJr0RrecBGWSgwI0mFacjGRT5n0BRLp97EhtM/XKaIg5RZb0jxxzhK2S/BVk9A12X
	sDnyrYp5RYa7JhzgUxknUD/+MTBw1vh/8RbFEpg+jOWYaRyDTqeGo9CgsRGnwDVY9Lvg3NtFkP+Pj
	WBP3/YUppfPQcSbeTDxl93WPd0/4JdCp5fTOa7mFCOi1xkgxL1WQFqHSFlXo7yYTXW/Dj0F9QQKdA
	oV0mTF6A==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 7.3 #1
Date: Tue, 28 Jul 2026 17:21:57 +0200
Message-ID: <2102545.PIDvDuAF1L@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below Rockchip ARM32 DT changes for the merge-window for 7.3 .


Please pull.
Thanks
Heiko


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.3-rockchip-dts32-1

for you to fetch changes up to 44045aa7a9a9e6484617f44f77a3efb2d8e78565:

  ARM: dts: rockchip: Add Alientek DLRV1126 (2026-07-12 22:03:41 +0200)

----------------------------------------------------------------
New board: Alientek DLRV1126
Eeprom for RK3288-Tinker-board

----------------------------------------------------------------
Marius Dinu (1):
      ARM: dts: rockchip: add eeprom node to rk3288-tinker

Yanan He (4):
      dt-bindings: vendor-prefixes: add alientek
      dt-bindings: arm: rockchip: Add Alientek DLRV1126
      ARM: dts: rockchip: Add RV1126 I2C5
      ARM: dts: rockchip: Add Alientek DLRV1126

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/rockchip/Makefile                |   1 +
 arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi      |   5 +
 .../dts/rockchip/rv1126-alientek-clrv1126f.dtsi    | 291 +++++++++++++++++++++
 .../boot/dts/rockchip/rv1126-alientek-dlrv1126.dts | 256 ++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi     |  10 +
 arch/arm/boot/dts/rockchip/rv1126.dtsi             |  15 ++
 8 files changed, 587 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1126-alientek-clrv1126f.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1126-alientek-dlrv1126.dts



