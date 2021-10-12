Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288A5C433EF
	for <soc@archiver.kernel.org>; Tue, 12 Oct 2021 12:53:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0395761050; Tue, 12 Oct 2021 12:53:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2649F6101D;
	Tue, 12 Oct 2021 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634043202;
	bh=Zea/rcCmhh7Fff0Xhx924YiVvYsVwhC0VK6LiSCleJc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZDJ6vwFLHX5N61u1mC/ZyL3ABtJ28oXzNI9hDjUM4tcL3CyU04EM4p5hxYnk4WOid
	 HsFC2AxfdKPryANSzR5CQ7OtVhh0a7+2IQciY000u5/e2CYraXARZopSufiveME9+2
	 B78m/m0LtOH9wlDNQXpFigMn3waawshTL4ppPN/sMkEJqK+CMdSb8rbbYLYtO4GhDx
	 ptYFRRkeY+o9haRpBI3NirIj4dSJCCD1lHi8npBWEax/UQQ6/a8BZ9GSZNPXE/b92T
	 SGDxZOU9OmcPrQkFx9EK5HHbQNeyC7pEiL7+11obkVpwC+cUtFx0UvdfttS80yOo1z
	 +4vFt/JMbtmHw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Nishanth Menon <nm@ti.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [GIT PULL] arm64: dts: TI K3 updates for v5.16
Date: Tue, 12 Oct 2021 14:53:18 +0200
Message-Id: <163404319366.2123613.33460515111591195.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211012120817.beqhp4tygnf3xyi5@wireless>
References: <20211012120817.beqhp4tygnf3xyi5@wireless>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 12 Oct 2021 07:08:17 -0500, Nishanth Menon wrote:
> We are still working on cleaning up various other existing device tree
> binding warnings, which we hope to address in follow on kernel revs.
> Primarily: audio, adc, ufs, display bridge.
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 96c7f32d17c0f1be464da3434f6ba5cb3a316d66

       Arnd
