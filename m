Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F070C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 21:30:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 50BCF6121E; Wed, 20 Oct 2021 21:30:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5742A611ED;
	Wed, 20 Oct 2021 21:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634765445;
	bh=AiFsYIA6f06gt6RRpLBteGxRCVCZI1Vj7i9REFIzEJc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s21wpqPvSoosfjAxjPb0B0yTMmjMxY9BiyHObBgD84UQh4kJ6fjElXehpCpGdq7Vx
	 ILruSnl7piHJlG7ZV8dNKNJrW1JgdqEW4pBEFZCY6rtuG5vBxEka/K7SEGVlBk9tNY
	 ZmwwwSu/nG4eA8dXAXgVlt1n4zLXayFtYPaw19EVOsP+PHeHQr8wqU0fklDfF49w7m
	 +xuKfp++l79Uvf0Csf3RgHL/Y8/UbctcO8DVPr2zjXGVI3iSVKvq5NvY0w/OiZt202
	 KehEmwX0/OqiJ+XSqWiu2RnohTgz6Pj8eYRuw2/NLfqdwCWIFOZnCXD494fRQEuImB
	 5sQAvs74+y6Og==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-imx@nxp.com,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	Li Yang <leoyang.li@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 5/6] i.MX defconfig update for 5.16
Date: Wed, 20 Oct 2021 23:30:37 +0200
Message-Id: <163476542786.4156336.16607243920223748744.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016140138.1603-5-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org> <20211016140138.1603-5-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 22:01:37 +0800, Shawn Guo wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.16
> 
> [...]

Merged into arm/defconfigs, thanks!

merge commit: 48fe205ada2d6c6bc6a08154c1b797c7c237dd2d

       Arnd
