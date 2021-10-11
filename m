Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D061C4332F
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 14:54:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0AB2B60ED4; Mon, 11 Oct 2021 14:54:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8018060EE5;
	Mon, 11 Oct 2021 14:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633964087;
	bh=pZ+xEJlsAEr0VTBwghNLcMmvrnqahk/7Ny9f+WldpfI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M8MgE1kCRF8wcwMaeyjJ9VXBi32ZUj0Qw7Q1OgB7RDuZAwiGOUur7Je0oOh8047Px
	 5Pgkoq7eTL3g09p9j0609Lr6zVpqdLG1vnTV4No3CVXK0jxehHxYC5QjhN0h29glHf
	 7HcEI1byvE92TOHXOLqSLXkLZsn0JdRUm9jidd7jfDwQ8rUaeMjmH3oXzYb0XGgP+T
	 9b5noTqTcbPDapVa+7m6BDOD9eTxuwSfVXOeHz5PHkOqXke3V2ecVViF1KRO5Upwbp
	 X9o/d89mUJu0GZCt9/vAndApwEhAccOzX7QJZaB1GEMIB09j3teZ6cOMZwcV8kI1Dg
	 JL0uGSSOT90YQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/7] soc/tegra: Changes for v5.16-rc1
Date: Mon, 11 Oct 2021 16:54:30 +0200
Message-Id: <163396399109.3170841.4569162737029202550.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211008201132.1678814-4-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com> <20211008201132.1678814-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Oct 2021 22:11:28 +0200, Thierry Reding wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-soc
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 94b847c76692b56ab9b9a76c62b831d42b23e18e

       Arnd
