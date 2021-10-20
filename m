Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E96C433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 21:26:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 075366138B; Wed, 20 Oct 2021 21:26:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0906E61372;
	Wed, 20 Oct 2021 21:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634765188;
	bh=ILFqD0hIgtQRhj/iA53Be2tsfeuZQD08Te1lqGwHYRU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pMGMuMhq4jTWatJY6e22EPiZeUsnz4OZ56VRAfo7gINu8AOjMozffTsM/lNkPMWGj
	 yzX7BHGcCQN4rOuuj4HLziNH/1MTstq9CfzbIdDMe3shjHnv8GILjTMfCXLa/TRpb+
	 REnYeaEj1047ana7ONe4KB+cr5xD/MfuLNzaLAzdxSdgu/3VLDT1PfXKWatRSE6r8w
	 SLISX4ruEztChf2t4/NJeUGSTEqxuSXMpvB8zly6+haaTvNXrWkLcepdmP02Zx9CAI
	 +i81KbG/JRrmUQfhrP+VBahOiW4ZQ2/62F/lTKoFAnppVS5b2cFgSd0ic5nf/trsC2
	 pLMRuKqzQN/6g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	Li Yang <leoyang.li@nxp.com>,
	Stefan Agner <stefan@agner.ch>,
	kernel@pengutronix.de
Subject: Re: [GIT PULL 6/6] i.MX maintainers update for 5.16
Date: Wed, 20 Oct 2021 23:25:53 +0200
Message-Id: <163476513260.4063285.15086446429701644695.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016140138.1603-6-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org> <20211016140138.1603-6-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 22:01:38 +0800, Shawn Guo wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-maintainers-5.16
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 17c129caec5de2190dbf469ddee78ff0d182b379

       Arnd
