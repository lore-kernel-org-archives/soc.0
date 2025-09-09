Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB12078F3E
	for <soc@lists.linux.dev>; Tue,  9 Sep 2025 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757442244; cv=none; b=X5YOopPy2sHHRTz7qzrmXkZATAD6VYAs0Lpiw0IjKZPkwmuKnQqZeXPqdx9yk21D9dGIk6QVHxCSkH5TgCTlAVnFyAqawWCo/bx0stvovNQnq62p5xL8L7N2jFTX06audnpxD8vY7dZD4fVe4+rhSfo3poi/Zrm+c+A76itS5s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757442244; c=relaxed/simple;
	bh=PYpuE1bg3M8RrfKVn/z5QPHZvCyw0Q4F4OFmwIUXtHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HO3S/xmd/tyJrnmWjBhT2vJeU0QJX8PMdXNqilPV8zFg1nSJ1OPRKdgBVnqMDSPtjguTD7uvwTgHwI4KemBVzaHF31FUlA9r0CvgDFm0pghNvnjnGjKW9J+IfCANpBP/EaBw+yb2sctnA/WsOb3U2HGzX/dGHhO+vQBxRUcMlSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cVTSWEFN; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cVTSWEFN"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f7c8b38a0so937532e87.2
        for <soc@lists.linux.dev>; Tue, 09 Sep 2025 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757442241; x=1758047041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WWPK6qiwC5pY+gvwfZR7zxOqiXiBtA6mSbWCJx8aeqw=;
        b=cVTSWEFNCsYk+sJ/WOLkxtWLqi6eH/zhUfpgYrr5X75YrK/i13W91OpqmYZ8sgHijG
         7vxFif5BK0nWURX/ZghlmOpj4ZiGyXDo0CR77f34mCiMLINGb+vupZdSFMAl3cgZpzt5
         YKaetNFbE7ZR3AwFGYMYkQcjYF1oBBkk7PfXBlvWBvbp2jYoCkIEbWflkfJcoe0fZMi4
         GuKPQ5efUojPq1H+4lCLPHcYz3ZYz9BenY8IcO6RpLHiEr8SZiL1u912WGkw+V2/SwXr
         tCQqYN6ed3iwyXxOzuQDSPvXnfncnSLP0QzUgcumm0GTooZV+t2R0iChuJiUM1XYkx8U
         u5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757442241; x=1758047041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWPK6qiwC5pY+gvwfZR7zxOqiXiBtA6mSbWCJx8aeqw=;
        b=GIEeoZGlcklj7ja91OZYwiZ4upxHAFGK7mlmRpeWxHbo6kU6nV5Qhcjg7frj0o8MwM
         kQ/jrKPzcbWz9OF+1c/oPLlQdaKrwBNlKqsErzHRLDCLFEDWesU+XPGBHd2kKIiDl2L9
         TWYTjtXvJ2XdLvfX78Zl/sVCA3rGoSrRpxTPmNfgbIQYKLCXWPhaMCgf4+Hk/o8tQf2M
         X/AMZn19qjGNtZXZIPt7x7hNIdJ8DR478xdf40dO64n+I790NlRKVrqW47Yuyixfcnvc
         E3L5yEh7QZIOVliT8f02FaaFXGGSdbdYFzm/bOFq0T2qttEkq9HOTiXc5VsbvjlIL65A
         8Zqw==
X-Forwarded-Encrypted: i=1; AJvYcCW+yhf9UGXP7GgH0XQP5SzRi5bH+e5A88FnSGIONz2r+DtzPp+L57ZYPB6irIho7sOIY7k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFH6zGpXTgvEYIbbbf5QDTAz30jrjNkg8cuwYv575s39ORQRwo
	GcIJsm9ZNLUfQ1bzqvFSIFT9XO0SD2QLtbPwN57teak3gicZFrk1gD3OU3a3QKA7vQg=
X-Gm-Gg: ASbGncs70oU1rsyWnN8Nrd42wD8WTL2i0O12ZJZTtwbMRrAjVQBeZSCODZN1oUxMNqS
	+dXfp6bA92jT3jHW7d4cTaNyjoMt2zsmatDoEotxf/XqLRLMnmNM/8dz5TJtfqn21+jfDi7myrH
	lWBxWWANZ7HhwrfG5HewfQCPJldt5bgrffRuq8sz/g/OUwuERcZrdAtYUELbZ1Af3yGRMt/S5Dr
	RtRxdsmzuoMRjjkxbtOk+9jm1kpxR6hFjM5VeDrOQsCpGQJK8eYWxGirPxcPhi3U1qqVKWsfWlf
	B0x+Ns2meGUS7zKcYY5NgO5/FzGZi3WODjKvm6w2Qtbo04jFfadRc3pwhXWV2XgZ0cpg4J9wVon
	hqOtu8KgJOPoGAZhEEipHiSMLKa4/j9RAvg==
X-Google-Smtp-Source: AGHT+IFKUMj2Ann+5FvQWmTru0FFpd1c0y5YYx+6dgpjzz3R0gwegHovdsmJzRrG+FbV0JmNIFTadw==
X-Received: by 2002:a05:6512:61cf:10b0:560:986c:9b4c with SMTP id 2adb3069b0e04-56262a40f5fmr1551769e87.6.1757442241028;
        Tue, 09 Sep 2025 11:24:01 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681795d757sm676071e87.82.2025.09.09.11.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:24:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] arm64: dts: cleanups for v6.18
Date: Tue,  9 Sep 2025 20:22:56 +0200
Message-ID: <20250909182256.102840-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=PYpuE1bg3M8RrfKVn/z5QPHZvCyw0Q4F4OFmwIUXtHo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowHCA48KtemWMzw1tyv2NmUMBfo7b8GHRTLSZU
 QGFn/XMqgyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMBwgAAKCRDBN2bmhouD
 1wcPD/9nMH+muQgC86bN7iFNvLm+8O4InFbUmjf+AamXpj6CNoZ81ArlR0OgqmaG696pZh8+RKz
 r07DvRWDwSg2rSA1iAc6r45EvvPa2RCLFujMCLgp5llAixbu4GGVn9xvr9/bjUtqYIMcv7l8Xt7
 VGZouaW2YwL+t/wgOuBuA4dBvO805/I3XOwpXsADwrBfXtUEEH5Dr7dYeULkMB6HyQTYUWqaU8e
 mhnxKqrpUeF46mWVV1O7SWPswl7ieI60I6pmfFmn7eWbis0K4ihsCE3VcM9wsbT+OxkWcO5F+WE
 Be4c1TzYiMA6vEzRkiMFo4egPhwxfdYp3eaO2DyXBTCoNjJmmc4Ymfy+pKvCxTJ03sl6rEpsbfQ
 rOJNaon/J4sU0pz7pvecYodoADx9U8Y2RKpCqt6S/215BEOneyXDfIu9lMIEgoa2tpomeo4aVi0
 NSKYCbqjowjxRQsEwXDTmRteMjDyLAXgu517Frl5nz1B6EquOMKNecVjF0m+rJ766gonkY3frfF
 /TcJulsVdCrV90Nf/NCGpvCfa8WGrCtjAOO5oiZ/SkppfPy7K+PWIcdONYAwDIKJ8jwOhg4Loc2
 t9j2UuQUUXiwx8rqagzMLmCpJGn+Kud/g1/etDtKEWAtVHXDKZiUSX7zUu1KftuvbgsMH6AsvX0 KY2NQzSXvxETe8Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Few cleanups which were not picked up by their respective SoC maintainers.

Best regards,
Krzysztof


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.18

for you to fetch changes up to 7ee0f223cabe9b9384250024fec577c731cbcf72:

  arm64: dts: toshiba: tmpv7708: Add default GIC address cells (2025-09-04 15:50:47 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.18

Add default address cells for interrupt controllers to fix dtc W=1
warnings on Amazon, APM, Socionext and Toshiba boards.

----------------------------------------------------------------
Krzysztof Kozlowski (6):
      arm64: dts: socionext: uniphier-ld20: Add default PCI interrup controller address cells
      arm64: dts: socionext: uniphier-pxs3: Add default PCI interrup controller address cells
      arm64: dts: apm: storm: Add default GIC address cells
      arm64: dts: amazon: alpine-v2: Add default GIC address cells
      arm64: dts: amazon: alpine-v3: Add default GIC address cells
      arm64: dts: toshiba: tmpv7708: Add default GIC address cells

 arch/arm64/boot/dts/amazon/alpine-v2.dtsi        | 1 +
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi        | 1 +
 arch/arm64/boot/dts/apm/apm-storm.dtsi           | 1 +
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 1 +
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 1 +
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi        | 1 +
 6 files changed, 6 insertions(+)
