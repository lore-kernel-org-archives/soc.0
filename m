Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0342C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:44:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8721F6135F; Wed, 20 Oct 2021 14:44:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 866686139F;
	Wed, 20 Oct 2021 14:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741060;
	bh=kEBysfS/YBZVOGFNt6jdMv44BC+4gnb4c7TOErSvrNs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cUnG7a40slWx2KtXnwSau6VV5qIyWi2uGap9qXRdmCGgXRuLoODo6Ics92Na2pN1J
	 WlWHQKOK8KRtdZZF2IsBQapVwD+Ay7mu/guo9pc3x2SM4zMCN9KzX6wNYXUooVmw7n
	 JdEF2UFQ2N/Gg/fu4a+Hv3gF7/QikjNKo+tiMEv/SmgxhgvfuBxL7/Ha9cvAZK5jQk
	 amD7BTnufHxt9Fykvq+YO4zgt1T/5aDupcnFRf9VepGVTiioHN46v/DB7rcVlv7uFX
	 W7SVvFSIZVBpo8tLPwm9kA00LXXXPAXasOHS5Y/4T5clLjwssu9mERJdA5D21W2EQs
	 Ftz+j8lyGUNfg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	linux-imx@nxp.com,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [GIT PULL] i.MX fixes for 5.15, round 4
Date: Wed, 20 Oct 2021 16:44:11 +0200
Message-Id: <163474104501.3915621.6629377896939659320.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211018000958.GC25810@dragon>
References: <20211018000958.GC25810@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 08:10:02 +0800, Shawn Guo wrote:
> The following changes since commit a1467faa10414ab3d91be7ef6d2b11272ec00e95:
> 
>   ARM: imx: register reset controller from a platform driver (2021-10-15 09:38:06 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15-4
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 72cd4e3bde4e8ad178f9a698996275e20d235b63

       Arnd
