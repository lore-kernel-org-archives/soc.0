Return-Path: <SRS0=8G8C=KA=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72392C54798
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 17:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34B7CC43390; Fri, 23 Feb 2024 17:48:32 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6311DC433C7;
	Fri, 23 Feb 2024 17:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6311DC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5655c7dd3b1so1222981a12.0;
        Fri, 23 Feb 2024 09:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710508; x=1709315308; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qDTQWYCy+QQi/TLHMND383JBwS5i6yYWGE60AiFcEzA=;
        b=EMhIPBTsrVfI12oS6YMcU92plHVYuJDRp/qW8am5JMqejeEAkLoNJSIwOgq8psDIkP
         pyzzPD9rdd/LPxI1vhyjQ6IvIzjSFHYOIeRMVERwu6wSFd+lwGmYfuUWSWCV63ECAx6J
         3nmx3Bsn250Sso0Gt6Ll+Fj5zLE/kE4fE5cXlNE0uik3gA47X0u6Cqc8RjZ12hT/qq2S
         TDLbaSfVtSr9dZMmYCrKlE9kldjaLI/gYtk5BIPFkrLpWqgs4xUCROkhv+wVBT7fMQ2P
         jlSO6dJ/MmvMCw2i60aQxZi1wV+JggXwbXIItQiUp+MzsaZPZ9Vo4jpssh3Qn69SNibW
         dikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710508; x=1709315308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDTQWYCy+QQi/TLHMND383JBwS5i6yYWGE60AiFcEzA=;
        b=UBw6Izoj8UyS/EK8DVTFeoHnAdPhM95+jXhCfvgKK9Hhy0s+46oTJvLSF/BYYjivq3
         LPogRRM6wVSomb3lT2PxUBP749Bst35T2IEPNV6mExwpFS2lfRmNwWRtgRBblBx50Obv
         iWbc5s8P3LbW9MrLRhIoQ0Evi0Nz3TZT8kvQa440kbXH6TCIcBENXK+wG93tkjJsTKt6
         QJe98U+0CLqFyVbUmd8lMW5mqsmhVBctgJdgKBIHhkkPS5YaEkgFBymT0yYs5KXD29CC
         wG4oCJMebOUWbpkU/w3D4gySRz0Ypdamxch7GuM/mZil/LJWQy/849IfUIMvMQ3wddOA
         CApg==
X-Forwarded-Encrypted: i=1; AJvYcCXhoF/0plxsnbN4T0wvuTD6n93HE2VpMEw534MnQ6CGHAUx+0bv0lYLR2x5+1PHRRB2IXGfXfOdXCvFGLO76g==
X-Gm-Message-State: AOJu0YxV4DZ6C335OP5ikGiGVduPCnu+yFumYX23KMJCwRhDkM4PXOFa
	JZ5gVXfrLx/Pkd6bZYSBwhU/cpV8qo9r+R5DU1EFMYtVBjbBR1is/jvpicH9
X-Google-Smtp-Source: AGHT+IEugaLiKRMQmBJYUFOTsMd4m2NAYjFiDgtEfzsH1fP2f4xeHnWtIwXaTRahNk43oqrA6gEkOQ==
X-Received: by 2002:a05:6402:5389:b0:563:c2e5:5289 with SMTP id ew9-20020a056402538900b00563c2e55289mr399605edb.13.1708710507945;
        Fri, 23 Feb 2024 09:48:27 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id el14-20020a056402360e00b0055fba4996d9sm6605375edb.71.2024.02.23.09.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:48:27 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v6.8
Date: Fri, 23 Feb 2024 18:48:26 +0100
Message-ID: <20240223174827.1509403-1-thierry.reding@gmail.com>
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
