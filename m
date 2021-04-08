Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325E5C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 19:59:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F378C610E8; Thu,  8 Apr 2021 19:59:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 219CB610E6;
	Thu,  8 Apr 2021 19:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617911969;
	bh=4es+1KMoU9lNNgg1FIobUbBgL3zReVBM1s+0Xrvnwb4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NshXC+XhVTUtR3Z4zXIvNZgI/K2MGb7xMf2cZbnCaiNRo/KGqm7gRwaG7SRBlTx4y
	 KE9ex99Uw0y7Qb/0rRO8os5381iL1alUtsig2FIPADpDvNyB4LhArk9iq5nRiFTEpj
	 jmyseoSoVuWMjXIhoGVquA9mx9pob1hI1mmrDOKeaXR0QHf5AOnL+UBCyhwiYY+r2u
	 siMgmtlQrwH8sqS6VLO2o8821C00chFdbWl5t0CRos3ycMUTg8mSe0TSOgcy7ZHzbl
	 hS2+0+eSlVPnacnSbHgvEjscPNo4TaFXlf8lpJ8Fqfcp0DTYey9s5mSAXK3GnG7uyW
	 a8w6b+cKfj56Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	arm@kernel.org
Subject: Re: [GIT PULL] Few more fixes for omaps for v5.12-rc cycle
Date: Thu,  8 Apr 2021 21:59:06 +0200
Message-Id: <161791193691.1658989.4646630397638417333.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617702755-711306@atomide.com>
References: <pull-1617702755-711306@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 6 Apr 2021 12:53:49 +0300, Tony Lindgren wrote:
> The following changes since commit b3d09a06d89f474cb52664e016849315a97e09d9:
> 
>   ARM: OMAP4: PM: update ROM return address for OSWR and OFF (2021-03-17 15:15:52 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/fixes-rc6-signed
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: b9a9786a13ea158ee3b23614217f2e3158178421

       Arnd
