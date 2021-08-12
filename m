Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E7DC4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 20:44:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CEEA4610A8; Thu, 12 Aug 2021 20:44:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73EEE610CC;
	Thu, 12 Aug 2021 20:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628801064;
	bh=Ay3ro23lN4+Qil3LvptADinbyUKuwbxu40BoPTYL694=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6InRVE52u9NzsfkyFb67JtJSRIGVZX6lr7QZpFmcM3lTV67CNnov3gGn/DBMPEKW
	 Hoz8gXCQyyputUykxq94OKJ50OJB/VD9rrRpR3g3jSEhb9Thtpm3uiVFmMOVvd34GK
	 F5Jqy+Yj0QiR01/wRo4I6/gUK50iTC4n1NXAcwaQmsVilV2cEDtgeUol9/SZ0+IOX6
	 NarAGOZau2Ik9I3UqOyEyQteeodsT58jTrOgrc7eoLRXhAFzpTox9Vmg3LWzzYHCCQ
	 520WBwvWhfdwfSuJofwFsQwR+7LExtAUAmLzskUcSldNGiCN6Ecirs2jmFKOyfB+jj
	 N9WOh5dzXtHGQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [GIT PULL 2/3] Driver changes for ti-sysc for v5.15
Date: Thu, 12 Aug 2021 22:44:06 +0200
Message-Id: <162880092575.1372486.4843530883005898506.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1628153040-834155@atomide.com-2>
References: <pull-1628153040-834155@atomide.com> <pull-1628153040-834155@atomide.com-2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 5 Aug 2021 11:46:43 +0300, Tony Lindgren wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/ti-sysc-signed
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 74953a9136cfd650dd994daded520528f737b7b3

       Arnd
