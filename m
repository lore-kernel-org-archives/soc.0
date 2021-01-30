Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11DAC433E6
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:28:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7B51964E12; Sat, 30 Jan 2021 11:28:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF16964E09;
	Sat, 30 Jan 2021 11:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006125;
	bh=dVSnVda4MT9l96Cx6OEnwOmVlVkDiQdI9Xi2xdw1u6o=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DykrBR99H03dSBh96CY6FDgz8DalZdJwI+2J4Q/QEJ7PoJdRtW0UTe3Z5XFkbKUUn
	 eql8CSv9XFyiw0HlCWrFg/JPtE7q86oph0oXmp/xds0sMkblbAEjvacT7L4KF7VzNK
	 O0IiSmnqmM/JV205Z6aMZ/zJQOuoMs5ct4v4BKplLm1278lmAA99cRztnoiDj6HHab
	 sWbHglrgAJfC4u2MMwHmV02ukN0JJTuob3nb8S05fEE7rLmzIQzlC3KjxGmKYdV8kX
	 1WkX7UTvbAgVG+twEhLE6eTedlBSHw8GHwqgKE5V/pH2MOG760LQLZtEgP+tZnLnNG
	 yNJqk9dmmczRA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 1/6] ARM: tegra: Core changes for v5.12-rc1
Date: Sat, 30 Jan 2021 12:28:35 +0100
Message-Id: <161200610135.2091874.10659158425980310396.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 20:32:49 +0100, Thierry Reding wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-core
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 127523504fe89d0c060fa6e2b93b564d0216eb22

       Arnd
