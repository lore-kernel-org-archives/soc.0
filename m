Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90864C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 19:24:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6B94D610E7; Thu,  1 Apr 2021 19:24:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95CEA610CA;
	Thu,  1 Apr 2021 19:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617305081;
	bh=kwIIVm/ibuTPTbL18bgF2gp/43QD8aXJNRzVf7+wZYs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LKWtphVpn78VUOoOX/dN2T8hKHN2BIHqc4SJqgwkvYkFIBzukE86+rs1HPRknexQw
	 Ez4gXyZlIqRHzpwvFFc8JmeZ1FecdFGgp21N9OkQJBTYE7dg2Y2aLTaSCGtnAeya8Z
	 /JvimxaSp9GwoviiIJUwc79sl1Z+4PFotNu/wXgXl7NGAbV76hCrgJaCW5znpDYNR7
	 O+Kro3c4fO+8Ez3IsKMyzgWel3wDlL4TnLLWNH5A1EVWE4erIweG1apVTq0h6Aqlnu
	 S6uAAWmWx/KN9JbVSxtcM3e1Fn7HfBMSqw8Mw7dsII7lK4QMZrgos7i8PogD6c+gnB
	 IK+KTsJaOLN3w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-omap@vger.kernel.org,
	arm@kernel.org
Subject: Re: [GIT PULL 1/3] Driver changes for omaps for genpd support
Date: Thu,  1 Apr 2021 21:24:18 +0200
Message-Id: <161730504480.632809.11230034462236012550.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617004205-537424@atomide.com>
References: <pull-1617004205-537424@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 29 Mar 2021 10:55:20 +0300, Tony Lindgren wrote:
> The following changes since commit 4c9f4865f4604744d4f1a43db22ac6ec9dc8e587:
> 
>   Merge branch 'fixes-rc2' into fixes (2021-03-08 11:34:12 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/ti-sysc-signed
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 1d79dca631e8e7fe886f44f49b1e0a16e1ac1dfc

       Arnd
