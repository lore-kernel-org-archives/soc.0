Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE26488234
	for <soc@lists.linux.dev>; Wed, 23 Sep 2026 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159559; cv=pass; b=u8fHZvt5fgWnS3r0dsC0OTs6NSw09+HKFLJSM2XgBkGalHc5AJPsgWQVYjGDKQTeJQ0C6k//YT/pwxMA5VF1M7NsqvHkABjv2NbLtBmUW99fuHt6ghztSdHQtgc3dpjjhDT9l0LnfiCN3X4a5nRb+CkvJ30LS9F5rS0mjwR3BUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159559; c=relaxed/simple;
	bh=kHhWudTgVsro0XbOJkN9vDbK3sEtyOdWWA0FcJwwoOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lpfi40C9DkjeZHCD7ACjdL+Z7zaSS5FCi0HATGk8y9xARMeOKGoJ7brGfRwdxcAuclm7fQI+Ni4WaqEUM4AWlP7c4IeFCYwsQDKDUWvfVL2knSC7prUPIIwdnhamfEPnD0u2VOXRptN2Jn2jqWBRqMSffjEctEUlGtpKY5LbClY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OEBcH7GG; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OEBcH7GG"
Received: by smtp.kernel.org (Postfix)
	id 62C851F0089A; Wed, 23 Sep 2026 10:32:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790159548;
	b=PC6Y3g/n/qDt6ld+vik/X6q3xsB1k+2MS+6s0grzNB1EfO3ljksrDlw4GbaRsVsFFAa0
	 Pa3LLZFwZXPvajTFJWbZ94wqIhT3RYU6FMiuBw8LQFZAgLA3nQ93Im7CkH6W9YmnE4pTx
	 yigWyKoZn5wfQ/jvFuZXYI8tePAAST2dJTY7ARLnX/uOMDDu3qyodxD+iBQHMNffPgDuG
	 CdoexOd79aOCuuUiTLnblDZQNxLDSsIyG6Hw+txWiyDkmdIniw/yYpMAKHKTwbvp1KwpL
	 Qmy4oJ90uaX8QzxG1juDS195cd04Z/eRJRXhf2E71nyi1wve0fAHH6qB7T9WnWMiqrg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790159548;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=H5S0ck3gdeA68aFJF+/2ViN8qQjJT7WhfD6QVIMv7Vk=;
	b=Cp1lWWetgU+bXigpQk1aKDNes2FdgN146VQdoSZ8Fcgt5vKl53g/Izmem1VMUBcW9ddT
	 OmhKZO62lADtvonRqX/ORIkXtwRCsMHICAeppd5QW4iuh73oZA/DrA3BDhZGvwVCTGihH
	 om/012N0PPOS/vMYGSV4Jd+RgYgmmWvLglJDsVOtD34RBsnpw2YdqYllRLYvEpegmu8My
	 NMR0mjXV22atyG5bq8vL8tLWqcEsxBEhr6OO2sqSVI8KSJw2fVn6N2KHdS/jDyWMwCod1
	 gr7MpdRPM8POXlxJcGVSviYmtPO8Z5hn7Om+O3eeebh7Ser5ViqwBBYPKmNseicwX9A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OEBcH7GG;
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DA911F000FF;
	Wed, 23 Sep 2026 10:32:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OEBcH7GG
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7DA911F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790159545;
	bh=kHhWudTgVsro0XbOJkN9vDbK3sEtyOdWWA0FcJwwoOw=;
	h=From:To:Cc:Subject:Date:From;
	b=OEBcH7GGSk65/WVw1yqb8yhjClfiiQd6etWpk+bVbcFuJu53V2F/ciAzfGo2WkhHx
	 cHmCpxGKYK5DlMem9Y/p3H2aj4+LZnITHtpr/WMZJJIHiZ2cT1qp0HsbgFSN4mPQ36
	 Ah1RQShb818V1ENAExkvbmltAtoS0yUvw6XincUDIUjtb0RXEgl5wJ+YkPDTKEI+M9
	 C7gWWS/SFgnfMn8cOOQLCOXh4xjKZJwM5DXHM0s03LaZOlwVqQMhjSYOuEbQMG8Mlx
	 7aAmsujck1Z/vRGsCN21daXkVHOBwkqa7kguncNU55BKuAbxS9+t2Exm9cwDzwFwMz
	 2qcg3Q3BJzI5A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 788DF17E0034;
	Wed, 23 Sep 2026 12:32:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.4
Date: Wed, 23 Sep 2026 12:32:05 +0200
Message-ID: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-for-v7.4

for you to fetch changes up to bf89276b2db391cbb25d1a0e898280fe85b16fb5:

  arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs (2026-09-21 12:22:18 +0200)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates

As the most exciting change, this finally adds support for the
PowerVR Rogue GX6250 GPU on the MediaTek MT8173 SoC which can
now enjoy graphics acceleration after years of SW rendering on
a SoC featuring rather slow CPU cores by today's standards.

This also adds an important fix for the frequency of the
architected timer on the MT7986A/MT7986B SoCs, resolving
issues with NTP correction limits.

Additional changes include:
 - Addition of labels to the GPIO hogs and the GPIO expander
   chip on the BananaPi R4 Pro;
 - Addition of ramoops memory region on BananaPi R3 and R4;
 - Addition of address/size cells in /firmware node for all
   of the supported Chromebooks;
 - Size increase for the SCP Core 0 memory region in MT8188 Geralt;
 - Indentation fixes in MT8173

----------------------------------------------------------------
Andrea Pesaresi (1):
      arm64: dts: mediatek: mt7986: correct timer frequency

Brian Norris (1):
      arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware

Chen-Yu Tsai (2):
      arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
      arm64: dts: mediatek: mt8173: Add GPU device nodes

Frank Wunderlich (2):
      arm64: dts: mediatek: mt7988a-bpi-r4pro: add names for i2c-to-gpio chip
      arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs

Igor Belwon (2):
      arm64: dts: mediatek: mt6878-pinfunc: Fix pinctrl header path
      arm64: dts: mediatek: mt6893-pinfunc: Fix pinctrl header path

Justin Yeh (1):
      arm64: dts: mediatek: mt8188-geralt: Enlarge SCP core0 memory region

Krzysztof Kozlowski (1):
      arm64: dts: mediatek: mt8173: Replace spaces indentation with tabs

Martino Dell'Ambrogio (2):
      arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
      arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region

 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h                      |  2 +-
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h                      |  2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts           | 13 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi                          |  1 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso |  1 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso |  1 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso |  1 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso |  1 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi      | 18 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi          | 13 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi                       |  5 +++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                           | 35 +++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                     |  5 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                   |  5 +++++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi                    |  7 ++++++-
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi                   |  5 +++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                    |  5 +++++
 17 files changed, 115 insertions(+), 5 deletions(-)

