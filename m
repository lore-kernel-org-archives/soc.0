Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F72274B27
	for <soc@lists.linux.dev>; Thu, 10 Jul 2025 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162548; cv=none; b=LICRKY20Jc6eGpKcDLT+UXVhNtJzsmFuk4DNQENvtJsxK56pSX8FJSlMTnlMfMMBJk0sR3xjpzijv4/OpkxQsEFCfButeeK7YtPuUqXvzocsVg1m5lOzuzIj3AkkRiV42vRYzFl5tqYREKz3jlQjZ1jj2IBDtQD6v/XLutbKWh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162548; c=relaxed/simple;
	bh=NUas53vpoAk6VP6qKkOKtFSjta/i003A560bDDh3vDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nBBIn7UB70oreJWqgBfdpi56zKwrIr3un7myB5ofNlb+JNIzU2ES7gg2rTz/jCS578RAdCdE+4mjotQDUFodKJntp5dgfm3qCAZC5C/ZNNX6B5Y0muQ41URsb9tQHoXPoGfQHN5m1rWofFKIDqJlKKHsUyy4aMy2R1UR4ryzAMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1Tjdc/dv; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1Tjdc/dv"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-23c8f179e1bso13567495ad.1
        for <soc@lists.linux.dev>; Thu, 10 Jul 2025 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752162546; x=1752767346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9xR3mb1kxP9itCBHwNObW7nPNgFeA20Kv8/YjFmav0=;
        b=1Tjdc/dvOudjT5p9p/j+adGeSugjzqzDMBPNLXdIAKrAuuumBwkl7UbDGHsP5Bs/XG
         d7qIfjEJQr7eUwk1KnrWmQwgmZ/zCQBB6PI0nl9ADoSTIe9SM4LXB4sr7RIMQRRwAk+s
         Z/8fs2KG+5eac2muxDOsKKZJjzOnrEQ68HvucL2h+Mh+epg2xYLucyx1pbmCG/Zveg7Q
         kxDcoVXTjigvWjM/wnFsIOP1dJAWyqFkjrNVH52phThoqM36CObFKfzWbSc+hgng08G4
         bsvJ2PhpU+qv85gaStfEK5efoNFr183QiOw6M0oOfIZP4rlHfhL+jkpUa+wIY40PHBpG
         ji4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162546; x=1752767346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9xR3mb1kxP9itCBHwNObW7nPNgFeA20Kv8/YjFmav0=;
        b=taM5Vp2aE2LXB15EzmpvcBdOjprqPER5tjo/6c/kK0vl+fXudVj1WeMv4OchtOgXDo
         TUH5HQ00WtDw4Uul8CR3enlCzgds6XYx+ZDY4nxXZVaw719JtKh5rXwhfBYB+ZbcWYWP
         LmhIzV2i5q/tl4Qq1xvuz36KDrfFOKQ9tPRQjXkcNqo/qeB6RIESghFQp3Ps9VN6Smk3
         lzx2IKGlkPpgT9xdxqTXRgaHXuknJG7A4rY6MZYEClq62DBH+v2+vtyMT7aCabbddh1T
         mUEnGF4AuD8yhyceUuFFWTPQp3Jydm5MB73vCuoyoOM3TzibbCx2WbjEEdh+CbTGpgwa
         b6pw==
X-Gm-Message-State: AOJu0Yzvytb1LE5MOuiqSvEyITXHVNioGV87Lr4gY3hOnrTnmENgioJG
	Vc7l+1Ypkpb/hL11DzHxq5x/W2HuXWMEQMjZ9byg7Gn6o7Lvdb3vttOuno3Tq7hepf7/ksrpual
	As8x8p+Goxw==
X-Gm-Gg: ASbGncs+Dnut+tOPlv5HX2WaomPUXZainy/3r/vAC1/QyzCAv5FlelPcjPveKiM520I
	hoBxS8dmj/qR8JVDWAM/zaMRdSBbFgxAPnb04tM1BU0xG1p39eHVJYaavOIsnfd+JlSyfCj0ijl
	MogO3dpcyirBsUOhj4Un5pQjssWWp7PNmF7h+avUJc1rAEMlX94C6BCQFt6XVke4WOC4RIBpqZX
	s5rHGNJR1yJc5aBf/Gzm/pvi1S+vDLQD6JmQkGU3+HdJI8BA9PlxFC4Wc2WMQK+zjpKeIPsPgNX
	/DzS9xSg9eMH8NNe/o9kVDozdODNeb0NxR+iyBE2bHxleVOBqFLxo1ipRVvFTzTc9ELgzN8=
X-Google-Smtp-Source: AGHT+IGl3lYbN2pRFYA0zQWbsg56J/yom0bWzs4fTRL3F5wEm5er1i3GzM8I8xWM5o1Eo43mIynm6Q==
X-Received: by 2002:a17:902:dacc:b0:237:e818:30f2 with SMTP id d9443c01a7336-23de489588fmr41446345ad.50.1752162546029;
        Thu, 10 Jul 2025 08:49:06 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43313d3sm26855165ad.144.2025.07.10.08.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:49:05 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: dts: OMAP updates for v6.17
Date: Thu, 10 Jul 2025 08:49:05 -0700
Message-ID: <7h7c0gxczy.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags=
/omap-for-v6.17/dt-signed

for you to fetch changes up to a3a4be32b69c99fc20a66e0de83b91f8c882bf4c:

  arm: dts: ti: omap: Fixup pinheader typo (2025-07-07 14:24:57 -0700)

----------------------------------------------------------------
arm: dts: OMAP updates for v6.17
- new board support: Seeed BeagleBone Green Eco
- misc. fixups / cleanups

----------------------------------------------------------------
Albin T=C3=B6rnqvist (1):
      arm: dts: ti: omap: Fixup pinheader typo

Felix Brack (1):
      ARM: dts: am335x-pdu001: Fix RS-485 transceiver switching

Frank Li (1):
      Revert "ARM: dts: Update pcie ranges for dra7"

Kory Maincent (3):
      arm: dts: omap: am335x-bone-common: Rename tps to generic pmic node
      dt-bindings: omap: Add Seeed BeagleBone Green Eco
      arm: dts: omap: Add support for BeagleBone Green Eco board

Krzysztof Kozlowski (1):
      ARM: dts: omap: am335x: Use non-deprecated rts-gpios

 Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
 arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts     |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169 +++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++
 arch/arm/boot/dts/ti/omap/am335x-nano.dts          |   8 ++++----
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |   3 ++-
 arch/arm/boot/dts/ti/omap/dra7.dtsi                |  29 +++++++++++------=
------------
 8 files changed, 190 insertions(+), 25 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
