Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F10BC433F5
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 14:54:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 32B0A60EBD; Mon, 11 Oct 2021 14:54:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAC7760EE2;
	Mon, 11 Oct 2021 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633964086;
	bh=fW9ghGhlEidLIu7Ipct0Dbq2CoqrO4q+hsgNkfgtN2Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mY+zAmmMxPfTSTsGN3aYW7wHCfPns/4mgywBVVnZ2u+59m9KHGZRax/GJG9FZRcF+
	 d18XVWRAE79TBerimudLHvuW6u0f9WAX5jhA/Pi1s0nuiJHhBlBLW2GWWH9b09T32L
	 Ah84YP3Mh+tdF7Hv0fjUCCqBGOpbXwRD2+n1W/vXDexUwYbn+svaKxz8H0idh2ER2v
	 FCb/slodwAQpQDXzMYF/lsPJLSkvnZ2X9NYoxZWZe71I8nyAVnxMPzjZihYsxZP9h8
	 kCxd8iIBuXdjeOnp4hIahWjCdmasStgPCmoWvu8b3QJKojIJ2mKwVGshk/5XjnGVMV
	 EFJOzU3gT5Aww==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/7] firmware: tegra: Changes for v5.16-rc1
Date: Mon, 11 Oct 2021 16:54:29 +0200
Message-Id: <163396399102.3170841.8099826223685361931.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211008201132.1678814-3-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com> <20211008201132.1678814-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Oct 2021 22:11:27 +0200, Thierry Reding wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-firmware
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: e4fb7b44112d914113466ea28f38ad334ed00175

       Arnd
