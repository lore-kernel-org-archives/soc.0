Return-Path: <SRS0=np67=PO=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566D1C43219
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 09:47:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3E05961040; Tue, 26 Oct 2021 09:47:19 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB52360EC0
	for <soc@kernel.org>; Tue, 26 Oct 2021 09:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB52360EC0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 796D83F173
	for <soc@kernel.org>; Tue, 26 Oct 2021 09:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1635241637;
	bh=sbYrCs8J0Q0Rz6cp+rkJ/lhh0zXOz8q9lqlVQx/f+TQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ViRhBYrSYOihVgD4YISG9VcebSWK8X9boI0Jvi0uYwz5I2Q+FtYLycmRFhYbRCPGa
	 ZmUuphIU+//3tZwNNqJokLc2PWPoNfow/8bUC15MF3XA+QG90zZ9sR2ElOPKF4M0n/
	 WIvfYtZmLS/ihm1E65TrQj02wBSpr2Ob/u/653JzQL6rzogJau2S1zfddE+dUFARVf
	 Z+ky6NK86uOp2TVW/S9X/t/WCkR5gmNbVnUuiULZx4tWrN//fPXAxY9BcODw6WyNKk
	 Lb2MFlzGw8ONX6++arsv54zlylwMyamnqZV2tuXH+xd3AfRCRt/LoxDiWB8veiCmEn
	 zCP3AqWYj4+Ag==
Received: by mail-lj1-f197.google.com with SMTP id 136-20020a2e098e000000b002110b902242so4041477ljj.20
        for <soc@kernel.org>; Tue, 26 Oct 2021 02:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sbYrCs8J0Q0Rz6cp+rkJ/lhh0zXOz8q9lqlVQx/f+TQ=;
        b=kxK+nC5Q6baehfZPqYtTmiA2fS0y/Y5i4FUK5owXa4wIh0A8LEj2gPoF881YcIJh78
         m4HpHbSBbjVH8mtjHFe/z+3hdhYGDavJg+4Qsgxz3EW5P65VEHvBeaT7swTlJWbN2r3G
         pBzAtnueZKvZMk3K4eeonqijMUL7lCYPJ5/m5It/s/e/UqCd/BZVFPnasGkORovzfAEu
         Dz2udf5AURgqAzMjCR8BuGgarVRz2nTszgGAt3M9ovLOyH3QfeLGXxHVUFsrWsBPjDh3
         sOF1W2hWer9++t4SWLk7UwzCzXUzFleefTf765aFO9F08XVDim86QXq6LsplAX3rErXE
         12OQ==
X-Gm-Message-State: AOAM533w4jNmZuQnnhgK7XxUUHe5IJt4owOKvmB7Ydgo0UeMsknf2MQK
	f8D3toNZj5OFGgcIMS12ojr7HybP9/zJtYpPT5HcqKRgaBBlzzVbCrcyYLjSqBsISC5PEMzv4BG
	PDmXxJPF83L/HO9Zy6G1cTao=
X-Received: by 2002:a2e:7304:: with SMTP id o4mr886886ljc.385.1635241636727;
        Tue, 26 Oct 2021 02:47:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKSsLVNoJZPREVg5VqEAatQtzjWaBPxJNdTK1B4zkn7s0ddrcueJak0ah7O3ADQwivq+qDAQ==
X-Received: by 2002:a2e:7304:: with SMTP id o4mr886837ljc.385.1635241636293;
        Tue, 26 Oct 2021 02:47:16 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v17sm113794lfo.167.2021.10.26.02.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 02:47:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] arm64: dts: samsung: exynos for v5.16
Date: Tue, 26 Oct 2021 11:47:08 +0200
Message-Id: <20211026094709.75692-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
References: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull.

Best regards,
Krzysztof


The following changes since commit 2b663ae7152f785732d35ce38ad20ad10aca3116:

  arm64: dts: exynos: add minimal support for exynosautov9 sadk board (2021-10-12 14:20:57 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.16-2

for you to fetch changes up to b2f217cc7fbd3e6a097021b8b663328a649ea232:

  arm64: dts: exynos: add chipid node for exynosautov9 SoC (2021-10-26 09:17:42 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.16, part two

1. Add chassis-type property.
2. Add ChipID node to ExynosAutov9 DTSI.

----------------------------------------------------------------
Chanho Park (1):
      arm64: dts: exynos: add chipid node for exynosautov9 SoC

Krzysztof Kozlowski (1):
      arm64: dts: exynos: add 'chassis-type' property

 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts  | 1 +
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts | 1 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi   | 5 +++++
 3 files changed, 7 insertions(+)
