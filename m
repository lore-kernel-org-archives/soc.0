Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC64EB84F
	for <soc@lists.linux.dev>; Mon, 28 Sep 2026 17:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617022; cv=none; b=lrcvtRuNK+EMki70f19U71iZzrKsoFaMkmmA6oeo3ljyQ5GEBBHgvetlS7xwJTwhJCSyrQ0HesfCpMI0B+mrogh38SAysRkk7K6DxMVbYF8ANcHXmBD8x/flEmI3PQZ2BIQ2mgzSySNPELnK1QYhtmjBh0JtbttI+wHD2VTqEfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617022; c=relaxed/simple;
	bh=51IqI+Wuv3O2K3tbr9n/d59/5qo9ePT36iarXmxvd48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ad6E6TE0cCwwRRKAU+SVdRQLefgSycvaYejOFzHbfN+XeGFSi0kwBQXny5IhiE3dmDCZulkIFqEsCl8zxy0qvtXqeubmFOsvighb8QAdZ8r64xVq6sd1XeS7f4bnRdJQbIEqGVfHZpD/yYlK+iO+FfiWHPxLR13i6UrPZeVFIlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NLIYp0Pm; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NLIYp0Pm"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd412cfso1198573a12.0
        for <soc@lists.linux.dev>; Mon, 28 Sep 2026 10:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790617020; x=1791221820; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7p18ol6P0YPGqM1fpj3iPohmUFqHGT7j7iYHvqBoic=;
        b=NLIYp0PmW33oRLmMT//La13BKOWM7BTlbKqWjsteNjr0oa05SOdU5BMWjGKCvmlUub
         CAyiwQiYi/ybwkJ2yWxY2ABoQ4twKNNHdHdznbk+8n+GPGk1jAxFP8DJPdFLwcH6iEa5
         7KJBbtJkm0NjavVNdnHBe/uvadczmyvYBS4fZLJtl+VBmGuPR4cwCAcsoPMfoFEOm7DO
         Wx1AbJXtbcdI5qssCwPzcW0EggIh12Ra+YB/eIxxwR7GZlHFslu2G7VRARmh7x2JTKP4
         mSylKDpOKUAKSQKfVFIcFhYs2bKhnjqlgxpTbBh832Ahv+oPHgUSOtU5ro2xyrhzTCVr
         QKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617020; x=1791221820;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U7p18ol6P0YPGqM1fpj3iPohmUFqHGT7j7iYHvqBoic=;
        b=ARRJ/g2dW7F1zoIPGbAx4i/A3MhvUtGa1nGfzh2pp3o/XrtC9ExrpSGIQ2qz+c/Yjy
         6A/GceYhbWrii+eZDQMn1tu7KwSFudhbxI4VZVU/UccucufU6GKfnovoQTDz5HaWsZO2
         XIDE5J1GUt35f58l+aCj/kcDhfHuVknRYc2uJWU+H3KWgsu8pOVc/NTnaP/kwbi23Xtc
         J3ws3HkYg6c/Ehpu2kXSARU8h+k9f5Oc0uVrHcynm8SM8vWc6aqkd6MjHYt7U5qt0Pms
         uI7ETuK/L90rb3Z0zCZEQdjFOhwV372lzbqxZyU+VsFwmvVs9W9UG7spDC6lU51q6Zh8
         Y0cQ==
X-Gm-Message-State: AFuF++kxZzb5DFxAa3ijMAQKzrOhsUCE+iunhHyC/byuDlg/WlWRSlG1
	YJW9hlqEjMyC9fdkjp/fAsC5Gj+QO+LPJSKiplKe+InPnUoUT0Q0ajq84ya2U3wE1mMhG5P7OHa
	fsPs9
X-Gm-Gg: AYBFou0uAJ4B1eZkO0UWd7zXYhpF/hnLmix0Gx9xneSAJBreqLYnebKksBBLtwnLHI0
	jqlkxkqXaa9iPLQXTkHMwEorxFSp7lOoReeuiHkadHlI1eQ5v9vmbN0o82FO1EIV8juKtElnsml
	k9mz5XB8ygh58S4Sm7x5u7l/pagKIEcc+o7R4+SPO4pJYs6WotTuz6ydE9DA8ei70vZp54w3XL+
	92gA1mFyKYGgwHS9O2dD+6gHmAmOlQAlHq5ZPzaHt4mNR534Sa5MrVt1MEKEke4JluGvtfD4bZR
	Al3CkQJ9a7Fy0oiZx8caZNA9yhEMk2zod+D0XY3fkmojR8CeFlxSrk4867NYaFJkfQ2/lmpDGdE
	ieS7VZ/LHQGw0kFwRQJ7MQWVsjDGnZ8wbrWkXtp7ZsxzhJWxKPnAkHjMpv7aq7xUdo7BT/UHxYB
	BR5CB0X3j+TcKP6iZSKxgfzDEvxP/5dYXMSYV7xe7H2zaFYGSOtBq+hEbjLZyQ6vak05g=
X-Received: by 2002:a05:6300:6d87:10b0:3de:74ee:c04c with SMTP id adf61e73a8af0-3de74eec3bfmr966694637.60.1790617020321;
        Mon, 28 Sep 2026 10:37:00 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cc7a4b03082sm2807652a12.11.2026.09.28.10.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:36:59 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP updates for v7.4
Date: Mon, 28 Sep 2026 10:36:59 -0700
Message-ID: <7ha4p1b7lw.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.4/dt-signed

for you to fetch changes up to c3037b5c7c38bdf78c214e7dbe513a553ce8f47b:

  ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by increasing vdd_mpu voltage (2026-09-21 09:02:20 -0700)

----------------------------------------------------------------
ARM: dts: OMAP updates for v7.4
- am335x-bonegreen-eco: Enable 1GHz OPP
- clock fixes for camera sensors
- misc cleanups, DT fallbacks, schema updates

----------------------------------------------------------------
Bhargav Joshi (3):
      ARM: dts: ti: am57xx-idk-common: Remove unused ext-clk-src property
      ARM: dts: ti: am335x-shc: Remove unused ti,no-init property
      ARM: dts: omap: dra7: add da830 fallback to am3352 rtc compatible string

Eduard Bostina (3):
      dt-bindings: input: Convert TI Keypad Controller to DT schema
      ARM: dts: ti: omap: Disable keypad and enable it on the boards that use it
      ARM: dts: ti: omap: Fix Palmas RTC node names

Kory Maincent (TI.com) (1):
      ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by increasing vdd_mpu voltage

Krzysztof Kozlowski (2):
      ARM: dts: ti: omap: Correct white-space style
      ARM: dts: ti: omap: Replace spaces indentation with tabs

Laurent Pinchart (3):
      ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor node
      ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
      ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor node

Roger Quadros (1):
      ARM: dts: ti: Add device tree nodes for PRU-ICSS1 instance on AM571x

 Documentation/devicetree/bindings/input/omap-keypad.txt      | 28 ----------------------------
 Documentation/devicetree/bindings/input/ti,omap4-keypad.yaml | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi         |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts           |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts                     |  4 ----
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi                     |  2 +-
 arch/arm/boot/dts/ti/omap/am57-pruss.dtsi                    | 11 +++++++++++
 arch/arm/boot/dts/ti/omap/am571x-idk.dts                     | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts            |  2 +-
 arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi      |  2 +-
 arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi             |  3 +--
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi                       |  2 +-
 arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi      |  8 ++++----
 arch/arm/boot/dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi |  2 ++
 arch/arm/boot/dts/ti/omap/omap3-igep.dtsi                    |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-n9.dts                       |  5 ++++-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts                     |  3 ++-
 arch/arm/boot/dts/ti/omap/omap3-n950.dts                     |  5 ++++-
 arch/arm/boot/dts/ti/omap/omap3-tao3530.dtsi                 |  8 ++++----
 arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dts       |  2 ++
 arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts             |  2 ++
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts            |  2 ++
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                      |  1 +
 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi |  6 +++---
 arch/arm/boot/dts/ti/omap/omap4-sdp.dts                      |  2 ++
 arch/arm/boot/dts/ti/omap/omap4.dtsi                         |  6 +++---
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                      |  1 +
 arch/arm/boot/dts/ti/omap/omap5.dtsi                         |  2 +-
 28 files changed, 183 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/omap-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/ti,omap4-keypad.yaml
