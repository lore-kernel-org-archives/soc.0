Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95A221DB0
	for <soc@lists.linux.dev>; Thu,  9 Jan 2025 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736441003; cv=none; b=DwP7EEwpYmVffI8rFr2xYQWcUdfe59r2nmNpLrUQIdjwArYBTLOfLZx0QXycKg96DDcHPoqmSa8lXJt+k3SnVFqck5UmHnC72epK9YJ08LTBKQou4wfxzHbKVeP5K3XlEpOVt8aaezDNx5MQNldQU/nLOLbv7B7QM9Kdym98Ntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736441003; c=relaxed/simple;
	bh=YYIPhDwhkzf7f2wL+ldfz6gsQ6sa1+rXEkKe7oyhXk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PQb2agufdWPhut7nCYpyv2CopRiXsn7nXggpVuGXGIIgEL1dFIkMd8OU03zHNBOsYEaYvsitgg2bkUC3Ig0nIbaIIi0C2q65SKpeMplAQFfseYHpAPyn+1/Bkbr225nD7kTq0/N20xlgEUSnpX1WvOSNrmhwyfExjCtefN1b0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iKRSRh0a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iKRSRh0a"
Received: by smtp.kernel.org (Postfix)
	id 044B8C4CED6; Thu,  9 Jan 2025 16:43:23 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A9A2C4CED3
	for <soc@kernel.org>; Thu,  9 Jan 2025 16:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A9A2C4CED3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso7690945e9.1
        for <soc@kernel.org>; Thu, 09 Jan 2025 08:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736441000; x=1737045800; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCzlM1/MRYOnXUBxtxLB5X+lQ8sEazn9TCshtJwYmzw=;
        b=iKRSRh0aXZ9nOHiIQxsVtUxyLQEE93t/oSqJRI1YqFeDqsXjn8U73pFV6Ug73ilp3d
         kzDMZAvaKX1fgpuJqN/IndkeRbtkolsI9VotAlLf6G7niIP1r/FvQebVYNl8GBta8ObT
         h0hGB59TihQwCW7HsgDm0XjnQvNGD15V+gvKcvWBfUvoN0JlJaQCQkhVudhODRz/kjTx
         lAUi4yIHsMPGX49XD/TOGnpjWikIVQjyAACzAZrJZ8qcSYx94pTKrPB2LF9RPRtBLqnd
         0CODeTXf+3rnTna5Caj6nNuvAfWFuXFCaiARUN2MOpYP1QyUgykUl+EuGH9VJPLsCu2r
         ORbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736441000; x=1737045800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCzlM1/MRYOnXUBxtxLB5X+lQ8sEazn9TCshtJwYmzw=;
        b=o1ghfjoEDOzt5BwYYVyniUj7u3x9C7GOZ55zJwApyAMtjS5g4LrVLox7nyL5ro6yWf
         VG+HIVAplBsKkr8Nh7gPbmLF5R6nBtu1PQ9sBUp5QU1h2Mi1BMPC7WxqIUpwmMb/4vCr
         8b4ZVRhpY8BQ/ELPv2vXmCStxq9NNQJkfvzWcp0lQkKNtfkJiAMaNcxONJIWqnuVBSYw
         JakZ3VdaqMkLFc6gFZsCKjhMnlsX8d801q0eKnpnhT6wlFHmceabNVQOGcqcFBXHMQGB
         KK6J2UV0OzNCjMc+vsKlHWUUr+UVjApwswftAG97XXaRXSIrSDFeOL+F3Lud1VDGOmSZ
         bmvA==
X-Forwarded-Encrypted: i=1; AJvYcCUqdLICxAu9Kt6gNtjwzJIrSHH1TVNQEFDdzM9l+3EErfOxc4H3ZA6/K1bIiNgPHfEjezQ=@kernel.org
X-Gm-Message-State: AOJu0YzeneahS6EaRt5GnHkGz0bqppWWzYFp501r6apDyEm8FZjZ0XkK
	VHvf/ark2QyHs5R9xI28Lp5NsKgXEEdM79+Tg2A4KxHETXtPfQ4/zg34H/6hSgc=
X-Gm-Gg: ASbGncvP5xTjPxqkbWRii3Onwqss2IwNYJqVWTGbZfjInXoMdhTZIquQLJ7fxVDGTmQ
	kqkIdD6sB24J3FW//3mev9PC0w04pJW0Tg9Slw4cOBuJWIHmTfi36Jov30eSeseqytKXvo5MWHZ
	BEfmG37JtUeIYMUJIgAY+F4yHDkG+ctxfdB0kFNNCPD9foQJ79g+7lRBo3KTBvEJ41TIFmkQ2bP
	nUuFAs9uIaKjNWurU0+VshQsOdQS5B7gS9FfAqThhMJFM9iiBX1N/BTR30u/gmmG1xFAFP8YewF
X-Google-Smtp-Source: AGHT+IEzTXpL9pdnnpR/+maWdfP82meXFE/tOCCdhuo/77CiHQMuf48t9q/8wrNTkZPnWgaVGecDFw==
X-Received: by 2002:a05:600c:3d0c:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-436e9c9c052mr25002665e9.0.1736440999589;
        Thu, 09 Jan 2025 08:43:19 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e03f62sm25893365e9.22.2025.01.09.08.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 08:43:19 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	Ryan.Wanner@microchip.com
Subject: [GIT PULL] Microchip AT91 DT updates fo v6.14 #2
Date: Thu,  9 Jan 2025 18:43:17 +0200
Message-ID: <20250109164317.1154613-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f72aada7bee42c4b43a272ef58bc4c9e1caa53d4:

  ARM: dts: microchip: sam9x7: Add address/size to spi-controller nodes (2025-01-02 12:33:57 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.14-2

for you to fetch changes up to deaa14ab6b0610d052597c3f6114c3d9f0dc4c6c:

  ARM: dts: microchip: add support for sama7d65_curiosity board (2025-01-07 19:33:17 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.14 #2

This update includes:
- device tree files for the SAMA7D65 SoC and its evaluation board

----------------------------------------------------------------
Romain Sioen (1):
      ARM: dts: microchip: add support for sama7d65_curiosity board

Ryan Wanner (1):
      ARM: dts: microchip: add sama7d65 SoC DT

 arch/arm/boot/dts/microchip/Makefile               |   3 +
 .../boot/dts/microchip/at91-sama7d65_curiosity.dts |  89 +++++++++++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi          | 144 +++++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
 create mode 100644 arch/arm/boot/dts/microchip/sama7d65.dtsi
