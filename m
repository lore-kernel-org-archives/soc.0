Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA8F149C6F
	for <soc@lists.linux.dev>; Tue, 27 Jan 2026 07:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769498173; cv=none; b=gBLcwag5ffZd5WwIz1bOUx3g4JoYdCLFMoP/pZwim2dnlctEtG2Pm6E3KOfGrbSos0mFEtd79net6NBWWAf7foP3zGiGoy/087MvucHv0h8Q8JdSYngfXksLl5zePctdVsEUuxekLtwaLNk+dHDnGtd3fThzUj2YUooklmivtz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769498173; c=relaxed/simple;
	bh=02e7n3+lctEJi09SAlNrz4VUwCcgYNB/BqGIhi/reAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AwHA2acKKok0DwGPAe4/XA9f3x4rbN6kznLXBdvkbQA0N1u1h6YbqbD4IM6tZuvPjKSYVnRfrnQ9/mypy6CrKBFDtWD37KkFbIA/sHlbHT3y7jUYYleWntfg7ykZAPpe1uSeMcpCyMqzUi/0KjjGx6hl/3buEyodzkNtKyHCJsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZ3c1toV; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZ3c1toV"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a79ded11a2so32902165ad.3
        for <soc@lists.linux.dev>; Mon, 26 Jan 2026 23:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769498171; x=1770102971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ecu5YJerF7ppjEFjoeyqLO82/b5nn1WtdkAH1BLTIA0=;
        b=BZ3c1toVbtxiGQ8VoI4zHAMf7WZW5dlVIHy7S9/V64sqYN7t6m5gK9dChVYgzLMxc2
         cqTR2ovJ5rTYgA+hP2yKHgv2aN8n9Ln0EzPyrwxQ1jdJzcKKgFQwH46zuN7FirdWr67Z
         I8tGbtvENOaqpCsHXhXBien9AGH1RU8Tts9dRMdLiTnGDHkFOp3Tporq19nGKgUZWuev
         g58WlGvIIFYu9Zha+6An7GFIF/uAgJA+/IIpC19y6jPb0mcCU3XGtfLU8LOFP9nEwyae
         WQP7JZtrBcAat8guwI9fjLciG15pp2OM9+XkZkU0n1z0aHh93+F0nIC80Kcruz5ufhNU
         lT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498171; x=1770102971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecu5YJerF7ppjEFjoeyqLO82/b5nn1WtdkAH1BLTIA0=;
        b=HUJzdfS+gL9RSzOk20srg/t+6xCK+KV9PNqq1/C3HpyMT8DNwqit2v8e3U97JRwvAD
         QSULBLPCij/RtP4Vye0yVjIdO0+mmse9Jwn5b//e6LId6FQNRBOaIzmnzb1gdZhD5oSP
         WVOkuDFBym+EHdTUUed61nvj6nXDoNkFH3fTam0VSqzr2j8NjWimlIBPPQhIXf5l4RYW
         I6lM1FFxOaV3lFSS63hDOu3l8wjxGURGOeUn+52F/AH25a3eeGE2nwCTEl5CH/3Ow9aw
         yDZbU0OfIY9vOH6zT40LK1dcVQ2XupM4K3+tnbxh6Zmr++HZ0BBbySN7aJLk+/moy1ip
         RGzA==
X-Forwarded-Encrypted: i=1; AJvYcCWjsnSR0G+XqouTU9Qq/qmV87VhCB2ZsMXzkq3lEIPls5yj0vVVtVVoQLdD1SV3Ge3K2zE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRMckOn23u+WI7/g5KJkkRzGZM6u3GAqK0sxzdOwNmzZqrZX4X
	SX0mKyMkaAkNuYd7xwBfaVMuvIL72VUCHsaJj13jb+JXxRdb8VggEo4l
X-Gm-Gg: AZuq6aL98iJ3J1pWz5TiL1wTbZRtbCw0gwTxsehUPA5eaC4Y2l2GMJGQM5Fl7cpxyM5
	I0BhpeCQvRx+z0z53brDh/CuDx2wr+ra8G22SnX9Bi9vIGXXE79PU8l4CmPSmGxe+3KBK0mIEbX
	mWqR7ylYFDNI9ddMZ4o9bV0MLdImQtVFs9dc58QhAnr6SSX1G9wyps0y4UwaEWtPO7AA5TWLVui
	a3ouq3KrOXvUDyOaF68thHJpD7FjwauqPbLasYSXGlTjUUeV+VkIAMkw96IW2d3I24798a/u9f3
	o6g4e0WFGBKDgfkAw3xS28pKaFfaQwwBjP0ShZFS2lWt6tmDZE+2XLCbIHfR30jRXvjy/+DV5Y2
	5SFbERss+an4ICPmxNg1uP5ueTILGE/c+TNhuqI3elbLcT6qmPoYYPOrCztRFWxyBChFBOnuhHD
	dRlN9NQFd+bpAs3gHBa0lWFQ6hvEg7bS+Y+WchxZQJjy9bfINN
X-Received: by 2002:a17:903:3545:b0:297:c048:fb60 with SMTP id d9443c01a7336-2a870d5d5e3mr7523855ad.25.1769498170464;
        Mon, 26 Jan 2026 23:16:10 -0800 (PST)
Received: from cn1dhc-k02 (125-227-180-151.hinet-ip.hinet.net. [125.227.180.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fb063esm106160505ad.85.2026.01.26.23.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:16:10 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	james.tai@realtek.com,
	soc@lists.linux.dev
Cc: afaerber@suse.de,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cy.huang@realtek.com,
	stanley_chang@realtek.com,
	eleanor.lin@realtek.com
Subject: [PATCH RESEND v3 0/2] arm64: dts: Add support for Kent SoC family
Date: Tue, 27 Jan 2026 15:13:59 +0800
Message-ID: <20260127071530.25426-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yu-Chun Lin <eleanor.lin@realtek.com>

Hello,

This patch series adds initial Device Tree support for Realtek's Kent SoC
family, including the RTD1501S, RTD1861B, and RTD1920S variants with their
respective evaluation boards.

The series includes:

1. Adds compatible strings for the Kent family.
2. Add Device Tree files for the Kent SoC, TD1501S Phantom EVB (8GB),
RTD1861B Krypton EVB (8GB), and RTD1920S Smallville EVB (4GB).

The patches have been validated with 'make dtbs_check' and
'dt_binding_check' to ensure compliance with DT schema and successful
compilation.

Cheers,
Yu-Chun
---
Because I haven't received a response from Andreas Färber for over two months,
as suggested by Arnd, I am bypassing the currently listed maintainer and
sending to soc@lists.linux.dev.

Yu-Chun Lin (2):
  dt-bindings: arm: realtek: Add Kent Soc family compatibles
  arm64: dts: realtek: Add Kent SoC and EVB device trees

 .../devicetree/bindings/arm/realtek.yaml      |  42 +++--
 arch/arm64/boot/dts/realtek/Makefile          |   7 +-
 arch/arm64/boot/dts/realtek/kent.dtsi         | 166 ++++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd1501.dtsi      |  12 ++
 .../boot/dts/realtek/rtd1501s-phantom-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1501s-phantom.dtsi    | 118 +++++++++++++
 arch/arm64/boot/dts/realtek/rtd1861.dtsi      |  12 ++
 .../boot/dts/realtek/rtd1861b-krypton-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1861b-krypton.dtsi    |  72 ++++++++
 arch/arm64/boot/dts/realtek/rtd1920.dtsi      |  12 ++
 .../dts/realtek/rtd1920s-smallville-4gb.dts   |  23 +++
 .../boot/dts/realtek/rtd1920s-smallville.dtsi | 128 ++++++++++++++
 12 files changed, 626 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/realtek/kent.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi

-- 
2.34.1

