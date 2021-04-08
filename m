Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7430C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:25:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AC56C61153; Thu,  8 Apr 2021 15:25:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDCE06113A;
	Thu,  8 Apr 2021 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617895504;
	bh=W//QrQinB9RvLIs6Kngjx44pLwCSh+McEfUidGVwTtc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DbRUEBpQmHzPKSvfDZxLZRsVNCPiSXo6XI5YaPA9UlwEx4zTl/edeuzDuu1epkvJm
	 BnbkXl98bKL7fihIWQDIz12/TfK9X5CnPhSU9EmWvlp6U5Ol12P/YW0ZRDSOqJQULs
	 iAQCJ+1mTsl8ifGa8W3PgVlZS5T7XrKbps6nz08Nuafpm1j7xF+kGwTmsWsHM7hqIp
	 VpnkVMKlSLQE3uf3GluOOEgWhkGy9pw/3Na8R6w+QUSF8MYVa9SGTnfS0J55gHhWHg
	 LgllSGm2cZvtMoSlmorkM5km0dJFdC1f7m4WE3atnRmcZI02k3C35u5E60wOaeCraz
	 v770WphRvbOBw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org
Subject: Re: [GIT PULL 2/3]
Date: Thu,  8 Apr 2021 17:24:28 +0200
Message-Id: <161789493801.1630479.6840938905799812191.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617703816-65652@atomide.com-2>
References: <pull-1617703816-65652@atomide.com> <pull-1617703816-65652@atomide.com-2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 6 Apr 2021 13:10:59 +0300, Tony Lindgren wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/dt-v2-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 36de77e35f3bc0fed0f1999f9c5731513be89a45

       Arnd
