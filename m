Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83F8C433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:50:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CB4856135F; Wed, 20 Oct 2021 14:50:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAF3C6138D;
	Wed, 20 Oct 2021 14:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741454;
	bh=LbRl675vs7y7YIAIXrMfJo55cxD8XyI46R8ykPvw6FY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NzON+p3UfHzD3XnD+RNyQU32U1qfcBNseI8FNhmOjq3XPjuuHQEKAZFLbaCK3rbGV
	 Z5kDF77hND+MhDBknZM9GweZCtr2C1hHbRJ/Qs3CHsKr8mEzP6ljsi9y2C3xmE8SKk
	 hi80iCDux0GUXg+zst4xEUViBoUFD7jqH1RbHKJ8KJqa0XfLN0Vz08YAHk3syDvMFr
	 shT8tVf0kNkHeYW7OD9pLkUybDzo9jfAg9K2rVYWrbhDQGuZongUam3jE6GWOtzbBn
	 dp3XyX8ZcmbXcyncNT5CPX43mrXNCoYJDfdedKvS6BJSheo/6l6Uhmpe2rqPnnLoco
	 8vt3NYGfdW62w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-imx@nxp.com,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL 4/6] i.MX arm64 device tree changes for 5.16
Date: Wed, 20 Oct 2021 16:50:20 +0200
Message-Id: <163474139801.4099414.5410543268368455309.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016140138.1603-4-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org> <20211016140138.1603-4-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 22:01:36 +0800, Shawn Guo wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.16
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8d2214d3a64cdbe5d1b6e1afbcc3ad4d5ca0f396

       Arnd
