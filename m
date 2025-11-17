Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9282C2372
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400469; cv=none; b=YcWvIOuSDV97rhRz1oLvPVJ7AUopdpqsvZrB2M8jwRlo5lLdmDn507U3KA2Zqi7YtmPmn0IxJIaBAWbvjy+9z7buapLp7ObWaYuWPwich6j+Xx5Vv+Spp8+rQxBdaFs/dcIOp/LEa5N3akVXAeExCofkA7t0kNDIj+iWC7d+dDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400469; c=relaxed/simple;
	bh=UmV7RW5IQZdRVOg4be1QC5nZUt+u8Cdv2Acy59rYwo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ihCDel6WlfpX3VsP4gbZe68zi5wjnVH9e2mHSWrPBylyYTQJ1d1H3r0P+XLaHgRweaC70mJt6HlJq6f9Xhn/Qjt/pitVWNxQzW1vBJPRHMfwPUqdCW7AB5smnIjDQ01G/FbfnG9aMzKiEy6oYnMohUQFc0SK65kBB1UmcHtLb8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZHOT3q9M; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZHOT3q9M"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2981f9ce15cso58119775ad.1
        for <soc@lists.linux.dev>; Mon, 17 Nov 2025 09:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400466; x=1764005266; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jDcHchPS33+9IgvjQoWPK4JXZQu8rRXLrh5Gl3izbAQ=;
        b=ZHOT3q9MDk8lA51plasWdRu/uwvEzZKNCq/Ga+R8tSp0joJdL8vhzbaKs0pRXtiaYb
         qzsZaHIFqpm9mKYWHKhLrf8cKLPSNEn1B463DEQ2bK/JVGWyjWy/5M46qsgCcCaa7+B5
         w9qeY8f7PId8vrfPJJzWBJGTcDbQHQSbr0dSQ4Og8gydkJvm4iInTmc8U1o9+zKOKUVs
         9WdhxZSddEM/XzSfxeZdAeZD9jptJrMkAzl21U2mbJ9jL8dwXAvd3byQyD2ARtCr/mGb
         djTc3040biySOXrnjBO5f490Kp7stcWwoCxTNyUHGYGdY09FtBd1pusNipU2CEMZaGhX
         6NEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400466; x=1764005266;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDcHchPS33+9IgvjQoWPK4JXZQu8rRXLrh5Gl3izbAQ=;
        b=n5+YthVRUBirVz57UJEVGULkUjDnT3Ta+ZhpmZsqJvSiD7kAY1zXgRbLH/KG3SEmG8
         ynnJdXgT8D1y93iJsIgoel4TexFM/qx3dBTjLB3+9exRO9uyEg1q4T3QQeVF/MXziLCz
         YnO7cgjykDh3KRsM7j9pdT1/WaDXOlxnP5vz6QSL41zcZkhcirYf1nchkAtAyPLxBPPS
         qPNw5pYBtAT1N9GxQkkYJ6vKdKmpVAm1wL7rxdRtxAXtLlVq4h56UOZs7An7ATliDEGN
         i+SOCNvAdjfUZ6HagdueEPtqXepGdxAgdJI2nLIvOoSpE2b7kTmAdpcltu96Tuewxu3e
         aN3Q==
X-Gm-Message-State: AOJu0Yysk3O57zeunPrAk1VycQMkscWa+xTYdTIOgch4Ngvjcgh/QIp7
	e+DGw+UwuvSb3wSnEc/ZfQj4dKloMKSHwWBMwvr4c3DlDaJARLMpOoF/KmLnPK/AdGhoaOiAj7I
	OjjfMl1k=
X-Gm-Gg: ASbGncuLeqOkpfi4J0xh+m5DlYDZjR8UcoIHHry0AwCKrZc6CAAnJb3AreWBj2mBe3G
	wkEiaRhHjgcNllXDZ9RgoOgkVktK4CdZeT8VwFMZMw0k+FP5VwbsL4ici3oryYFHyC1fYQVs7yf
	bJpFEsXBLDC8DTWbi+YCeebo9oDwRkx0rcXl9oTUlL5jDABZlExCXuiIhe9SHrPlC2ZKT9I8AZp
	bPZZ1KA/U1QFalqZrJIsKItxTFs9FbGycIDQWd0sZCyDR9MkTe1D9E5fa6HiKHs10ERUnX8ZeaC
	sx34bdzj1uNlRRnhIQv+bUWQhaJW2ymdrd0BXW6bKrimDIed08f1QrjJb+fyevLjL4TOSToujWY
	jDymoUld0RqRc3kTDtgDoEBIitVTgMvLRrg+ubjnwQODhON9Sl1d2Ac7jcSnzXFo7Jjs9VMzxHl
	cnxuz9X09H
X-Google-Smtp-Source: AGHT+IElSDqKmysdPsypqiwQmrd7nhXoTOdlBkkWGvewmZSLP/XTtjfZ8ALU9FqHgq3YZZs3dsHUKw==
X-Received: by 2002:a17:902:e5c3:b0:295:596f:84ef with SMTP id d9443c01a7336-2986a72e380mr141061385ad.31.1763400466406;
        Mon, 17 Nov 2025 09:27:46 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-299daf12fe9sm53218385ad.74.2025.11.17.09.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:27:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: omap updates for v6.19
Date: Mon, 17 Nov 2025 09:27:45 -0800
Message-ID: <7h4iqslgby.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/dt-signed

for you to fetch changes up to 73f0769ebfc6473be084f0c52db25d2973097dd4:

  ARM: dts: ti/omap: fix incorrect compatible string in internal eeprom node (2025-11-11 12:18:23 -0800)

----------------------------------------------------------------
Misc. DT updates, mostly for AM3 platforms.

----------------------------------------------------------------
Alexander Stein (1):
      ARM: dts: omap: am335x-tqma335x/mba335x: Fix MicIn routing

Charan Pedumuru (3):
      arm: dts: ti: omap: am335x-pepper: Fix vmmc-supply property typo
      arm: dts: ti: omap: Drop unnecessary properties for SDHCI node
      dt-bindings: mmc: ti,omap2430-sdhci: convert to DT schema

Geert Uytterhoeven (1):
      ARM: dts: am33xx: Add missing serial console speed

George Kelly (1):
      ARM: dts: ti/omap: fix incorrect compatible string in internal eeprom node

Jihed Chaibi (2):
      ARM: dts: omap3: beagle-xm: Correct obsolete TWL4030 power compatible
      ARM: dts: omap3: n900: Correct obsolete TWL4030 power compatible

Matthias Schiffer (3):
      dt-bindings: omap: add AM335x-based TQMa335x SOM and MBa335x board
      ARM: dts: omap: AM33xx: add cpu label
      ARM: dts: omap: Add support for TQMa335x/MBa335x

Nathan Chancellor (1):
      ARM: dts: omap: am335x-mba335x: Fix stray '/*' in comment

Yegor Yefremov (3):
      ARM: dts: omap: rework Baltos LED nodes
      ARM: dts: ti: omap: am335x-baltos: add a regulator for the mPCIe slot
      ARM: dts: am335x-netcom-plus-2xx: add missing GPIO labels

 Documentation/devicetree/bindings/arm/ti/omap.yaml              |   7 ++
 Documentation/devicetree/bindings/mmc/sdhci-omap.txt            |  43 ---------
 Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml    | 169 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/Makefile                              |   1 +
 arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi               |   6 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi                    |  17 ++++
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi               |   4 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts                   |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts                 |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-evm.dts                        |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-evmsk.dts                      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts                   |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-icev2.dts                      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts                    | 633 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dts            |   8 +-
 arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts             |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts                     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts                     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts               |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts |   1 -
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts                       |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi                  | 270 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi                        |   2 -
 arch/arm/boot/dts/ti/omap/am33xx.dtsi                           |   3 +-
 arch/arm/boot/dts/ti/omap/am4372.dtsi                           |   1 -
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi                        |   2 -
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts               |   2 -
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts               |   1 -
 arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts                   |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts                        |   2 +-
 31 files changed, 1121 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/sdhci-omap.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/ti,omap2430-sdhci.yaml
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi
