Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DDB19D8BC
	for <soc@lists.linux.dev>; Tue, 31 Dec 2024 13:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651734; cv=none; b=s3LJ4T9/07PptgXA6HfyqETw83PIFfE6QqujJ35/5T9ofRmOIwhZbDj/dXfObikgSeIhL+3bJBwxrAYgWKxJ5sJBO/p/5Tf0yRzdQ4Gw5PIyHBpC2Fsamhb9GR0HLlbOtM7I7xX2kN6bCx6COAzcTwInq4mQGIx+HF7Ee/6sbXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651734; c=relaxed/simple;
	bh=5csFtTl3KMWd11R6aG8AxRTX32SaLbT1LLs+/Px17Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QTqxU9t9sRSw5sOe4Bcj26vxjtsHiDfsTaA83GtHYrnaiUtA9NTg1Wfod45S6hrR2pgqqGrZudLzFsIqLP+nuoKmnMS70fqV0UmHfHK5uI/FNRUsivt3MpYkpURfdAzSmsL6Lmzx1tdmLLBGlowoESdyfeXLUnvtzouMijufots=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B3E/40dt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B3E/40dt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43637977fa4so9637185e9.3
        for <soc@lists.linux.dev>; Tue, 31 Dec 2024 05:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651731; x=1736256531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=maCTQepsTUVpu3pdm5l+blLPz6LwOEt1QP+hRHzrnnQ=;
        b=B3E/40dtKiLrp0kge8umW+hJ9E47Fs1Ewvx3AfEGm1+ml/TyD+w15EFQFmMHcb7xlG
         xzdVa7FWV8eGDYocWZ3W6xdedMOv7qwznY/9GxeiKLE2ftLtxrAbYQ5HTL9tsWp4WIHW
         cCKvWkkBydaK1LhCsN4vkolsNOVL24WFznwHTf1IHOYrzlMrBk6utGo/1tWplIhOALiZ
         W6m6RiL4zsPC1t9F8TFm7kegcGJ4Z9/1y9oDGbBHejmSRpsSPjLIYMYacOm4UN5CksJh
         tJAy1IRX7DyRffTNIhMdvNaIYr0w5/TS5Q7+Kz6iTIo7QPKuJEjjj8KPLBwP1CRE7BrF
         HA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651731; x=1736256531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maCTQepsTUVpu3pdm5l+blLPz6LwOEt1QP+hRHzrnnQ=;
        b=Y8MdBceotqFPBhHT8Ygj6R62xAQSaeBkfQur0yG3xt0MOZhwpkozPRg3fnHU4F9rqO
         +skSKlIqg2yFWlGPVnF1i7pLHiflLMidl6bCoAzSZLE/vtKIjl/3XbOIzb8t83BXIvYu
         dJ/50mrH+8Vcd2bO/VP7Rf7C4qwxzcM/ZZfaPGAuRj1uKc9oftuC9gyZ45A+GC/tdygM
         Nd/Bt88rbuFLd3V1Tpq/cAI+nFsu54C8WfVFYjY4VjIbmBMCb3h9V3q1qOKUK2AtkSzY
         BBKadkj96OjKRnlarzcZuQ/C4BybUtL+Diyhx/i94q0El9zean2tElXfqMOzViLoUCyq
         RogQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrYAOC4YWwOOrtuiAxivks8UuWZdd80+x0uytdsTJ3XGn42DWcoaxzw+51TwO1Y9Vxz0A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVAB7E9FpJCHzFR8LOGYZKW71fbcImt9xh7uaUlPNDZwgxRHQ1
	xrG42dHEg1AbDHv+91vC6w5kSoXyz1o9lIg0Rd0h7rDPfglYdnPxXI9ZDi1zQMI=
X-Gm-Gg: ASbGnctsnC8l00tqPTYhspxnEjxcrjhM4dCVgCSIDggkFrex/DfBu8PGhe20kKehNaL
	hLmm7PILwJ9DitA+INUM57O3S5xYcgpo45NjAnTe1QgTuF3T9PjFTrVkOnLq/strWOHaJVFctOG
	cLRNN4LaAMdq/AyEKTwlY9vI+sJvi5m6tkyl7eFBwz0mMuOcuWycSl5cz08bq0SiIOiEFP9NFIx
	WfM24JZYCNpjrS3/TXcSU36yWMbGKkmD6n1SZVXWN8JcTk4wWxwYzaAAyvdRp/u+lKB0sM=
X-Google-Smtp-Source: AGHT+IFCgCggkijd8BCvvL0HdAA1DNcbL4lkGRKWlrZWXZ/2B/Du2w0fh9jPXbFcqVFRT4zZ1tGerQ==
X-Received: by 2002:a5d:6d0f:0:b0:385:ebbf:8736 with SMTP id ffacd0b85a97d-38a223f7484mr13078577f8f.9.1735651731380;
        Tue, 31 Dec 2024 05:28:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8334aasm32800220f8f.41.2024.12.31.05.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:28:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm64: dts: various for v6.14
Date: Tue, 31 Dec 2024 14:28:45 +0100
Message-ID: <20241231132847.135814-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Few cleanups for two platforms which were not picked up by maintainers.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.14

for you to fetch changes up to e1daed030b56049caa2d8cc040c824990374d941:

  arm64: dts: sprd: Fix battery-detect-gpios property (2024-12-06 09:42:08 +0100)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.14

1. Spreadtrum:
   - Correct few issues pointed out by DT schema around properties and
     node names.
   - Move fuel-gauge from DTSI to DTS, because it belongs to the board.
   - Use undeprecated properties, like battery-detect-gpios, already
     supported by Linux.

2. Uniphier: Use un-deprecated hp-det-gpios (no ABI impact expected).

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: dts: uniphier: Switch to hp-det-gpios

Stanislav Jakubek (6):
      arm64: dts: sprd: sp9860g-1h10: fix constant-charge-voltage-max-microvolt property
      arm64: dts: sprd: sp9860g-1h10: fix factory-internal-resistance-micro-ohms property
      arm64: dts: sprd: sc2731: move fuel-gauge monitored-battery to device DTS
      arm64: dts: sprd: sc9863a: fix in-ports property
      arm64: dts: sprd: sc9863a: reorder clocks, clock-names per bindings
      arm64: dts: sprd: Fix battery-detect-gpios property

 arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts |  2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts |  2 +-
 arch/arm64/boot/dts/sprd/sc2731.dtsi                   |  6 +++---
 arch/arm64/boot/dts/sprd/sc9863a.dtsi                  | 14 +++++++-------
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts              |  9 +++++++--
 5 files changed, 19 insertions(+), 14 deletions(-)
