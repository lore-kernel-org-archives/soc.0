Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F6BC432BE
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:34:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 56F2960F4B; Mon, 16 Aug 2021 21:34:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8D9660F46;
	Mon, 16 Aug 2021 21:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629149647;
	bh=d80uXTMxW1pO0QATDsUyZ1RBrTniSVeKF84TRRg5Xes=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ksx3zfUnygjrm3gOr5Pj6kikv5zP/Onn8pLSAaZ9Q0PCrcgS+RDoMy7yJqo43T28f
	 YNgTAYfeF4kbDyqY0S39Hmd0h4qbkatGGr3OnaXcv1Nml2L+UcG3PKIoZG2dK2EOtC
	 6O+JytFW5br1030Rn/nymR2MxCe11xx/+Nh7RI/pfive1bpwZbW1xFesrvCH/JaL7z
	 9f4nrCyR44+vzANFZlcCrijgDfKHGuLibsIootYbEVmmtLFLSmtsS8MFr2pCzccceK
	 r7+lZI++/WDPJUT+sE0VoKtMvhxKx/NgOQ4zCzIRmvHLMW8dKJjk4et+cy+C2/47Ek
	 Ouq9lgz0I+thg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL 5/6] ARM: tegra: Default configuration changes for v5.15-rc1
Date: Mon, 16 Aug 2021 23:33:56 +0200
Message-Id: <162914958916.240013.16079818037354285640.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210813162157.2820913-5-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com> <20210813162157.2820913-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 18:21:56 +0200, Thierry Reding wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm-defconfig
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 03bc43c09d0cd7f4a7813b10433d653ec5a02b09

       Arnd
