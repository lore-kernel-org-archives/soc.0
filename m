Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF27121A43C
	for <soc@lists.linux.dev>; Fri,  7 Mar 2025 17:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741369784; cv=none; b=og+qH8d158zUI5X2w5h/JRup+iW0aUSxgGNdimKIXxLhR86DmgPjk/+QYQDMkPNBG9B70/4+bs4ScqcwY5er63bmgEgsm6w/yXQTXXFzo63AoPXWCs1DOWJiJ7oydtlaImwrO8K+0RkQ8ss/E/kl12VTbjYv0aelqHyAmaid804=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741369784; c=relaxed/simple;
	bh=+bWbpozrLQ8Y28qYv0RsdTy8ONY6agBjzjQ1RHwRl20=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TxIDwV0wfPCZlaYYNDkk4gHcRFX0QMOxNmwaFq0kktl6d0uHMqhaJbdeywO4Y45aMYpG4b3uc34cFmsL4MmIf0ttnGFO8OyVPcEzBT3ILLQvXTNwvcqzzERVJhmJ76hxK0HHak0ftwMGcDWIxBeOMHOxm5KLflYzX+FAT3F66j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qtb1PTI+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qtb1PTI+"
Received: by smtp.kernel.org (Postfix)
	id 41EB4C4CEE2; Fri,  7 Mar 2025 17:49:44 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24E15C4CED1;
	Fri,  7 Mar 2025 17:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24E15C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bc6a6aaf7so16807855e9.2;
        Fri, 07 Mar 2025 09:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741369780; x=1741974580; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J90ROVYIlVunjJAyLM7koC/nUgKephX5yjyqgLDTy/o=;
        b=Qtb1PTI+Wd7zWF59/a3LhG0hJb/cCwZ5Hemi1EUPKxzZLPXaLOD25Un8u1mkZwtF4A
         1MK9r6tTs/9cuj8qT55E+wPz4KwbQNDEdqq2P82IuMDQanjROrDGaEL/Zt+1dVJxiGD1
         HyXDkyCfRMuhu0g+6hhmcPrAkkVUxMQ91XKJL4Jl/Ke7t4QLRpHk93/vB46RkMdcIP4X
         JJivvVLj52Jd/i4aEVhz18CeuBc2YihPWGwMecbKx55VFzV+Nwb5yuh338RcA70rbFcb
         RFWUXN0zxj1JVAwTNgwMUzT1Hf648mBvftRcJ8htcORtCQzzCphdg7p6gjoFCxIbwDed
         IEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741369780; x=1741974580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J90ROVYIlVunjJAyLM7koC/nUgKephX5yjyqgLDTy/o=;
        b=kiXmsD/BkhNh9JyDgX7t8vK8Np7fJFuDl5IuMSoyykBciSTtQCuydl4il/7kRg2MX3
         2Dsz6RFOdtYEOvBqo2RJF9QMl04qIj2Tbm0eOT4tZJB79p/VQ4sIbyJHVpNLN9B3rdiA
         qKH8DKq5LSEEpy9AU95uxxcv58USnY41vEAL/Qo1a2SyFfH4922OILeowI2/TEvkIhkS
         gayyo2XFUvQc6l2sXkQgtemaPwqpM5l+9BkImnhnrPKfoKio9fgKJQJG0jrBV3vo/Z5B
         qWRlilmDiLbsmabmJ7PRhjVaAqhlk8V7+7+ya+h86mLINAt2VEAtHuZEbZcCBLwRKZ2m
         OTRA==
X-Forwarded-Encrypted: i=1; AJvYcCXcps1Jkx64fkIOzf6WkuGwpf8Y24PIjB5T8D8f0ILgYh+Z/dYAMgct0KK31l8cuzpMNMY=@kernel.org
X-Gm-Message-State: AOJu0YwMsxUGombalZuJMscbIBRn+AETOUit4+D6FTIxn1c5HdLtuYRL
	A3RzMAlDXzCqJAGJrndZhvgZe+Dmx0HP52YSNZaPtXbBBKBwkaQs0DdZPA==
X-Gm-Gg: ASbGncuL5yPjl8pDarJ0och/exPDGs8ltbc/4VNG5lK4CVDcY45etrEq3qcq1ksVufV
	tYF58esvb/9JrleWKYd3Eu/X3q1Rr4tTZYC7N83g1xxXQ3gdfM6JWqA12o+xpLUMcSeybG2ZM6Q
	gAmyoIvDyqg66I+ZLMLvTP5ckqeK/HJLbvqkWm6LZr/JoeVxKbNR8K+rd46T0STiyUQHsOPWcY7
	/T7o14CexmLpH00eSmP26Pp9UOC3tQhQPBGD752WJlZJLYnIbQTyIBi2fGRgKXaMqHI/KgZLPns
	7VS5QGWsxTAtgaqpg1RCaG0t9NHbjXoHBd0dkFaiFMZgSFtqt0CQ0lyycUfKeyrREmhbwi2+xD6
	roUTjeZU4OUPLeDqN6pC/Zxnn1B3C/fMXmTqj
X-Google-Smtp-Source: AGHT+IFQwfhw0TWFcyPyKOcZOJGtcyGZ4hJE72wsBJf4kNuTmJUWQ1NzJYzItPPrui90jo20M3KYow==
X-Received: by 2002:a05:6000:402a:b0:390:e535:8758 with SMTP id ffacd0b85a97d-39132d2afc2mr2954780f8f.9.1741369780278;
        Fri, 07 Mar 2025 09:49:40 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8b04casm58181535e9.8.2025.03.07.09.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 09:49:39 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] arm64: tegra: Device tree changes for v6.15-rc1
Date: Fri,  7 Mar 2025 18:49:37 +0100
Message-ID: <20250307174938.3456275-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-arm64-dt-v2

for you to fetch changes up to 65d691a4400e111e8bb2422a5f4f28de34298be7:

  arm64: tegra: p2180: Add TMP451 temperature sensor node (2025-03-07 18:38:29 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.15-rc1

This contains a patch to remove an unusable key that was erroneously
exposed as well as a fix to support GPUs with a large amount of video
memory on IGX Orin.

Finally, some additional devices, such as a temperature sensor, are
enabled on Jetson TX1, the output voltage of some pins is adjusted and
the VDD_LCD_1V8_DIS power supply now uses the correct enable GPIO.

----------------------------------------------------------------
Diogo Ivo (4):
      arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
      arm64: tegra: Define pinmuxing for gpio pads on Tegra210
      arm64: tegra: p2597: Enable TCA9539 as IRQ controllers
      arm64: tegra: p2180: Add TMP451 temperature sensor node

Jon Hunter (1):
      arm64: tegra: Resize aperture for the IGX PCIe C5 slot

Ninad Malwade (1):
      arm64: tegra: Remove the Orin NX/Nano suspend key

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi       | 13 +++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi       | 20 +++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi             | 10 ++++++++++
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts    | 10 ++++++++++
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi   |  7 -------
 5 files changed, 52 insertions(+), 8 deletions(-)
