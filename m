Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D21C433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:50:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CAD6C61154; Thu,  8 Apr 2021 15:50:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8136E61107;
	Thu,  8 Apr 2021 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617897034;
	bh=KoY+5HON/Q46tIuLclEUxpT3sK+VtgaqdmsDZ1iaPms=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pik3KF3UH/KdV2vel/b+WGtTmcZMjlVFeB12oU+1dZ49kZSDCK7Suza5xJ8u4ROlj
	 S9thmD4Kpnr2pk2WKPh9irl8IXAXepzS8E3v6bEc+zUVRubUSpX/UuNUNpPh37S5jj
	 Q8ZR6w2sd0/xbDj6rsqqTldSnX/i13jkgBBFocd/fBA0eMNBdfb9R0dgM4XN2YC2Lg
	 n8xo7cLcmEpM2wYSWe8Wenf42q9aJOu1/ovBw6BNalsFFaSUWuu/4EKsD+zsbYWeDo
	 gOruvxp2s3MJcOCbYC5D0rYeC7GvMSDOz6i4hiqK5tmtvbAPUGC08NYXsDNz+tKN00
	 KNeiPcCfWUtgg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [GIT PULL] Allwinner Fixes for 5.12
Date: Thu,  8 Apr 2021 17:50:24 +0200
Message-Id: <161789701009.1636297.18213875716036354287.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <9972a85e-60b7-49f4-a246-db3396dd4764.lettre@localhost>
References: <9972a85e-60b7-49f4-a246-db3396dd4764.lettre@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 7 Apr 2021 13:45:29 +0200, Maxime Ripard wrote:
> Here's the fixes PR rebase with my SoB added
> 
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 974be36e1ca987a1940eb6894a2b5bb631049791

       Arnd
