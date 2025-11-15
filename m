Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B15D1FF7C7
	for <soc@lists.linux.dev>; Sat, 15 Nov 2025 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197266; cv=none; b=cUjLNA7jEOaULXAFzP5tJilgeWgA8UQFz+Wo1wvKfqT2I4Zo1lzYJUFOl66B5lIFywLxmzbOyHjJgE0yVVNLXivJWHSbSi7p1v4HG8PAnfFR+Yh8UpVx0WnhUh3frskol0G0N4X8xtBHZmElyxHmEOvJK59f75ugCxGsf5KsRGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197266; c=relaxed/simple;
	bh=vu7pUM0IdDTF+L7kgMryB8EWa5oji4ICNd2+NfLgJxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fyWR++3CwU2dc/uyYyQ0sgleu4PjYIButm2pbP+uXnyEMMKB24QUHOySE4hHolfTg7Bdnv3PKFLDWIxqK/chNRXTMCmBCvSn2sEwDhlXkxGHL3Cn8AeKcA3JS0kRec8N1sWPDiDKo0enf/G+x56AOzzkSM71MoyDwmzUmSHPPP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiV54lIr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiV54lIr"
Received: by smtp.kernel.org (Postfix)
	id 16F59C4CEF8; Sat, 15 Nov 2025 09:01:06 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D00FBC2BC9E
	for <soc@kernel.org>; Sat, 15 Nov 2025 09:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D00FBC2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477770019e4so32230765e9.3
        for <soc@kernel.org>; Sat, 15 Nov 2025 01:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197263; x=1763802063; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NmPq2vIfN4PvbOp0GMu+PlVPyVQhuun4x+h09lqtVM=;
        b=CiV54lIryCAH9frBp0mM9P/QfgwYzkcZuoppksjtUwZE0PDqGnWZqAUQVAP0PNSIS/
         KPKTCrNdV+XRU8oc0b8kPYbrd8qdB11ZxwqDQkElFBXKurNhVrY5sNUXBIS6JAM9qmwI
         ch8e0z1mXhiZCReBgQeM7QfenWtIIwluDWh99rhcEZG9zObh1q4zsNG8MJguW0VGXBXW
         TSRVCHGnLJVpH8I4aHI2WRqS6xpyp6P8eVkusejmNvJ0RVz9yzWlIOcNp5X9cVBZSo7f
         WOyFo9G1QNdDaXHvHhoOc2QYodPrVxQEEfRwku2WxLeAEz8Q3v9MisvDykmzMWrP/75E
         KJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197263; x=1763802063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6NmPq2vIfN4PvbOp0GMu+PlVPyVQhuun4x+h09lqtVM=;
        b=o/sY4jl5780OroIZ2bn9OVLT3OP0MBCZKst7t45BVH5IOktAKrkhs6FvTV2Uje0m1y
         H3mCGD/JEmtLU+iUpOTDj1OT3uPfwdv3+wWBaInwhaCqWMT1WprUC5ZtNPyR4hZ+gRH7
         szXVzdIqXORKF6ol/jqAZcv+RRUKM3tZDZwYDnLNuQK7g5RhPO8kmyuRY6Hp3Q2NPF4U
         0SuTTOqH7HLytyDlrFDjK9zUzfyS8F0Qy72yHFnipeOPHLfS1hilHquftCdIjrN+O2uf
         kRzyWaliuZ34XLvQeI6H6S2W+NP30j2uEvmU50kZQyIS9w2pH5CyR+NJI9Ely+UBoblE
         igfA==
X-Forwarded-Encrypted: i=1; AJvYcCXSxuXUKqOuJrKYiDu/avpQk+172sZ4E0K1/W4lFM8CHYumiVvOxpcdWtoDImhO0S1JfKg=@kernel.org
X-Gm-Message-State: AOJu0YxBeZshtOwyIrkbIaQfsMG/2giMIxLext6s6pNn7GPqdsxjlK8p
	+JctHoe9BeS3Wnd5Todbl1cNQqWqZf2eiMXipVZ38ef5Hm+AHfKE4DPO
X-Gm-Gg: ASbGnctTm/b6eUB5GoWBEKlejPAkW89Jb8+ps3WIcgE4d8RD6pQz9pT/yDbUBakvQAM
	z9fuKJRtTGFJDakvU//q7wbUN1vwVRr8Yl39GiuGRXPJRmoeWWhl2Jlsfvrmn7YZPiQRPkFCiwF
	66rqOlSDk1+3j9ZNiWDjK95jmoZVypMLjvmm8wVXjyopUdcYOOuO7on1R2eBi6KKVRmoyDkU0g5
	cbTonsarc2mA5/YpQ09Kjhfz+pCPaloGyk4GgYCsmjBKJDJMGAqvlwHDSTe2BQUmZmksK9rq1O0
	raHT3xHksIZunw2Sn1JzpnZf7OVnCcZtL1g+9hbQzv+fklYx36a8+X+2b/yDQo8OGfuyi/3JNAz
	8R2ltHpOb40dKZV7qQdG2cCWbiiGwQ+So5siv+hJmRBRwQ2vsyItT5CqDSBVAbw/BVPr/IEv0yu
	AGNScf0D0Ya317MRpJMufZjr0B9SVxYNzbQCkJGkA3KmiZ1AIlB/fvMDdElAMkXWBgMnKNLV80r
	o8lZ90=
X-Google-Smtp-Source: AGHT+IHYtVjjbV83ei1n6TC4jPxlxk2Cr9Io5XeSyAGj/Ci1P0LZPNejeCahGUTN0PRdBl+3ZD2IMA==
X-Received: by 2002:a05:600c:3546:b0:477:1326:7b4b with SMTP id 5b1f17b1804b1-4778fe7973amr54525965e9.19.1763197262830;
        Sat, 15 Nov 2025 01:01:02 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6acsm200553165e9.9.2025.11.15.01.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:01:01 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/8] arm64: tegra: Device tree changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:42 +0100
Message-ID: <20251115090044.3140331-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit ccec1069246ad121c1cbb6494d75140d512a9b5b:

  dt-bindings: arm: tegra: Document Jetson Nano Devkits (2025-10-30 20:29:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-arm64-dt

for you to fetch changes up to 0936fa80150ef9121c6a4340fa2369bc9f16a520:

  arm64: tegra: Remove OTG ID GPIO from Jetson TX2 NX (2025-11-14 22:55:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.19-rc1

This contains a bunch of additions and improvements for older devices.
Tegra210 devices now have empty reserved-memory nodes to improve inter-
operability with certain bootloaders. These chips now also support more
multimedia engines. A new variant of the Jetson Nano is also added.

Jetson TX2 sees some improvements. PCI endpoint mode is improved for
Tegra234 so that reset interrupts are properly routed.

A new RTC device is added starting with Orin.

Rounding things off is a flurry of small fixes for DT validation and USB
OTG mode.

----------------------------------------------------------------
Aaron Kling (10):
      arm64: tegra: Add Tegra186 pin controllers
      arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
      arm64: tegra: Add ACTMON on Tegra210
      arm64: tegra: Add interconnect properties for Tegra210
      arm64: tegra: Add OPP tables on Tegra210
      arm64: tegra: Enable NVDEC and NVENC on Tegra210
      arm64: tegra: Add reserved-memory node for P3450
      arm64: tegra: Add reserved-memory node for P2180
      arm64: tegra: Set USB Micro-B port to OTG mode on P3450
      arm64: tegra: Remove OTG ID GPIO from Jetson TX2 NX

Diogo Ivo (2):
      arm64: tegra: Add Tegra210 NVJPG power-domain node
      arm64: tegra: Add NVJPG node for Tegra210 platforms

Haotien Hsu (1):
      arm64: tegra: Add interrupts for Tegra234 USB wake events

Krzysztof Kozlowski (4):
      arm64: tegra: Add default GIC address cells on Tegra132
      arm64: tegra: Add default GIC address cells on Tegra186
      arm64: tegra: Add default GIC address cells on Tegra194
      arm64: tegra: Add default GIC address cells on Tegra210

Niklas Cassel (1):
      arm64: tegra: Add pinctrl definitions for pcie-ep nodes

Nino Zhang (1):
      arm64: tegra: Fix APB DMA controller node name

Russell King (Oracle) (1):
      arm64: tegra: Mark Jetson Xavier NX's PHY as a wakeup source

Shubhi Garg (1):
      arm64: tegra: Add device-tree node for NVVRS RTC

Svyatoslav Ryhel (2):
      arm64: tegra: Drop redundant clock and reset names from TSEC node
      arm64: tegra: Move avdd-dsi-csi-supply into CSI node

Thierry Reding (2):
      Merge branch 'for-6.19/dt-bindings' into for-6.19/arm64/dt
      arm64: tegra: Move HDA into the correct bus

sheetal (1):
      arm64: tegra: Add Tegra264 audio support

 arch/arm64/boot/dts/nvidia/Makefile                |    2 +
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |    3 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |    1 -
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   13 +
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |    1 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |    1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |    6 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |    4 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   12 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts |   59 +
 .../boot/dts/nvidia/tegra210-peripherals-opp.dtsi  |  135 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   90 +-
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     |   11 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |   15 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   72 +-
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |  108 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 3190 ++++++++++++++++++++
 17 files changed, 3708 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-peripherals-opp.dtsi
