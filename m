Return-Path: <SRS0=TAJ8=RM=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7FCC433EF
	for <soc@archiver.kernel.org>; Mon, 27 Dec 2021 11:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 429CEC36AE7; Mon, 27 Dec 2021 11:30:21 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3993C36AEA
	for <soc@kernel.org>; Mon, 27 Dec 2021 11:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3993C36AEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 715963F1F2
	for <soc@kernel.org>; Mon, 27 Dec 2021 11:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1640604612;
	bh=aWHjr9hGiX3Xkq17ZpqoeHCadE3NVT5LQHwejDb2nGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=XeRhOYM4+t0pxs2rOT4djeQD0GiEZJFp9Yv/pf/6T8lBHafJAch9Jz/eaMS8R3Z3o
	 3jkAqP39xmGYLkQN7MXPyjdyhTycgXNebr1omCXR2om6jsL2ExtmcSbgy3KxfgFVhj
	 hfMZ/zoK5CRuyko8nfJ+MFQvBRaXK/99CkfJabOXCyBuT8IBrh9oMPqRWsnC9kj31K
	 384+xZVgbXyHPHYiTFv/rbTRATCkJb1l7PeTg3ZgDf3m5cv2njXnMIhc066vnCSQoW
	 hF2GQXH3ehJkXBs6dyW3NgvPNgJDEvxAnGfUQsUDbb6/auEJjr86m8VjudZOtIyFls
	 P/DjnKj4ygAkQ==
Received: by mail-lj1-f200.google.com with SMTP id d12-20020a05651c088c00b0022d989d91caso3905471ljq.20
        for <soc@kernel.org>; Mon, 27 Dec 2021 03:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aWHjr9hGiX3Xkq17ZpqoeHCadE3NVT5LQHwejDb2nGg=;
        b=CfP6vRbiHVQ0ZcW9c2o8C73kAepEXDjfdW7OH4/02V4hj+kIpn7CALcjmILOnOuMQZ
         UKXSx7a1v+aN+Z25yn/vPpIvenriaYWm0ZC1L3m681ojj+Gpzf6zp+fPqPZ9AWaXxLWb
         2lrHFf0pY5wqHJuy6WlPuX6t5XHKtaZ+BQmui4wiJT5pYkkjDYEoyr8HIUtcN/jU9FYh
         TmnJqKGaCCEr3q7bxiGCVa70Prv5wgFlYKGJAZ+YXkKmiA+9ET41YoPUMv1xy1cB/omR
         28glzgAyu2UAE3fi5dBXEvQ+6sPcnXSnEIdGzQDTHYXo6QYuZiVlHgEon15nIVSoDkdV
         G9WA==
X-Gm-Message-State: AOAM531PbzIJObHyx2PQk/4qg+SSe8dsGc31txtW6NU8QyLdYKcfnYC1
	OM1VhJR95OxtFkeKucebmU9QCeQUPaQYLYJ7jRleCdU3AxTroFQtXWOzfRCINebGF36Erx/+7Kt
	kMTkfMT1gdbEYSLFgw/TWg/Y=
X-Received: by 2002:a05:6512:b1f:: with SMTP id w31mr15148511lfu.240.1640604609992;
        Mon, 27 Dec 2021 03:30:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqmovMOAurIAVtXtVAkod909IMEuDYkOk35Wo6mVXh3Ui2RjRndjpYwT1yH9TfhijrlWPqnA==
X-Received: by 2002:a05:6512:b1f:: with SMTP id w31mr15148503lfu.240.1640604609760;
        Mon, 27 Dec 2021 03:30:09 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s10sm1623075lfr.45.2021.12.27.03.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 03:30:09 -0800 (PST)
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
Subject: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
Date: Mon, 27 Dec 2021 12:29:59 +0100
Message-Id: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Second pull with DTS for ARM64, on top of previous pull.

Best regards,
Krzysztof


The following changes since commit 51b1a5729469cef57a3c97aa014aa6e1d2b8d864:

  dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850 (2021-12-20 10:35:32 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.17-2

for you to fetch changes up to a1828d772e0738c30a383a7d335aded2f2baf908:

  arm64: dts: exynos: Add initial E850-96 board support (2021-12-22 12:31:13 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.17, part two

Add initial Exynos850 support and WinLink E850-96 board using it.

----------------------------------------------------------------
Sam Protsenko (2):
      arm64: dts: exynos: Add initial Exynos850 SoC support
      arm64: dts: exynos: Add initial E850-96 board support

 arch/arm64/boot/dts/exynos/Makefile               |   1 +
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts  | 195 ++++++
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi | 643 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi         | 759 ++++++++++++++++++++++
 4 files changed, 1598 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
