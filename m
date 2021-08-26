Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F69EC432BE
	for <soc@archiver.kernel.org>; Thu, 26 Aug 2021 09:35:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 45A54610C9; Thu, 26 Aug 2021 09:35:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFC52604DC;
	Thu, 26 Aug 2021 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629970508;
	bh=ly4yxmgq1lF0OXbu3ixVqYdKtrdpDwk+tGQ+swQjkh0=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=VaiHTHU2hb/9LvMxCCppfB2JCzlSshpZ28BB6G2c/cFdnDGo5r6OoYtH7l09oN1i3
	 2DsjHWd7K+f5H61S4g8QBdmF9j23vRV7HZGisDHW0WDwRvv24l3HICtSDf+LRIXvOJ
	 YGVeklf3PoquKuF6ZPr6vKgYyt3g3j+e1k0822EYEnSNxSvr6G7+IxJoe91odkPGDS
	 EuvH1/kvHxaUyNskatl+7/6/QPIm2zpeXiOrtd2/bhRBq1L6vCcHHxyIUzamLa6TUC
	 f3eY3xrd/KGCOcVqGv+1cG4U+2mrhhwpbdzMhSDhV6YK/rtZkAqlmO+W4cMD18C0A1
	 W7JMbcDqBZSEA==
From: Arnd Bergmann <arnd@kernel.org>
To: arm@kernel.org,
	Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip driver changes for 5.15
Date: Thu, 26 Aug 2021 11:35:03 +0200
Message-Id: <162997049860.837527.581297114646598072.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <9718620.EvYhyI6sBW@phil>
References: <9718620.EvYhyI6sBW@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 22 Aug 2021 12:15:43 +0200, Heiko Stuebner wrote:
> please find below (and in the next mails) changes for
> Rockchip platforms for 5.15.
> 
> Please pull
> 
> Thanks
> Heiko
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 9b3878a99ad606fe76a50a290273d7b801f0f895

       Arnd
