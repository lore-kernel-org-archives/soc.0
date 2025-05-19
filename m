Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E14726C389
	for <soc@lists.linux.dev>; Mon, 19 May 2025 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645359; cv=none; b=YNaWuj6t4Hnxl30Zx8ZOXdQs4l/rpNuIZGYEj6T+xv2IpTIjE7hRTiZy8fYU4lqQKDHuVpm63/+buoDUxu2adsITKP13qu8TL4/QIH2iwh8dFPnFW6IH9IN6wjQ7JNXtc2c3QqzCIrjjR5lV383T81ub9kb8v2xdUDVIOtwgST4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645359; c=relaxed/simple;
	bh=BHf21RJUNdhCkiiThmZjyyx2G37Br3ZOXjcLDwCY5JE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qtgdZiYOwdGsC3ZNt5ZP1Zl13SlZ7Fh4fyKvHv3Ui+lwlW5sfKv/JgP3nbK1Dk4nuZRQoH0txTOXSe0IlzAcBu+bVuzar5DAoVEjHqBpjSBi9P/cp3b1A1jrgu0S+6YeTl3WXteqCJNXWnTJ7wjT+vqNFZOPf+W1OYB3N1AseW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y6jQO6GD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y6jQO6GD"
Received: by smtp.kernel.org (Postfix)
	id DBC5BC4CEF6; Mon, 19 May 2025 09:02:38 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6308C4CEED
	for <soc@kernel.org>; Mon, 19 May 2025 09:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6308C4CEED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso27142035e9.3
        for <soc@kernel.org>; Mon, 19 May 2025 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747645356; x=1748250156; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZv7t8lDV0iXHfFqBM3llVIlQFfOfljI9UC5k/uzgbw=;
        b=Y6jQO6GDDWwkoGMaA4PJRgJOOeXCHYNgST100uqBkfA2JEd3PBnRzFL1Qj4mudPQNr
         62daZGtOpJTzVHcFyrEBfFLhoEQDxjmoRv8GXLBPyljGRIctz0KQLgYjZzEFWCMBuFvY
         GAP7tyQe+0Tef92aZkCqo0TTexraGBG+M151LUEstrhG2aR1AHHrWkHijCCC+qbPNVEP
         G4/psAL/G+KTwB1E9GzUvb2yC48kQh11wUU/5OlPxXEzBU6Vn6H1ZZfWe9G7Mv6Gm7P2
         7fzWmwSl85IGbmtJ0+YRkrwFiSLqNRgxsWa+Rp6YrXBC5SbZNQXf6COjioA7giV8/k/g
         QOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747645356; x=1748250156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZv7t8lDV0iXHfFqBM3llVIlQFfOfljI9UC5k/uzgbw=;
        b=WM9NI5i14eFr47Z8Hat9QEJXsr9oxmyrFtvDht3lH5cXoMnAFxr5w+2NIqTurTzyj7
         FAEROQ5nZp9tuBHGmNVb8cW9ueQl+oNpNr+6o83P8qkIbMoLwbe1Rg//WSU+nLn92Q9b
         mRhoj8lTczX937YjLw3gtSdRJa4BXp/oWzpgF4nlnfxm/lo6331od+dasJib49hZRAjB
         j9jrbhdBwwtXS8AP1lXiUAFwfzTLgJjWuB512z8/7lzb8EtEDIY3XGFc/YU0YDHfO+TV
         YrPAVdcsVBcTxszQkBQtfa+k4bNepvqMz8XQ48CgIn6+2RWSBMv5TJGO3iXL526OQRnN
         wS2A==
X-Forwarded-Encrypted: i=1; AJvYcCVSJ0p+gnn5xPvW1kI8JRVNaOYwZiv2a/7zEGlj41LIjOn3gWLMOa1+HKFAYnCiaGlLxNs=@kernel.org
X-Gm-Message-State: AOJu0Ywfcg/5dt+oXHyM7DA0PLANwQug0mt0TJVlVMPXMKJMLOJrpI+i
	prmuAxA/wu/7ijJwrT9NQjK+oY08pjhUOh6y5yokBgQ7Lex49CjA2GV2WZz5dCIs1eA=
X-Gm-Gg: ASbGnct6wuM/K32plF7M9TbbLvlcovLKZjlX8Ds6u3EkcruI+Kfd6jwqV5ZFU2IR4X2
	3afVMh1zmZLQRyT8jqFBQ2qH1mfAahc70Jd0l83rDn0lOgKXN0zj+OOuM591pZv4ArIk2qa+1Ix
	w2WXEd8mKqsDGemj/00vbIxHMCM8baZJW+uY6395DpfR8Mu+0bWYFgn43oLM8T/EpvhNHFi7IYw
	V0GNAsZcr2kzi0iZvo2Di6TUcfUyCFvHoimTbB6YXjEG4cM1T8kB+Bs/jFZ+e7d3n5cdsmSUeS0
	/Vmq3/UU/id11OKW10rOyf5Zc2z/D7qDYHcqipe9QFa0oXSsXjc=
X-Google-Smtp-Source: AGHT+IFoYsaKW2NEe2NClmKIGXOT1IxL6UwFv/4s+ZsDYhRJPYQuPfae+I/E+1pAu02D6qEp1lVAtQ==
X-Received: by 2002:a05:600c:3114:b0:442:d9f2:ded8 with SMTP id 5b1f17b1804b1-442fd6444c4mr126185075e9.15.1747645355859;
        Mon, 19 May 2025 02:02:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fc90:23dd:2853:309])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a360b0b766sm11640130f8f.56.2025.05.19.02.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:02:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: arm@kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] ARM: davinci updates for v6.16-rc1
Date: Mon, 19 May 2025 11:02:32 +0200
Message-ID: <20250519090232.13147-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Arnd,

Sorry for the late PR but it completely fell out of my mind during Connect
last week. I hope this can still make v6.16-rc1.

There are only two commits here, one is a tiny DTS update and the second
removes da830 support. This has been in next for many weeks without any
issues reported.

Thanks,
Bartosz

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git davinci-updates-for-v6.16-rc1

for you to fetch changes up to 55da73fa7a68ccbe23c94ecc070d2ee0013f4fbd:

  ARM: dts: davinci: da850-evm: Increase fifo threshold (2025-05-14 17:37:54 +0200)

----------------------------------------------------------------
TI DaVinci updates for v6.16-rc1

- remove support for the da830 SoC
- increase the panel FIFO threshold in da850-evm

----------------------------------------------------------------
Adam Ford (1):
      ARM: dts: davinci: da850-evm: Increase fifo threshold

Bartosz Golaszewski (1):
      ARM: davinci: remove support for da830

 arch/arm/boot/dts/ti/davinci/da850-evm.dts |   2 +-
 arch/arm/configs/davinci_all_defconfig     |   1 -
 arch/arm/configs/multi_v5_defconfig        |   1 -
 arch/arm/mach-davinci/Kconfig              |   7 -
 arch/arm/mach-davinci/Makefile             |   1 -
 arch/arm/mach-davinci/cputype.h            |   1 -
 arch/arm/mach-davinci/da830.c              | 506 -----------------------------
 arch/arm/mach-davinci/da850.c              |   1 -
 arch/arm/mach-davinci/da8xx.h              |   2 -
 arch/arm/mach-davinci/devices-da8xx.c      |   1 -
 arch/arm/mach-davinci/irqs.h               |  27 --
 arch/arm/mach-davinci/mux.h                | 404 -----------------------
 arch/arm/mach-davinci/psc.h                |   3 -
 13 files changed, 1 insertion(+), 956 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/da830.c
