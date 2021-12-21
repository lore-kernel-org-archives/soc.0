Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34D7C433F5
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 06:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E26BC36AEC; Tue, 21 Dec 2021 06:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6903C36AE2;
	Tue, 21 Dec 2021 06:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640069834;
	bh=i5HZXm9KnQqtVU9WtekwIxGw4tIom1ZJSLEA7aZ+OOw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Cg0RS9PBlwIwtLxR9qDHjHYxPp1soJnL1NX0erLBPNU4UJ4/XJ/k/lNKWBUlxPEBf
	 zKteiOzviBtCvC6alfiPUzHpLRNsBGPyS+ddR9VG9dl5d/cdOMyq5dd4ClHXgTF0cI
	 l/oZoHXt9zUC0o8YDLFuyF17gJMR7vD/gkjyFmjujsT8b8A0FQ0qBO6D1Wm5Utn2ux
	 AMKMF0THUIR8sDwpTCTpl/Nq+WsuzAsvDLJQp8xbKWckZcb7e244a8JZOJAgH42hWa
	 fVju6jTT9lL70rBUEsnrkyDAAsJXPoJy8maAX3PS5SE96jiThw0p+D55fI0VlPAKTC
	 dFFoE18PWFFTw==
Date: Tue, 21 Dec 2021 14:57:08 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL 1/6] i.MX drivers update for 5.17
Message-ID: <20211221065708.GB14131@dragon>
References: <20211218071427.26745-1-shawnguo@kernel.org>
 <CAK8P3a0Pi+9tNTfaNjKCLH1f3Ge4YLW9_7o1ci1RLeuTOVEbkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0Pi+9tNTfaNjKCLH1f3Ge4YLW9_7o1ci1RLeuTOVEbkQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Mon, Dec 20, 2021 at 05:28:04PM +0100, Arnd Bergmann wrote:
> On Sat, Dec 18, 2021 at 8:14 AM Shawn Guo <shawnguo@kernel.org> wrote:
> >
> > The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> >
> >   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.17
> >
> > for you to fetch changes up to 7f511d514e8c34b6dd0c17b5496e48b2a6a2626c:
> >
> >   soc: imx: imx8m-blk-ctrl: add i.MX8MN DISP blk-ctrl (2021-12-17 10:53:20 +0800)
> >
> > ----------------------------------------------------------------
> > i.MX drivers update for 5.17:
> >
> > - A number of patches from Adam Ford to update gpcv2 and blk-ctrl driver
> >   to keep i.MX8MM VPU-H1 and i.MX8MN GPUMIX bus clocks active, and add
> >   i.MX8MN display related domain support.
> > - Add optional continuous burst clock support for imx-weim bus driver.
> > - Call pm_runtime_put_sync_suspend() instead of pm_runtime_put() in
> >   gpcv2 driver to prevent a sequence issue seen with i.MX8MM GPU and
> >   MIX domain.
> 
> Thanks, I've pulled all six tags now, but I don't know why there are no
> automated emails about them, this seems to happen for some senders
> but not others.

I sent the PRs in form of patches (manually editing) with 'git
send-email'.  I have been doing this for years, and I used to get
automated emails about merging.  Not sure what's changed recently.

Shawn
