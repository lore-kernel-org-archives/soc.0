Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F287FC433F5
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 14:54:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D380760E98; Mon, 11 Oct 2021 14:54:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 575D860EE2;
	Mon, 11 Oct 2021 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633964089;
	bh=+SeONx+qFJ4IgkySGTxq3TiA/eU6y5Oq2tRn7U8EWG8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l6ZQ07TvC0KsLyyFW7QCgG1N8p6+Pzwd5j5zd39doZG9VF+HtWlMCTnBlRH2LncIu
	 HahYybWIEnZFhOC1Hy5Hg3V195RtJ4QOqqEy0HyMCZkWUXGrEzxfjl0aYf+/7rvGZS
	 PFjynqpobNxpQ/C9e4Y+qukovFxhUd5PdAwpHsU79VPb5fxE+YcRMcTuRFhs+lTTXW
	 U6bmf4y1RKvwvwNotVe4O8V+ghAvQuVQ52i+7av9culuOW9xhmZZgBFNNsruTH8GIa
	 9CHveNkL0GW0iIBz4+1Pi/BCGCveMPORNQlkMdVfGVoQGGVdfvMFzodu5/ZZ/FMTNn
	 9z9dsUHCH0ZVg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/7] cpuidle: tegra: Changes for v5.16-rc1
Date: Mon, 11 Oct 2021 16:54:31 +0200
Message-Id: <163396399115.3170841.17824361993367334178.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211008201132.1678814-5-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com> <20211008201132.1678814-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Oct 2021 22:11:29 +0200, Thierry Reding wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-cpuidle
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 55ab5942316d92d70fa465c114846dba7b7fc0a6

       Arnd
