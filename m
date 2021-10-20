Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D34C433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:00:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1D5DD61374; Wed, 20 Oct 2021 16:00:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21A4F6138D;
	Wed, 20 Oct 2021 16:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634745649;
	bh=HAPxmvT5vMWojU4Nfnvqe7bWdj+84pKoOwup/E++ha8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qqZyCBU0xbB1WLR+QvKsH+KK6yRUvmqePzFQ+vA/iukv/v8GHmeYt3mlCyQCAOva7
	 dqAXWUuZZsxGIVihDFe9W/JCGJs4mu5KLr4+kZdGei6R1SiDXxgs3ZMsxo9ovI1Tk2
	 v71yMzZmvFqVUoRIAYuqMGFchfXwO4JMvLATHac/DeKb8B8z00eVSYk5qtYtiwoZWn
	 em0eY7Brfx2pNbj0qUJ4cX5RxahAiQhYCIWUgDW5JA5KgLuirBCr9tofaTOxX+U+H6
	 Rkupvxaewa08oOr7cbt9puBZ2XX0YvWcaZOKFsTkLPmSh7kZe+QWZYHp94J+oqYA8L
	 gKkVV3m5wmsNQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-imx@nxp.com,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Stefan Agner <stefan@agner.ch>
Subject: Re: [GIT PULL 2/6] i.MX drivers update for 5.16
Date: Wed, 20 Oct 2021 18:00:33 +0200
Message-Id: <163474562255.2274953.11163203221275152113.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016140138.1603-2-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org> <20211016140138.1603-2-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 22:01:34 +0800, Shawn Guo wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.16
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4a47ce1fab475285a21b4e291400221ca2ae50fc

       Arnd
