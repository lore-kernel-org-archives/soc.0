Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20598C433EF
	for <soc@archiver.kernel.org>; Tue, 12 Oct 2021 12:50:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E91F96101D; Tue, 12 Oct 2021 12:50:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C9A461039;
	Tue, 12 Oct 2021 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634043025;
	bh=9Pg2FRc0hGdmA3lT2GPlrQ9TDFhzdLnwHiDpCRugUkE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JxYXhDV8hBcCDzJb7WgCxFs4Am6Vg1NRecibuZppYSnAOiXclfO0WLeLnhtw2E94d
	 bNjcoS+Ys2n0NhbfShf3kEDb+EKtHbyAx7vu/JcCfpyC6vwb3sJK3Zb3WIIdYj8wh3
	 bUQSZeTCAU/kueL+Gq7YVDQILhdJpLog8ozt/8GZpUfjVFOhYHyoDYWhp8ESMZBLdo
	 YrOTYUUCksL/je1TxhbV53cENgJTjYyTcd1UA7phbb8OHBwHPmDUD2MPJyWkcPQcoJ
	 jguWP/WRGvcI8Mpjr7RmmBynBpUNUL/Li0IAD2eks3Q7C4Gl11uWQ1Ld3vkuVlLi9B
	 sLVa8uXO7kx9w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL 7/7] arm64: tegra: Default configuration changes for v5.16-rc1
Date: Tue, 12 Oct 2021 14:50:20 +0200
Message-Id: <163404301508.2030452.14712807439411628487.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211008201132.1678814-8-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com> <20211008201132.1678814-8-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Oct 2021 22:11:32 +0200, Thierry Reding wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm64-defconfig
> 
> [...]

Merged into arm/defconfigs, thanks!

merge commit: 543659b3121117acd1da5ff71ecb22243c657e1c

       Arnd
