Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E90CC433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:10:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 36DC164E40; Tue,  2 Feb 2021 17:10:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A415364ECE;
	Tue,  2 Feb 2021 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612285843;
	bh=PKt/QKrcZNakySp2MauPNrMbA0J8xetiZEpJ7Di6YMg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q1IJkiCxSTonj/oIx8hTZgnYiVzG82TkMjYXoMiFR7OI/P0Ud+iP6d+Fd6GR8IP1d
	 8gkb/Vc5eRc60l/Fbmo8W9lqWQoc7l6pk2uPXRHaA0rMh6cPwzWjzkIx6iReAcGofE
	 MEhiNNlGTa7qPjOMfiNQYHpZb7H9RheigfOqw8IpJqdilcbOUprgXug9o3YTFkb0uZ
	 CYK3ibVOQU/AFo9kSfY/FxY0srSXb0UvTEZL8F8pbphVSpwBRPy38JrZMDS03vNMcG
	 JBZ0Z1gdYjxb4RVfUzQGc1jU7VzqvO/PeIkuB83XiqRdcXGfLHhuo/YrPbo0xhNMq5
	 CrNBy2lD/PXPg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 2/6] dt-bindings: tegra: Changes for v5.12-rc1
Date: Tue,  2 Feb 2021 18:10:16 +0100
Message-Id: <161228552185.1852435.3798860010482421429.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129193254.3610492-2-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com> <20210129193254.3610492-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 20:32:50 +0100, Thierry Reding wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-dt-bindings
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 7d1734cfa3a7060cbd7f69d5d4b817c57a1cfe10

       Arnd
