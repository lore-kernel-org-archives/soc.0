Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86419C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 22:12:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5A77661076; Mon, 11 Oct 2021 22:12:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEA1761056;
	Mon, 11 Oct 2021 22:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633990331;
	bh=hLMpiPSinpSm92cYpliXqR70pqbO3U+LsX+eH78AnjY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OXGLnld+4EE51sJRVXXGyTrBfcdIRDthllQJf3PCJSMt6pkvv4nwd4nG+WXPxvetO
	 KQuTsRPHqD3SFakFiJSjo7Jn+ePe6gCXwCLW+AWfq05x4GopMzCaEew9w/ovE5KgVe
	 iLX7V/AwIuoocuhaTHMS0MceYxxzgNbUg5btUWadO/0PKv26Z0JNDeNNZZCTaz6IbH
	 j1F+gWT+oXKX9IMu3y2z1xFc9f8HkWsvMvp5yckxJBXLcbpUuawD2G0dRDEfVAtSe4
	 QaaBfINhryU2XoCMPFmLnnWwQLMRJepLriD8n3M619gyhUGmNt6T8Dc6uL7ei7fgbS
	 qRwpfRBh0duvQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 5/7] ARM: tegra: Device tree changes for v5.16-rc1
Date: Tue, 12 Oct 2021 00:11:46 +0200
Message-Id: <163399027759.3049179.2461909948926991497.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211008201132.1678814-6-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com> <20211008201132.1678814-6-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Oct 2021 22:11:30 +0200, Thierry Reding wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 86d3858e601d52b791eb8309ada610369a85e95b

       Arnd
