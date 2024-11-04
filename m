Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994B1C729B
	for <soc@lists.linux.dev>; Mon,  4 Nov 2024 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730747423; cv=none; b=lMrn2UYpPHCMr6nHilxpJfT22AKTfouTVFEjQAcLdx3nGzyork0sxKP3iI3/fl3ewuCH1rc9UNiu21MvpUGs4EvU99h/kN3YnGynP8fuAaZJ6gE/HjVT3fEmzJWHUC2FgFgALfpkuTo9I+qztPAJ1VEBpYiHNe9sZWJbco3BPU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730747423; c=relaxed/simple;
	bh=aaYgFrJhT9A6u8DPjoUnnutIAW+Io5answdj9XabaDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gsVSQx7VxMmWKvq7pjmIs0NnqvViMJg2tpgJXEmvG8k7h05n+e0fXx5hhpAn90CwnbXxVqVdtKiwIJ+W3a3reV12ghC9Iu8/XVbBR5hZH3AhVao01HJnHOZoiTDyROjOmkGbgAfARzbL42KAIIp2n3ecI91q9/EliUI2D9m0Td8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UtO0cc0Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UtO0cc0Y"
Received: by smtp.kernel.org (Postfix)
	id 54C86C4CED1; Mon,  4 Nov 2024 19:10:23 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72104C4CED0
	for <soc@kernel.org>; Mon,  4 Nov 2024 19:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72104C4CED0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-720e94d36c8so1533212b3a.1
        for <soc@kernel.org>; Mon, 04 Nov 2024 11:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730747420; x=1731352220; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2y3LHlBNTbsSu0Hs3sn5efdwnygjby0IGD43ArzpIfo=;
        b=UtO0cc0Ye3tAFgiDLVwLd/9Ryjlcie3XOYxZJ+HNF42SKErqh5Hyvu7iLWj8as7VEB
         g1cOOo+mcwiEk0d5jB/gM/1mAC8PeYXnaRVdDeI7ZObzt6EC41lUaDgJct0kRoEHyFZS
         8yFdPRUvJ8qIGnlSnXT7Ahz4iQcVTxgJILYs4kwvOipaNXv3qn1mcUtP/gkZZ05kn3eo
         rlc1DauCi5WC/lLRiexoUwZiFSddeYHrrJMQ5Z8trCdr07GcBAki6ZGoS9ZFmqz0FEmZ
         hlHEY3K2fq2taq2FC90qKw2Gq+A+s962khMQS//ePbynwjRhT8fEswE8QmxURIFL2mGM
         9Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730747420; x=1731352220;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2y3LHlBNTbsSu0Hs3sn5efdwnygjby0IGD43ArzpIfo=;
        b=T9u/x1Br5D2b4NGGoTWM1nmZxG/ZQE2jNa0xw+Q7ls0XdIps15Y52cBpfQMQzt4c5S
         byRbFKOWZjcjssaXKtOuup7UPzCB7ciy+Py03Ss7V1+1uelvDHJQoAgv4FxslXK2RaiT
         sOH1hy+4QbDBDkvxjRtAh5gtBwjgUzr6GQl0Hq8Hob/6WQYMeyNYKpRETMzYttuNU49S
         iqZ9J0Q2J68d7+7ymuMgbG9QFgq2omLP5ngSaEGV0iV5kprIQ8pUwLXPwjo1fhrlBYoB
         OV8jU9yNt5w40fCYkKgWntooDTlBxF7YBDFptPogM17lOnVZRATF+X5/eGIGrk1k5i9o
         fmRA==
X-Gm-Message-State: AOJu0YyZXYu1lcysZ1eHFnd8aRp7nhIyl5NbgymoyPnznL+x3ZOQJ0pp
	u/nRACgyjUhkPDepuymAvK9AJe+xrm2rsCS0sDEQ2lX2vyZItX1cwsmm3j2mlcILFmbSCucp8kr
	lHyk=
X-Google-Smtp-Source: AGHT+IEjWO1rixoyJxbVGtJmuxL0xP1l7hFGkamZjG4E+eqTDpqyz2JlInUTxjamsjs8DazSCd4u+A==
X-Received: by 2002:a05:6a20:7288:b0:1d8:a67e:d323 with SMTP id adf61e73a8af0-1dba423639cmr20344552637.22.1730747420431;
        Mon, 04 Nov 2024 11:10:20 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459f8fb9sm7442891a12.61.2024.11.04.11.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 11:10:20 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] ARM: dts: OMAP updates for v6.13
Date: Mon, 04 Nov 2024 11:10:19 -0800
Message-ID: <7h8qtyolwk.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.13/dt-signed-1

for you to fetch changes up to 13746595a1581e09289adf9b5202e237c5e0814b:

  ARM: dts: omap4-kc1: fix twl6030 power node (2024-11-04 10:42:22 -0800)

----------------------------------------------------------------
ARM: dts: OMAP updates for v6.13

Misc. minor updates for OMAP3, OMAP4, AM3 and DRA7 platforms.

----------------------------------------------------------------
Andreas Kemnade (10):
      ARM: dts: omap: omap4-epson-embt2ws: define GPIO regulators
      ARM: dts: omap: omap4-epson-embt2ws: wire up regulators
      ARM: dts: omap: omap4-epson-embt2ws: add unknown gpio outputs
      ARM: dts: omap: omap4-epson-embt2ws: add GPIO expander
      ARM: dts: ti/omap: use standard node name for twl4030 charger
      ARM: dts: ti/omap: dra7: fix redundant clock divider definition
      ARM: ti/omap: omap3-gta04a5: add Bluetooth
      ARM: dts: omap36xx: declare 1GHz OPP as turbo again
      ARM: dts: ti/omap: omap4-epson-embt2ws: add charger
      ARM: dts: omap4-kc1: fix twl6030 power node

Geert Uytterhoeven (1):
      ARM: dts: am335x-bone-common: Increase MDIO reset deassert delay to 50ms

Marcus Folkesson (1):
      ARM: dts: ti: dra7: Remove double include of clock bindings

Rob Herring (Arm) (1):
      ARM: dts: ti/omap: Fix at24 EEPROM node names

Roger Quadros (3):
      ARM: dts: ti: drop linux,mtd-name from NAND nodes
      ARM: dts: ti: omap: am335x-baltos: drop "gpmc,device-nand" from NAND node
      ARM: dts: ti: omap3434-sdp: drop linux,mtd-name from onenand node

 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi       |   3 +-
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |  12 +--
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |   6 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   2 +-
 arch/arm/boot/dts/ti/omap/am3517-som.dtsi          |   1 -
 arch/arm/boot/dts/ti/omap/am3874-iceboard.dts      |   8 +-
 arch/arm/boot/dts/ti/omap/am437x-cm-t43.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/am43x-epos-evm.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts  |   2 +-
 arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dts     |   2 +-
 arch/arm/boot/dts/ti/omap/dm8148-evm.dts           |   1 -
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts           |   1 -
 arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dts     |   1 -
 arch/arm/boot/dts/ti/omap/dra7.dtsi                |   1 -
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi       |   1 -
 arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi      |   1 -
 arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi |   3 +-
 arch/arm/boot/dts/ti/omap/omap3-cm-t3x.dtsi        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts       |   1 -
 arch/arm/boot/dts/ti/omap/omap3-evm.dts            |   1 -
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi         |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts        |  10 +++
 arch/arm/boot/dts/ti/omap/omap3-igep.dtsi          |   1 -
 arch/arm/boot/dts/ti/omap/omap3-ldp.dts            |   1 -
 arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi    |   1 -
 arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3430-sdp.dts         |   2 -
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |   1 +
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 211 +++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm/boot/dts/ti/omap/omap4-kc1.dts            |   6 +-
 arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts         |   2 +-
 arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/twl4030.dtsi             |   2 +-
 37 files changed, 248 insertions(+), 56 deletions(-)
