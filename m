Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32871FAC48
	for <soc@lists.linux.dev>; Thu, 31 Jul 2025 16:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753979366; cv=none; b=ptSJMzbVHuAO1X2nxTJi4kfQoR22IXsdKNqn1ZqSD4ePbyPsW4A8lCEdxAS8YXiwHGR35A7O8Hw0Xm5YZRI8i3iKFog4kZqJ5mBCr4z33Co2tmf1FEzTyqs9sSiwXyAdNwX4vU6BIZuKlB3fy22q0RhEHfjDAD6L6EY3nLWWFOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753979366; c=relaxed/simple;
	bh=pTAemJ0yh0Pc1HDNRdAZitGZHWrrrmXazPzQFXeUMWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dD6xKLOEaBDcPH1inF9am0WiXH+QDcSC66t0U4LxaFTUg+/Yh46k7qB9moF7lu+tyXjk8n56Cb7PRbsk7KzoSgnZkWgJTqt4qDPM/eG1C2TI+T0wupPUiM+HvgIK3t7oxUzU8B+hG1SK0Qxyoh6GIDEqD2lHPwnxwyhPktYcaKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5TRU1qq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5TRU1qq"
Received: by smtp.kernel.org (Postfix)
	id 9A3FBC4CEF8; Thu, 31 Jul 2025 16:29:25 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE57BC4CEEF;
	Thu, 31 Jul 2025 16:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE57BC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b78315ff04so501706f8f.0;
        Thu, 31 Jul 2025 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753979362; x=1754584162; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GrfhnOllGO/ZBhleTB8LJWdBObsKh2pIJ95KhExliA=;
        b=U5TRU1qq4o9CnUqU7BgcM/L1W7HM6mliZN+EZLkt0PpW/irhmkPt/or6wPJocMR3lM
         I17DJwk10Rk4YzXFksPK79IHFDpEh4eLCuiZ6cX1akmNthYZAeZw0AGTJotGiSPl5tI9
         NlEbBl6tqS4VEVg2g05S+/hni+rhh/NCSAztTbAHBTVRSqUuudaV8llHzk8HGkU4KZj+
         Z7FEBAEULMZpVLU27nJgM1DZodNzxo17pstwYt/VQbI1Co6peNXH1xaJeQaFRfK2dxkB
         IYtu2fKprBlNdo2GIOrOsMDNszebQKBQSoNoGpSYS9QRwmN3qWIkskguqfppUyIXA+M6
         34og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753979362; x=1754584162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GrfhnOllGO/ZBhleTB8LJWdBObsKh2pIJ95KhExliA=;
        b=Uo1AcC8ywG7kIHSYEvekraJ2oyi6ClEEOFuAy54x97Kmx0erHYPONq6hj68kgo1lam
         jijqIpzSLgqG0LQaDglqghaNyax/fHtI5X7+vHjFEjjzgSb1KLUs5SADmBaE25bM7M1P
         iGXPrWgj3oJfxZEoboVIG2j80uUOBVa3VUGXmumtbxeeBr41Q8dYibz30zy3Yt9pEcF+
         +RuCuX7U2RH3nZ7v+hL+u6UlJNlxGULEI9stuU4K1CpXj8M3jpc4GiJFqaH6eKLyPZFJ
         jRWHLqt7OEo1lNMsVdg2tPPncGYTgyMpVaEdtpxn0PIhhBm+9jdURs/qZWygR9FKSXWz
         njdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGsDHVjiDrI/euwZcn7z6lOXImQxF9TutwaYKg/X6sHJkvKG4hVimg8G7Q2E1mTeA3/l8=@kernel.org
X-Gm-Message-State: AOJu0YyqrsZ0d58DAeb6gK3A4F3uOG+dCM2+F6tHze9enP473fCcpIuJ
	Mee/KmnoC2lUdKGI741PndTBG28Jql2RfJZqRKEKMQw6+hxyD5Vv/AWus22vxA==
X-Gm-Gg: ASbGnctLKAlTsQ3HyfEgU0n/MOtBmaeRdUFJBBhJjieixCjLEBiXd67OtYp9W18u3ES
	eU3Obmo99eCFK1sX9gR7MQMWWfFMVw/eFY5A1Qp63Fcl4+idm4cH9rjOFicDib2OGnSS2Xb+lR3
	ys3GCmgk9ihK8bZo3JGT4EzRvs/7rty4r+A16fTWdVo7KdZcSmP3pkER3Wz/oEGa0qASSf1pWVd
	dlj+4WNCMAEmfPt31gkJdSm9Eej4krbznXmk4lLB9jSfdBr7artjGCzJHBUbf2zbmxItg6dI39l
	c2MvKmN69ryiOLfbNz150TVVt3dsGrynAKwH7YZX40fVqyLMGk7vW81j3W8lUwESB8iIkbcjnME
	Q1QqkWRTINZlcD6S3X6neN7pkI+JqWJpPvY4qKC7vPPqcuiCzmTqt50CVPwX+IcoCQIi36J9OPx
	jrQJeYJWOM10MjHA==
X-Google-Smtp-Source: AGHT+IFgEWwFjomsToqFVgplkYJcpc+0XO5/g/a4wp5+gHc+xPLMaQiVmjOvF4+UjzxA5M7HDt25xg==
X-Received: by 2002:a5d:5d09:0:b0:3b7:8af8:b91d with SMTP id ffacd0b85a97d-3b7950286f0mr6927192f8f.35.1753979362041;
        Thu, 31 Jul 2025 09:29:22 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4534b3sm2849619f8f.47.2025.07.31.09.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:29:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v3] arm64: tegra: Device tree changes for v6.17-rc1
Date: Thu, 31 Jul 2025 18:29:18 +0200
Message-ID: <20250731162920.3329820-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250724060202.2942616-1-thierry.reding@gmail.com>
References: <20250724060202.2942616-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm64-dt-v3

for you to fetch changes up to c36049da6c903b732f238eb6fd13c2051fac96cd:

  arm64: tegra: Remove numa-node-id properties (2025-07-31 18:18:02 +0200)

This should be equivalent to v1 with a patch on top to remove some
numa-node-id properties that were added by mistake. This should be
equivalent, content-wise, to v2 but doesn't have the dependency on
the extended dt-bindings branch that I had added in v2.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.17-rc1

This contains an extra patch that drops numa-node-id properties that
were added to the Tegra264 DT files by mistake.

----------------------------------------------------------------
Sumit Gupta (1):
      dt-bindings: memory: tegra: Add Tegra264 support

Thierry Reding (5):
      Merge branch 'for-6.17/dt-bindings' into for-6.17/arm64/dt
      arm64: tegra: Add Tegra264 support
      arm64: tegra: Add memory controller on Tegra264
      arm64: tegra: Add p3971-0089+p3834-0008 support
      arm64: tegra: Remove numa-node-id properties

 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 ++++-
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 .../arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi |   7 +
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |  30 ++
 .../dts/nvidia/tegra264-p3971-0089+p3834-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi |   3 +
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 412 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 +++++++
 10 files changed, 701 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
