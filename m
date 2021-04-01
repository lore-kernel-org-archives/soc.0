Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7661AC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 10:23:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 494DD610E6; Thu,  1 Apr 2021 10:23:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF56B610CD;
	Thu,  1 Apr 2021 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617272637;
	bh=NlzFEJnGo31nu4+3b3ZxFIOj1CRAeQgNnmnScf+84ts=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nHXYk+oUUyqi5lRKIAPZLnBOfjRmV3qSm1355uldps0T+ItrxLVNyRJs09IYST3Y8
	 c+a1qx2u4t6q94r9FeCS2l5qhUqIFWhFymOQWULG26PIk+wipNmVfh4yN3Bxa9DZ3f
	 IJwmQk+ekDDr9gQ/ide2+3E7ylWwqPodjcGcLlLjx3fowtNi/2MAWEZKSJaWrWzSVU
	 qVn9HXc/Abca875kfIEw9rKjD8u3LLgK07yLvawPDAFcOke1JEus7Nvm55JP9sT8ir
	 fVU1k+nuUaesj5+C9KF/pDwGxeFB7ZCICtlbByk3zxE243oqVDAyhisB8h4vUWEznc
	 VQhgQG9SZ4rng==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	arm@kernel.org
Subject: Re: [GIT PULL] More fixes for omaps for v5.12-rc cycle
Date: Thu,  1 Apr 2021 12:23:33 +0200
Message-Id: <161727243717.583633.17499890750529623246.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1616584662-702939@atomide.com>
References: <pull-1616584662-702939@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 24 Mar 2021 13:20:39 +0200, Tony Lindgren wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/fixes-rc4-signed
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 111a5a421fb770d0fc2e09f7d57eb2cbe51e3ade

       Arnd
