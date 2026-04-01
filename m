Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C169D378D7F
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775078973; cv=none; b=e4L2fV7cTfoTThGV7Kf8lkrJ/fCSrJMTkXa54l1VJ9Ean1fYCRN9LZTUMPl8WjOs8IkPsoMGv6vF/hcygorCjMasDVo/spqPodstKjcSK7cYteEte7EMTm0jYxpfqlAo73s/2O3eQ2a30P6enS6kZO8caZtdBF4ZsIsqYXhw5kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775078973; c=relaxed/simple;
	bh=K8KsRVv9ierCoDyKNMfqXhMspOs4K7/4jBXcjnpXjbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WczW/epkT5/mUc5JswYLSC4nn5r+GmAm8bwL15PWwnVdz6pySkHuo2qoZq2pSTupUpb1zdVcMBERB1+9Pnw1J4Leju+HY+BXtP3C1MvYOBT+tJTEJf9DIUp4z6kmzTYzkwJ8hvj8FUo9eucnaPxaZzGea04uyp1zpfEn3hk4+cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pilzYyB6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pilzYyB6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b2503753efso1384085ad.0
        for <soc@lists.linux.dev>; Wed, 01 Apr 2026 14:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1775078972; x=1775683772; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7GOwLlN10Ns683PDS/KNdu0fTgjCNY8NkrJ0V0K9rlc=;
        b=pilzYyB6ONu6k6zqOQAxEIaZ2uNnjjU415VXZIRwBtlnQedZmjNAZb2VpuTHv+z7Jl
         r+Pn/3sQVc/T4DJtaZy8q+gLWc5OzlSbcDS6mqlElREGG97a5SZEeUDitp+VgPs0QXOd
         7btTKuXsBOiDP0WBYydZzHYIhUfY5qsSFVtYkUWtS4NFeXJ0hXCDRYCUvUljyqJNmeXU
         SDvE76dcQBDQZeBo9xbyGG042m0Ws3vAkw/dW/dvGDaypPONB3Kjk3ztXtY4AyV9a66g
         amMFHDVLo5Ylp0qNwgopcgRFn6AUg6ON78y4QjWDFYl3jTokAif7dWkULxETwTWfQV8i
         05tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775078972; x=1775683772;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7GOwLlN10Ns683PDS/KNdu0fTgjCNY8NkrJ0V0K9rlc=;
        b=Jh/3Kr4MKqOZOV16lAmrn0JucVHe3Wq+CH3Vu/Pbg1zNwzOFFBXrMx0DnMN5I1W61y
         sc5EdyMN9Ztwfe6fZv7ra/VnzJMVb8lRRimpSlI+BQV3PZOh6c7PshJp3ZzJXJeOuinQ
         WWuFWqEPCc5SvFUiV/2eRrNKWaV4X6AM0IuFxAHyR7zkksz2DbLg2tYPWTbZAJ8HgVWA
         p0att1KbCqAs6oZCn7YsztJKa/O4EB0uYlXtoxpbh8hBslRYk9Pbxx3t2DSGMJHfF4Gc
         29mXtvSv9Lkr4AwCDEPYiE2Z507fxWerL/EQK2HJSwXBJBdz9ydKLXdTizrSuVL+3d95
         DGNA==
X-Gm-Message-State: AOJu0Yx/m7MGOTL5spi3D3UqmJj6tla6zzG1vTKo33tmvRgVBCC81LjO
	sVwop50OBGfjSB5FC2dBQoWB8PczHI5w2Fv6nXXcYyHRBsF6FBgNH5g0xKw6sHaSmZFiJMkkk5x
	hNuxeC3U=
X-Gm-Gg: ATEYQzzcyVQL8pWCxTCtHY+7fnMociHqQ3jQpuYt5Vik789GABCirsuvc/gAYe60JaO
	RE8y5Pg6no6soURSChfGtNBNGcUh10CpCSVQ+GQ0tZisn6N9Q5eVRcLp8JWS8t191J0EecPh6kA
	6k/x43ts6iom+VwTy20nEWQMwn4oqy0PQdMwko+1A8+SdCAcx6IJoyDmgdNJMblc9NmhiuiZRs5
	Rr30P99Om57/YMXuuKgYYNQ4BWtytwmQs2JnnnK2TuMFi7Odut30qlZn78mDWIHHXZe0rUaFjdF
	+3guAbtaQ8US+ZPZeJGRlmCP212bpR7psgpuU8XI7HXZzK3uky0xrflp2vP4htNzhxgodDJa4dv
	P4Sb5Bc/nMhYktzck7fZLzq4+HXd0ni/wZI+v2yfMM5BYe/KeTV4Ejag/2tOEA+355oKWZTo3fU
	AcM5x/IIQ8lGWembdttto=
X-Received: by 2002:a17:903:37c3:b0:2b2:52af:52b8 with SMTP id d9443c01a7336-2b275891e28mr6903115ad.11.1775078972028;
        Wed, 01 Apr 2026 14:29:32 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd85sm6419405ad.74.2026.04.01.14.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 14:29:31 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: updates for ti/omap for v7.1
Date: Wed, 01 Apr 2026 14:29:31 -0700
Message-ID: <7hqzoytlms.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.1/dt-signed

for you to fetch changes up to 2c4059f54f65ff1ee2d430fa023d25487cfb5b99:

  ARM: dts: am335x: Add Seeed Studio BeagleBone HDMI cape overlay (2026-03-31 17:15:17 -0700)

----------------------------------------------------------------
ARM: dts: updates for ti/omap for v7.1

----------------------------------------------------------------
Andrew Goodbody (1):
      ARM: dts: omap: dm816x: Correct pinctrl register

Charan Pedumuru (1):
      arm: dts: ti: omap: align node patterns with established convention

Kory Maincent (TI) (2):
      ARM: dts: ti: Enable overlays for am335x BeagleBoard devicetrees
      ARM: dts: am335x: Add Seeed Studio BeagleBone HDMI cape overlay

Mithil Bavishi (8):
      ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
      dt-bindings: vendor-prefixes: Add Doestek
      dt-bindings: display: bridge: lvds-codec: add doestek,dtc34lm85am
      dt-bindings: display: panel-lvds: Add compatibles for Samsung LTN070NL01 and LTN101AL03 panels
      ARM: dts: ti: omap: espresso-common: Add common device tree for Samsung Galaxy Tab 2 series
      dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0 and 10.1
      ARM: dts: ti: omap: samsung-espresso7: Add initial support for Galaxy Tab 2 7.0
      ARM: dts: ti: omap: samsung-espresso10: Add initial support for Galaxy Tab 2 10.1

 Documentation/devicetree/bindings/arm/ti/omap.yaml               |   2 +
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml |   1 +
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml  |   4 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml           |   2 +
 arch/arm/boot/dts/ti/omap/Makefile                               |  15 ++++
 arch/arm/boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso             | 157 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/dm816x.dtsi                            |   4 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi                           |   4 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                          |   4 +-
 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi     | 744 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts           | 101 +++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts            |  70 +++++++++++++++
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                          |   2 +-
 arch/arm/boot/dts/ti/omap/twl6032.dtsi                           |  77 ++++++++++++++++
 14 files changed, 1180 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi
