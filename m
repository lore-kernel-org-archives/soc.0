Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61FF385531
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 18:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769107197; cv=none; b=uPVD1wprx4cMK//cEts6hyhEhF7GfZId7aWljWjsKCC6o1eQkDSaCnG9OxCt2RH6vyjqKHX0kiMt+dGPMMITq4ikPMpKVoPF5IEvAIZotGI6tttkW1+q96vmJ5wrkRRSR55+M2vHtvr/RSvOSsgqEsEey1nl0yeVU5ClDGbuu6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769107197; c=relaxed/simple;
	bh=C/LJc0P7pSCX6HhTs7JO0p5h6mPdfW06ySxpR5N1kJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NzZY0VhMFPnuUtCE/9LU3jjwE3mtINjmQ3B2YXONhgWWOhPhjaTzhZHCDBUifADy+MTToFVC6zjnACkLmMpeufqwhvLOHa/5b/XyhLGliQXtgYvaqq3DWCLVTmQcUnGbH+IGyEQp87wZTJSvR04pEZANVNd48f4x5gM4icb9VT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S92HRQyZ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S92HRQyZ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso1239892b3a.2
        for <soc@lists.linux.dev>; Thu, 22 Jan 2026 10:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769107185; x=1769711985; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eU9nAAzm7tuhsde9kPZ3jwJ1ZSEJF+Z3udZWl8Q5Jwg=;
        b=S92HRQyZiV4cho2C7QtDYIshGBKaiOx9X/CWJ3n9AKLO6+am9S1fyyevm6VvJ5vOOn
         ca9sOvTAkJaGdmQuAN11l5wyfREL6q83Rrl5k4wMVU1BQoS7iYjx33euTzrt4Vl/kZwE
         m2PRAt05ujOhQfOsy70h7T0g6HbekPSmTDv15/JYAB0lNJtyJ6RovWRpd7xZwPvrdjDu
         2OhDQld6eohjddF++nJlxfNGPgLxvCP4OaQ241jWLd9ggpjjiiznbQ/T07kvcRdZKbrS
         KpQUsYnu3Og6sfKX+zWLKE/vHMKn42KN0oaH6YXdT5YpKCtPPETq4+It3dBW658LdwPU
         ipcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769107185; x=1769711985;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eU9nAAzm7tuhsde9kPZ3jwJ1ZSEJF+Z3udZWl8Q5Jwg=;
        b=b2LtuQ4fduELaPIvK+8TvGNlWT8JYSYqNAUIrZbblY8lEaJkZOQdTZn8qZTZY7i3gW
         NUUqDBZfZPGgDyggjcmncLLrCOn/GQArvgIK3AOd1kFjGVBRa8XAj6UtwH6x6L1NO4u0
         DBLVbtRvUbZDyOh8e+/8yaQrOZctWUdg3fxMXvf0Kf8SIpXGWStdoDdtZzF3r4hvLpxn
         UmLR6MwO0qWSD8unZXy9nFacXPKryXHSTRyHMJRbN/8kh4wDmn97Ffirb4vWo8DhgWA6
         NMdht0LU76xOMQHxuuqllrujKx0u1/QKFptuVgb1TsIlx4BBqQqR6VF0yomdb9UTXwSZ
         tuVQ==
X-Gm-Message-State: AOJu0Yyp4+/u+wyOCHtB5MnQCgdmceGzO7kGZjXffqP+1BfuLU7cLwd8
	DL7+ZFqDUEW/p6GKRfx3v9WcDzjd0IlwrNFwg6hNnKEQFl27rwQHpOkmgaTqi1itF71BdgYj+5b
	4yieeaqQ=
X-Gm-Gg: AZuq6aKnu686klh9tqMEOTHJFzCU1c9GCeyKcO5//KMk3pbmdOp+DSKvrbYeRfAF6B0
	R66ixgSlqoLc1j4wrFjEt6XOSDTUsqVz3TQhasvY1NYjdvoWyFLbh+YJTmxKHAzjuTBx8pf68Ua
	cicwNnU4hgQN3h6Xq9+04gTyNTMX1xZiwe1mwedgVf6ge17s19/RrmxoShrzBALN9qDnUmsgoDW
	fAehOXdowgWW0ycTynJlH+C/jasMsw1z92zttUBqalqrZHvDHJrNLq4TxxpHEJtxPTAxWahT/Au
	g70OzSyR0frgEZeBfkp+uthIlhsNmzZjQ8V0+24LQ+8Qf0/NZWwW5eOW9kW4Q/hw/pQCSNRu/4/
	rTMl8DnfKmB1f0YT/eB70KMRTBFgAnrrm8gQtHgy+RMgxfr5n+wuFgK4JkYFBn1ZxHNzslTBS0a
	AzIqfpDHdoKkYmk8cBhI4=
X-Received: by 2002:a05:6a20:7485:b0:366:14ac:e1f0 with SMTP id adf61e73a8af0-38e6f83ae57mr387123637.66.1769107184746;
        Thu, 22 Jan 2026 10:39:44 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f2ddcsm41909a12.17.2026.01.22.10.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:39:43 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP updates for v6.20
Date: Thu, 22 Jan 2026 10:39:43 -0800
Message-ID: <7h7bt97aq8.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.20/dt-signed

for you to fetch changes up to 76f88d2edd9f21acad7be8422069403118708455:

  ARM: dts: omap: dra7: Remove bogus #syscon-cells property (2026-01-05 12:11:31 -0800)

----------------------------------------------------------------
ARM: dts: OMAP updates for v6.20

----------------------------------------------------------------
Alexander Stein (1):
      ARM: dts: tps65910: Add gpio & interrupt properties

Andreas Kemnade (2):
      ARM: dts: ti/omap: omap4-epson-embt2ws: add powerbutton
      ARM: dts: ti/omap: omap*: fix watchdog node names

Kory Maincent (TI.com) (1):
      ARM: dts: Drop am335x-base0033 devicetree

Rob Herring (Arm) (1):
      ARM: dts: ti: Drop unused .dtsi

Vladimir Zapolskiy (1):
      ARM: dts: omap: dra7: Remove bogus #syscon-cells property

Yegor Yefremov (1):
      ARM: dts: omap: enable panic-indicator option

 arch/arm/boot/dts/ti/omap/Makefile                |   1 -
 arch/arm/boot/dts/ti/omap/am335x-baltos-leds.dtsi |   1 +
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts     |  92 -----------------------------------------------------------------------------
 arch/arm/boot/dts/ti/omap/am3703.dtsi             |  14 ------------
 arch/arm/boot/dts/ti/omap/am3715.dtsi             |  10 ---------
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi            |   1 -
 arch/arm/boot/dts/ti/omap/omap2430.dtsi           |   2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi              |   2 +-
 arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi | 237 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts |   5 +++++
 arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi       |   2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi           |   2 +-
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi           |   2 +-
 arch/arm/boot/dts/tps65910.dtsi                   |   4 ++++
 14 files changed, 15 insertions(+), 360 deletions(-)
 delete mode 100644 arch/arm/boot/dts/ti/omap/am335x-base0033.dts
 delete mode 100644 arch/arm/boot/dts/ti/omap/am3703.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/am3715.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi
