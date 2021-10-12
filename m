Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2F1C433EF
	for <soc@archiver.kernel.org>; Tue, 12 Oct 2021 12:50:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D29CC61074; Tue, 12 Oct 2021 12:50:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B2036101D;
	Tue, 12 Oct 2021 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634043055;
	bh=MmqGAEecEaJAEfwS1MqqZ9UO97KmaSLGVlpKcO2amKg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gA7qf/Ht7/gD+dddW/3V/k4v7KiYpXZIukgezstljSS3i+rgIthvgF30DlUp+9BTF
	 pG6tvH1ztq7EfOz87wPQoUkYoKhc+2H2sAW2EvugwcyvUNnvLpa45ySGIQk16YT79m
	 KEqIQtkNBHX+qvvuKNIq9RrmUBwOMQKVh8bxIFJHbFcypHW2RMItA+fpdj/DuhZuIi
	 r4WKI64Q1b5mvGnVffx5ApBok86dL0Jzis0TTAUDgr49HXz++rqUCIoODcGWA7Nuxp
	 06I32xlelcb3KyFNZ/293JRVMify97njoBzGxnt9g9i1uGgS+y4TEHb3DqYu1ckRU3
	 nNpT0SNH4MEog==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	arm@kernel.org
Subject: Re: [GIT PULL 1/3] SoC changes for omaps for v5.16
Date: Tue, 12 Oct 2021 14:50:52 +0200
Message-Id: <163404304082.2051682.16762434650479553122.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1633950030-501948@atomide.com>
References: <pull-1633950030-501948@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 14:02:42 +0300, Tony Lindgren wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/soc-signed
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 1f1c2323de8f9ccf89cdf63ae3c1f7a92bc19869

       Arnd
