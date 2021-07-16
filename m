Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8072CC636CA
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 66DDA613EB; Fri, 16 Jul 2021 21:25:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 733B7613D8;
	Fri, 16 Jul 2021 21:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470709;
	bh=RkIdMFkmULg3joPJGGPO4318+KhjAdgPxvf2niKsuXw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TJDKE9VlU2Y+EFKT7/s6M2wve7mAgE3rFrNxz4L2tyvRM8T1vUGF0D1+KiEVMgKE4
	 j9cV3dlHXltv/lG8ITFfrZWYYepBlSmh5+Ru2gRFOLZCd3Da0yAdRg/R3YGdEovlAP
	 7lEu0UmtFviCc1wjUsSO4dATHFCiDgUsZDB8aIXSOujzBfYILJKNzEP9S/7T/FTODY
	 omkuuhRhxVdKyV5ekCL+ECyS6WZaGKRP+06vcHLbNEUgkmQi3vuz/bt6KNwYDk1n3X
	 /Bqmm7+viRl6MgUNUhv8LFdBrBBzWHqbF0+UWWoHAvjsLIKBEwQdTuZcwx8cIpJ1xe
	 9OJ61GRbf7yyg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] memory: tegra for v5.14, late fixes
Date: Fri, 16 Jul 2021 23:24:45 +0200
Message-Id: <162647049861.3478428.5789458369320645844.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210625073604.13562-1-krzysztof.kozlowski@canonical.com>
References: <20210625073604.13562-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 25 Jun 2021 09:36:04 +0200, Krzysztof Kozlowski wrote:
> Late fixes for Tegra memory controllers drivers for issues introduced in this
> branch in previous tags.
> 
> On top of previous pull (memory-controller-drv-tegra-5.14-2).
> 
> If it is too late, I can send as fixes after merge window, but maybe better to
> get these into merge windows earlier.
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: b6e473d1e21262290b8e1a023eff9f091ab8041b

       Arnd
