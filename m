Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449E829DB88
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 17:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400327; cv=none; b=qwhYbqdCt0eiRCMGV56+GCUs+NgjIkUOPId+f6xuivXOJ6L1osyG1mWMrKsLytue1VQxprUqzaKtbteI1jcQBKHwdYPOQKz3EX8TAqpNQgMPvPERbhkERHFC9nUCrOw/j+uDF7u9N2KuBZWGN+fxN8thosMU2WmAALPdZSc6HMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400327; c=relaxed/simple;
	bh=UmV7RW5IQZdRVOg4be1QC5nZUt+u8Cdv2Acy59rYwo4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kNKK+Mt7W687DmKM2NmA0/l9vdS8+bAhPbvqeFvaK0wJsjlXxHnIffNEgPIunr2OwERg/cWVeKCVYu0r7LS30NosCQrbz9deAoDY+zV1TT7el7fFXY0AE4fPeNZ3xUt5SqAHqc7pcUaR5mRqgBf7G3HGGJh7yoVfn0CKdnzAUtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bJEjNyZU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bJEjNyZU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2980d9b7df5so47291605ad.3
        for <soc@lists.linux.dev>; Mon, 17 Nov 2025 09:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400323; x=1764005123; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jDcHchPS33+9IgvjQoWPK4JXZQu8rRXLrh5Gl3izbAQ=;
        b=bJEjNyZU38wI9o6RWPTun7FvLSlz5Kc6WeI1Rhf5tDixlt7D/Q0EgXp6fYENJA7O/K
         fo0qHeHF68e0oMTrPqA9+c/FCtrocS97+LVzZ9as6MRMR021ogO9Bj8cPgnErimb5TPe
         UuFF1LvnG3a7mDWq0ciq7yqc6PZDuYJsXtT4gw+Vf7uK4+/fAjc4ujbZtg1lmThBqQce
         gMEmrhaQAqYiKVbuE6ij2zmPH05ndez+tt8WF34qcPC2L5EwI6mjyUryy+RLkcu3LbCX
         xYST8VRt355M3TW2Lj4/A+HussQ2Sa8Vi3LCKMjkMMVeM4icRZqGzwREev2erd4ITRAZ
         7voQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400323; x=1764005123;
        h=mime-version:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDcHchPS33+9IgvjQoWPK4JXZQu8rRXLrh5Gl3izbAQ=;
        b=NBn0schvvvm2kP0GCYD56YfhPKNgj0p1LZA6AsCwP5EBs653XgT8jrPz1ydVWcB8tp
         hwpJhVvZdS8+UZ/QJDtlMABVakIwZmwVrZRLjQk9cmHB+1l15/+sXBgg0t2iXdGNGVlI
         GxGPYorBTbyB1cgyWSePm+MV7dEMuGYDbZr4RGxNsGcEYWyXld851ODpg+CgPdxeQ1W2
         h2qFdqthIB9nZSNrBeRjcpBa+Z35N+APSM9zQER/E/uMUAD9bLk6yG6UFLPbI8XfaiJ8
         fFcJR5vXUkjEIvIYEoQlR3jNyYnU9tNqxxNSvrvAZwy+/DVg4LOjIBpftCG9LNUi3y44
         13vw==
X-Gm-Message-State: AOJu0YzpP+SJw3gKzt+NIZbabca4x3vffZtxDbivFzSA9Dx+UQJ+3YA8
	btm6jb4KBhHSScAdtn9FaYrEuI1dBSgmpPKW46tpZQuCNpKqtHafk1dZg/VE1OHV3j05IigdswU
	DA20vlFw=
X-Gm-Gg: ASbGncuU6QfpRgTn3yCuWKwaUXny8enQqr40wbNaItR/umFE9xxz5bsHy2SNAsIJxH7
	lRj+xQhdflQUOxeI2+nuU2/OmD69o8OuTnpjrZWq/CZQ5lytkwXX0FeUjOg1EzgjdzLYd55ducb
	xgStzxkktcga4HFB6SzcORlYWnaCx++pa/RL21cT4RaJAKqMSRr0PW4BspITYr9wezTzShKYCEA
	FEapiJ3CH3nvYedvKzF22hCxqVXng1wYveAiMSeEW1oewbuf2j34iHf7USYuVOrXH0sqSfu+F6V
	Lj9yaAGq9pvq92czqre90VYSyX3Q84QHZa+YO3HTIWNUR1dWfWNVCB0ILO51b+s/HqZ0sqLhPhK
	A8gbaoG5Ov27cul083HvoHggGFtbDDqlqd0THeZxOMADfD1x50nkin69epprCNCJHHI50yCvaoy
	noBk+lfuMo
X-Google-Smtp-Source: AGHT+IEQXA49c4IsoXf559v+NOq7mq/wBGWC2Ysu1zoyG12v5Vv9GMrsYXnoQp48zg18xO463v1ORA==
X-Received: by 2002:a17:902:d4cb:b0:299:e215:f62d with SMTP id d9443c01a7336-299e215f9aamr58904585ad.5.1763400323336;
        Mon, 17 Nov 2025 09:25:23 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm146382585ad.7.2025.11.17.09.25.22
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:25:22 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Subject: [GIT PULL] ARM: dts: omap: updates for v6.19
Date: Mon, 17 Nov 2025 09:25:22 -0800
Message-ID: <7hcy5glgfx.fsf@baylibre.com>
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
