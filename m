Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B18C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 15:02:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1BEBB60E78; Mon, 11 Oct 2021 15:02:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D03760EE5;
	Mon, 11 Oct 2021 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633964538;
	bh=ZwyU3N2J8Mch4TU5enEk7erjv+XsI0J96pO7Gg5w9fM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NTuVqc6eNk0Disrm0oLxiF2buro/TewyXJFX6pbDUZG4BI4zXi/OuUExu3eZOk7qQ
	 35/Mho+W+OMNkocKuk3e081wIaSrsmGaoRWptvPmvN15Hvjc0Rif1ySNnzKFi6ScvZ
	 0T3BZbcu+CJfX2mYTZZlV3pxvymlhLRl3vAikH4I64a1m0jdlyZ8vNo4+iCL8g53XY
	 HgmOVQ8L9dqYkD8JaIPy9L6E4bBGi8Rwy5qlW/LIqu0GLkJLrzXWYKrmWgNaD41EpT
	 Ng8U5++s0pnHkfuA1tbpdYHAvLJmqwR+YSijnjtrpFsCeogkORBwNKQvUVkZkmvDXD
	 +7AKwu4wMQVnA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/3] Driver changes for ti-sysc for v5.16
Date: Mon, 11 Oct 2021 17:02:12 +0200
Message-Id: <163396452142.3536460.5044992421827827368.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1633950030-501948@atomide.com-2>
References: <pull-1633950030-501948@atomide.com> <pull-1633950030-501948@atomide.com-2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 14:02:43 +0300, Tony Lindgren wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/ti-sysc-signed
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 030f4e72aa9cb92a097022f97792154f42901feb

       Arnd
