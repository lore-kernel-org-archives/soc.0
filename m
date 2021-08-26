Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B068C432BE
	for <soc@archiver.kernel.org>; Thu, 26 Aug 2021 09:35:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DB220610C8; Thu, 26 Aug 2021 09:35:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E35C610CB;
	Thu, 26 Aug 2021 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629970510;
	bh=9Vn36W/nz6oOOrx0yZWOFYAFDurdQsSJPqzXxyS5VQA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HeL6pjBGp/gUqidh91ccO96wXpieE4nE3rBApAzTwAFSZcoiQT5B9YI7y5TWEuGM1
	 l2YwE7MuCLSkArr5vwue2OP2weo7lYB0IUaP3fII9tpKu7NxlCqww86mHkA3z34yGu
	 iqD4A3632j9mNYc8hcAgJprEMrelLkOZcMIVSKFchqCxRcF15MBnNLDSRL3H9Pt90/
	 nUur5ocMH2hYcCyPQTNBC1ji1k0LA4yieKdJQpMXAkv+9F5l3+CTvtUbNwbTrBAesd
	 Rufe90o03FT0Su1lUk+K8MGcIFY1XEV7c9p4iPX8FhAciyp4vf7TKekT0B0Q5ffEzZ
	 ByYLhyy/jysCA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [GIT PULL] Reset controller updates for v5.15
Date: Thu, 26 Aug 2021 11:35:04 +0200
Message-Id: <162997049869.837527.9579735591959657618.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <d42a75fc17ce718ef1b3fa4c5d3f5c7fb0bd2bc2.camel@pengutronix.de>
References: <d42a75fc17ce718ef1b3fa4c5d3f5c7fb0bd2bc2.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 23 Aug 2021 18:12:55 +0200, Philipp Zabel wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.pengutronix.de/pza/linux tags/reset-for-v5.15
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 06779631d18ff2901af604eadea0d7b2193db7a1

       Arnd
