Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AC8C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:06:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2093C64E4B; Tue,  9 Feb 2021 23:06:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5E0E64E40;
	Tue,  9 Feb 2021 23:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612911992;
	bh=rAcG2UB8Kq5DbCJSjMVawZ9I9vxStmotuOgB9Re6wVQ=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=TVshADiI4hTeKvjOr7t0fSVpfP39ybZfTYVPSvdzmtaD8rGwpS3houLoNGgFdcssW
	 /x+zFEum1H08HEJt0BE5yDDXQuWTIAziHVyEUz7MJQFxGkT3OgkUHxw2wefToh426l
	 b4i3potnZ6Rz8AIiQZ0bihtqq7l31zaTSk9tYgf5BTJii9CPB7yNmIocyaN+/HXt+E
	 dTiOi/1QVMvlcr4LxrE2eT45GLFs4pW1+No56KnWYc3uKSSN1fgrWrJedSzLMAGRI4
	 dJXYvDkXRkU1JTTZ7kk/tdMCRg4zlV7BZmidc7wTLy0gErS6KQ+5dTW9oB+zjKpdkS
	 Y//qV7EUC+Asg==
From: Arnd Bergmann <arnd@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Subject: Re: [GIT PULL RESEND] Rockchip dts64 changes for 5.12
Date: Wed, 10 Feb 2021 00:06:06 +0100
Message-Id: <161291108121.974605.14393901422512013571.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <12699743.uLZWGnKmhe@phil>
References: <12699743.uLZWGnKmhe@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 06 Feb 2021 11:18:18 +0100, Heiko Stuebner wrote:
> sorry I mixed up the versioning in the pull's subject.
> The changes are of course meant for 5.12.
> 
> Thanks
> Heiko
> 
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 889231c6c80113ad0929eea01e8272048be38552

       Arnd
