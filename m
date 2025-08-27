Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DC41C860B
	for <soc@lists.linux.dev>; Wed, 27 Aug 2025 03:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756266947; cv=none; b=HKrgPZWGHT6SXvnmqLIk6B1B3A2qC2skP0EtaMvCt0Lu8nU7fbUI0HEogwvgALu6NuyP3JnbCLFmyJs7OFAYiBfh5Ok9D/mu+XFHjp9fVSvCeE8v5An50cvStybDTt/3h+46FaAbXM2Nvd8fAgzvQS1EIiC5sWk2tM1E5pTxRJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756266947; c=relaxed/simple;
	bh=EeurWMOi1b1RMRIJVLCG9Ys3siI5bm4VnuY0nLvGKNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fxw5qQLmj29nQkSnDWDK5Y+yanB39PfcO/DDp13Bt6NyTig0wCaCdA+p5Bz+ilfKGI5slAjVuZLniVRMmJsVuJBkq56BGydyT7MP7xx4WFi+wT83XPNHzkKOEHRI+bAusLL/zPj+ZBFUegdzYhajx3i3BfzeiudbPPK4ij70v+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYW6iFVZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYW6iFVZ"
Received: by smtp.kernel.org (Postfix)
	id 1A6AEC4AF0B; Wed, 27 Aug 2025 03:55:47 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35D96C4CEEB;
	Wed, 27 Aug 2025 03:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35D96C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-246fc803b90so23123735ad.3;
        Tue, 26 Aug 2025 20:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756266945; x=1756871745; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhJyrh3aV+3odzPmpWAqooXptKw5M2zQUOI+wqM08wQ=;
        b=bYW6iFVZ9NTKtru4CJ/cRea0YjKAYznS/fYDKU8sVtRUropXeoWvfA9edB7yBcVLVb
         TOgv6gJWMCNyMW3HAat14YKc2ASazAWDPwJlqG0nSLlJWcs6vcckPJnV15BKVAqIzMa4
         bcS1MEYl2SFNR8+3exfWTE5NobMVCOL92kWQrgCISAauCX8/dZGVNiykofJTi/s9eMAh
         JVxKxk4Fe1Z+IV4Q5uerReEc86t09oL9AGQMtQxJ24T1Qe6nmEoj6q7kjJQU06FB6HHP
         Vf1MJsJwsbu2QwRdlYvpXDUWkEPaO+f229xiQTFJQRqz3etHrsTTADFXZMyP/j5UGR+g
         GRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756266945; x=1756871745;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhJyrh3aV+3odzPmpWAqooXptKw5M2zQUOI+wqM08wQ=;
        b=iEL44qbDSRqk6cXf0XOwNBY7B2enhMqoOVo3Szoe192wOB8Ywkv1fZj7QqKgj2ze1v
         qPlH8WmMIDmJZ+o5OcoumHvffE4sYpVleZGRCKhYXPOS8oJ2lqfBzJpR6YVxIlCf/3lt
         37xRUiWYcEhJeqN0RB0zWDccjhpsImcjb37B55N6+T+zZsOPMxfG4zlIOqPvEi0vGUFt
         PMwUGXvj3t6DbLjd0ZHW2VYraZkOnoYoE6KYOe3e6ByU6xLxp56/R7yXgA6I3pGfY3Tc
         Usf7AWvTJuo1wrprcvVHnlDCyK7nC3pjPQmVe0UjlKQtP1w/gVKl5a5VexeRfIsOYYty
         PL5g==
X-Forwarded-Encrypted: i=1; AJvYcCUoL2p7Gz7jvwYP/VCOVMYfAepXFq0G6OOqR4hlWEZJjWR7gTttnu7MUxYjIiuvFnGren0=@kernel.org, AJvYcCUyCeDVceO1j7oqOvbcdfraZOtEWCvVAy6R6777/nUZTYGCW6fFZhnSNnqH7JE5+rpzPPAeuvLr1SQ=@kernel.org
X-Gm-Message-State: AOJu0YyxUmHY6n91Y1M895M5+5ibUCkbFuxZQ2y4PJZKBXaO2JOqhbSF
	/WP1AdET4gSlQCbEF73sOvAerTOUvDqpu05OPiUtGYbKZY5bCv/LngZTBh5NsTq/
X-Gm-Gg: ASbGncvJjSmNNgQgO9dnfcY8gjLAxHxM2wMvpXzA9yIK/xyaOwv46IE10Zigb9rkkeE
	i73V53lOA/lIM0TYRnRNKkDI8NCFHX9SdIkUdhhfUCiTNSAoLGlwyfsVbK9bAmFoa7+fbWJ1MVY
	vgIYdvXcZgv+hMU1ENpWN+zmTCqXiHYOonwxcK1mVQvb6oJmXUIt9CFyE5W3ydvHOkTLzzPgZIf
	xou0qlG8dxk5xXw/w7HOS0QACC/3qpV99taA6Cdmkl1WklzKfRSkE8GGoyn7IJkBf+rkhvffp7o
	8plkjulP3m+QhOa1IGEbEdCrJ9P3NXwM7ogzIDQSGs2TW6+SqHBN5azlQxu1emWY0STEu5kZC9C
	5HJtSeJprmhLCLz4UFmIsxEhBoCZDxC2UiwSmSOQozkA=
X-Google-Smtp-Source: AGHT+IHCKulS5BdqLp8mRSWpksw+q+splIe3zzH4/ipKfWgAt9xTzPA2rbkbMvF0CbSu69Kz/T0M0g==
X-Received: by 2002:a17:903:1207:b0:240:5549:708e with SMTP id d9443c01a7336-2462ef942bdmr209447475ad.46.1756266944779;
        Tue, 26 Aug 2025 20:55:44 -0700 (PDT)
Received: from dragon (23.106.129.234.16clouds.com. [23.106.129.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2489b6a7633sm4970755ad.85.2025.08.26.20.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 20:55:44 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:55:39 +0800
From: Shawn Guo <shawn.gsc@gmail.com>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.17
Message-ID: <aK6BuzIYwUBRU1GW@dragon>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.17

for you to fetch changes up to 37e5caa5571b5a60b0c835a0bc09ab1e53f57bfe:

  arm64: dts: imx95: Fix JPEG encoder node assigned clock (2025-08-22 17:45:30 +0800)

----------------------------------------------------------------
i.MX fixes for 6.17:

- Correct FlexCAN PHY settings on imx95-19x19-evk board (Haibo Chen)
- Add missing microSD slot supplies for DH electronics i.MX8M Plus
  boards (Marek Vasut)
- Fix assigned clocks for JPEG encoder node on i.MX95 (Marek Vasut)
- A couple of regulator setting fixes for imx8mp-tqma8mpql
  board (Markus Niebel)

----------------------------------------------------------------
Haibo Chen (1):
      arm64: dts: imx95-19x19-evk: correct the phy setting for flexcan1/2

Marek Vasut (3):
      arm64: dts: imx8mp: Fix missing microSD slot vqmmc on DH electronics i.MX8M Plus DHCOM
      arm64: dts: imx8mp: Fix missing microSD slot vqmmc on Data Modul i.MX8M Plus eDM SBC
      arm64: dts: imx95: Fix JPEG encoder node assigned clock

Markus Niebel (2):
      arm64: dts: imx8mp-tqma8mpql: fix LDO5 power off
      arm64: dts: imx8mp-tqma8mpql: remove virtual 3.3V regulator

 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts    |  1 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |  1 +
 .../freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts   | 13 ++++-----
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    | 13 ++++-----
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi | 31 +++++++++++++++-------
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  | 10 +++----
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  2 +-
 7 files changed, 44 insertions(+), 27 deletions(-)
