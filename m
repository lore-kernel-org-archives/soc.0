Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9475719A
	for <soc@lists.linux.dev>; Thu, 24 Jul 2025 06:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753336930; cv=none; b=Xh7J/ekfRdmq68AyJlbKB/stT5ITZ8J9NOAvKJ21xkbNS6QE8BzeLFjktNqBPnqZquWw0TZD6c3vM9tTXHmHgQqIoLaYVyWArFVgYT2/QDcOXDGxoDVBqWKaR9ZXe0e60jGik0PrDkQCjyfsNBTtkV1BTC05d+3qekvfOHSyDTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753336930; c=relaxed/simple;
	bh=LhryfFJ9dvApZxfQJIe8VWX1eu+JA20rxCddQlLHJvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C4NkQ8ZXy/rAIqMvRnIaECaMoitv78jww1FoqfH/RIZ902Mq6nUBUJTFPe83gc/7RsbMjWpZsICKcg9h8RnMQV5knkctpONA7KcaTbcwHtfB59qFvT3ELcON341crz3tbuRMDkkBeGHwGdWBoxAsn6Hj3D+tqhggN9RzVnjd9+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6xBEcdj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6xBEcdj"
Received: by smtp.kernel.org (Postfix)
	id 399A9C4CEF1; Thu, 24 Jul 2025 06:02:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52A75C4CEED;
	Thu, 24 Jul 2025 06:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52A75C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so5755515e9.1;
        Wed, 23 Jul 2025 23:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753336926; x=1753941726; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md7ezImaC8aEPMY35qFAjPwWsP8CSm3ceVQj6sefxsg=;
        b=e6xBEcdjA0bbp5JAugzWbFzca/BPkKL268tVZlefG7hwYsR5DPGBd3iP5WzWI2eosi
         jHLAZ5KtxBjMemiwmzui7eZPXVEjZucHxalr2AlY4tynpvs7PpUN18yBk9hrv2HE8UCj
         juYwIW0dv/MYWuDkgulwjxb0yn7unk+I+kMdXl3CUtmYOSTnK2m4Jpfkast9ZXc8RXCz
         lgjo1EamwfkXBRE7nAGd9WC3KBeTo6Q4fSrahpLJR5cGuFzTlVi0SrZayNw/vO2FC29M
         HoDjFwttmh4aoAu0LyQTM8z9S399i+WBLE6opyAisuD2q5Kys6OM5TdWyZpjhG6EFcHb
         9W2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753336926; x=1753941726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=md7ezImaC8aEPMY35qFAjPwWsP8CSm3ceVQj6sefxsg=;
        b=FxPzZJHf6TIA1dhidpbwYfBOqDrMUE+VbGsp5+LN1TrXJjtxfExs2dkcauC7z79Rls
         4T2wTQuESD0a7pQqhdktMpw3Y1jvuhqejE0bMVOgm2YTYSGT0u7xKHi1uTSJZlUtPXHJ
         vnyygKG+Xw9R/01yw2dzcD7Cx6Jfy1JY6LUcZ8MqEWRgiO/TW/lODpi3/RIjaRCSGhyI
         nJ719vKDMFinXKnDxvM/MlK6IkvcmUtQ+KT67x5DdvQ/CBdeyKXgxcBn2B/sIJhAgmcr
         yqI6NHvQRV6V5Y+dtaMzuuCjOyWMkZ29Mad3gVWGN9ydFc64IjTednJmyHlZbttdB/ub
         jzoA==
X-Forwarded-Encrypted: i=1; AJvYcCVxFGbT++AjU8Qdn9HZF8F6LRBIGgZaRqiCNUvg2Qv/CVlPt9g32YcsOgBrmLGu3NXuiLI=@kernel.org
X-Gm-Message-State: AOJu0YwVyIjmYe9GifOJi19BuZfCWGEu+hsK+aFP0LnD6nYu4V6jO0ad
	B+ELX08GQt6itE1hRCAwWvt8QeCd5JbmnADppc2OV6pC0nRtNrPhLWfEHCfKhw==
X-Gm-Gg: ASbGnctjfWb+qNJYX/Y7e+IfTWeFIECsGSTByDwewc/lO1KTYTSDb9xr+ezgtpXKbLg
	r2epk2Wmg0jhWeAfDdEB958BAW8MsQsK/zndLHo6ZDLPgOlhZ0yqdOEr0seclMSkDwRaOsEwX5A
	pLPg3TVfPb/NT0s+Xd2DX4gDl3ItZSF/J56HmDGJYHPpeh9f9914LFARV2OAb4WJEOjQ90Oa50U
	VtmM+qpdDKGSSBActO3PvHPP2/0MgWuTBknTvqTeeeVA3Qd0/Qtl+0JVBdctuzGxfgOUVrSHAEn
	w+hcWg2qDoS8b/UPT38r1eAjcevJsIuu7ve44nSn7Uz1AZqPKpFSbewsRU0rcEeBfJOKhkkc9la
	I6QjC1LsLbGxqqaCwJWsHVavKqkoHeTZdNcQq45YTKGZDr6BqDaGnSDhURZBeJpio0YqIMAH1dB
	IOZm6TcYM4YgiSTA==
X-Google-Smtp-Source: AGHT+IEk5vZ1UKWFwNAblqDfd6t+N0Mkjayt6bORHiyfg+et25uqHOWyD2FkHhqLkZP7Mco8q9JdgQ==
X-Received: by 2002:a05:6000:1ac6:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3b768f1e40cmr4157399f8f.36.1753336925465;
        Wed, 23 Jul 2025 23:02:05 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b76fcad0f1sm1046656f8f.41.2025.07.23.23.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 23:02:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] arm64: tegra: Changes for v6.17-rc1
Date: Thu, 24 Jul 2025 08:02:02 +0200
Message-ID: <20250724060202.2942616-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-7-thierry.reding@gmail.com>
References: <20250711220943.2389322-7-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm64-dt-v2

for you to fetch changes up to 5897c161dc59e8d5237917406ac4be2d88e942bf:

  arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-24 07:53:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v6.17-rc1

Add support for the Tegra264 SoC and the corresponding engineering
reference hardware (P3971-0089+P3834-0008).

----------------------------------------------------------------
Sumit Gupta (1):
      dt-bindings: memory: tegra: Add Tegra264 support

Thierry Reding (13):
      dt-bindings: tegra: pmc: Add Tegra264 compatible
      dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
      dt-bindings: mailbox: tegra-hsp: Properly sort compatible string list
      dt-bindings: firmware: Document Tegra264 BPMP
      dt-bindings: misc: Document Tegra264 APBMISC compatible
      dt-bindings: dma: Add Tegra264 compatible string
      dt-bindings: rtc: tegra: Document Tegra264 RTC
      dt-bindings: tegra: Document P3971-0089+P3834-0008 Platform
      dt-bindings: Add Tegra264 clock and reset definitions
      Merge branch 'for-6.17/dt-bindings' into for-6.17/arm64/dt
      arm64: tegra: Add Tegra264 support
      arm64: tegra: Add memory controller on Tegra264
      arm64: tegra: Add p3971-0089+p3834-0008 support

 Documentation/devicetree/bindings/arm/tegra.yaml   |   5 +
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |   1 +
 .../bindings/dma/nvidia,tegra186-gpc-dma.yaml      |   1 +
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    |   1 +
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml      |  28 +-
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 +++-
 .../bindings/misc/nvidia,tegra186-misc.yaml        |   1 +
 .../bindings/rtc/nvidia,tegra20-rtc.yaml           |   1 +
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 .../arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi |   7 +
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |  30 ++
 .../dts/nvidia/tegra264-p3971-0089+p3834-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi |   3 +
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 412 ++++++++++++++++++
 include/dt-bindings/clock/nvidia,tegra264.h        | 466 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 ++++++
 include/dt-bindings/reset/nvidia,tegra264.h        |  92 ++++
 19 files changed, 1293 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
 create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h
