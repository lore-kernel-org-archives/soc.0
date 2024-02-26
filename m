Return-Path: <SRS0=sv7V=KD=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5FEC48BF6
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 14:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95209C43390; Mon, 26 Feb 2024 14:45:40 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8AC4C433C7;
	Mon, 26 Feb 2024 14:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C8AC4C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3e72ec566aso398865966b.2;
        Mon, 26 Feb 2024 06:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708958737; x=1709563537; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qDTQWYCy+QQi/TLHMND383JBwS5i6yYWGE60AiFcEzA=;
        b=QdLBiGmBeKGRJGaCIIwVa7kPwBQZeSolHp/UvKi3vMzgKj2rKHGaOJh70pSzbgeyWa
         extpolJuIqw7BW9KZNo9AP4EZ+7Wukzrx/LUCix9jRTkWJBtGLGyXRSqooAx/2oM5eqx
         3IIuY+4SkJrTHMlDFBpRaJxkRJYpVQ69vBXvXQ/Ift0gQYBc+1UqIMI18u9qvNahA466
         kRJHPHYGsVv3e4TKtcuv0WormNXLDxryZbpqyci39TiTqwQLLGsY5MluE4X3Nx9G8E25
         ZASLo1S9NHnElBDGjVUjCFp2dIDPm9TZo3Wo743jbywwbEkWsL3cHEkK3sBh7iUkFvBO
         6I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708958737; x=1709563537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDTQWYCy+QQi/TLHMND383JBwS5i6yYWGE60AiFcEzA=;
        b=v2XWYQzsJIG8F32SzkuV70/1zJt99f2uHLgXfYo6OammpmGRcPFkMwyBXCdQ6i/F1G
         rmZYGfbe+T0TgZazhDQnCB2fz7tVfAvLwwUNO0UXt3Q7q0xwlpluSvVNjMpYkzsX1y6P
         B0UntH4dYHRaaz3vj1giv0zPVHpI55zI+pPGcDoXqVIPiG4Bp9DcAVEtP+bnEJDvBdsZ
         8fXGodLpa1Fz41+YUZxOJU4tbYJ3yyZshIOkLdJYkEpTiW2r1QZPAm8O2disEgQxBU1y
         ths1ALz1yyDHhe4phSvKfMR3G0N2Z7oQE6AS6r6q440VgdvDvR84odzLWjQLXaGoFQv4
         4vIA==
X-Forwarded-Encrypted: i=1; AJvYcCVDR1cOLYzxRUoG89VHI+q810nyrmV3tuTSaYzLiyUuK2AHSU/q/9wyRv8pqgWqZpAWcV44sJZBbcS9hDtvnQ==
X-Gm-Message-State: AOJu0YzDck04xvnRqBjo9PqASbi2/WYe6Ih6ZQODSt6u5zN+D/Zuclyz
	vRMp4BnnKeM3i9B5ciYeXxd3AqxPkiPqvZVkLfWCLJyPVCTX40qwq6noYAk+
X-Google-Smtp-Source: AGHT+IHc29NHWm3fepWcp3B7//v3LrzDODYL4KaSq4pbw65xvR+khbcC0gYpft1fnaOs7pu1kPazZw==
X-Received: by 2002:a17:906:3793:b0:a41:3e39:b918 with SMTP id n19-20020a170906379300b00a413e39b918mr4037615ejc.24.1708958737207;
        Mon, 26 Feb 2024 06:45:37 -0800 (PST)
Received: from localhost (p200300e41f222300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:2300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k17-20020a17090666d100b00a3d8fb05c0csm2483296ejp.86.2024.02.26.06.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:45:36 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v6.8
Date: Mon, 26 Feb 2024 15:45:35 +0100
Message-ID: <20240226144536.1525704-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:

  Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.8-arm64-dt

for you to fetch changes up to ff6bd76f4d997642ef390bffe42e93d6f7be87d3:

  arm64: tegra: Fix Tegra234 MGBE power-domains (2024-02-22 17:58:59 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v6.8

This contains two fixes to make the MGBE Ethernet devices found on
Tegra234 work properly.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Fix Tegra234 MGBE power-domains

Thierry Reding (1):
      arm64: tegra: Set the correct PHY mode for MGBE

 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi                      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
