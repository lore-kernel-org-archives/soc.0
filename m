Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F2DFA3745
	for <soc@archiver.kernel.org>; Tue,  1 Nov 2022 11:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2F05C43146; Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1021C43143;
	Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302217;
	bh=JdtNtt0ovGKYaZjntlTZkdskcNI4aw6YgJC7QDPAVGM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QzfDNvPtVX04R6v349DF+Mz2rTZ4yPrMSVe0zXBcn5zVhuj98R4LpMruHZU6J6OWd
	 QCZIvTvkdhZsxgd2xjqN3v+udyKO9Vuxn7K9I1ElaJBWVwUycE+7cbqyRhDQzslTGC
	 ItwX0/bYHIMK1y3JwrWjnWehJr+4b96wpHhGMHPWF7eA70gz8Ass57Rd5ReO37Lg2h
	 ZwRLgqRFmo85EpAJnUj1qREd4INcO6/PPTYOLTAKv+DUs7a92V9CzJ++3UHWa++S0w
	 J/f8c7NR0KcCAd8U3iqY3LzJIA6uzac5aSpdvwaMwe+u2/QXyWQMjEswDqXxMZxpU4
	 80DesgvPMmGhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8095E270F9;
	Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Update HiSilicon LPC BUS Driver maintainer
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166730221774.4100.14219257224440213623.git-patchwork-notify@kernel.org>
Date: Tue, 01 Nov 2022 11:30:17 +0000
References: <20221028105434.1661264-1-f.fangjian@huawei.com>
In-Reply-To: <20221028105434.1661264-1-f.fangjian@huawei.com>
To: Jay Fang <f.fangjian@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 28 Oct 2022 18:54:34 +0800 you wrote:
> Add Jay Fang as the maintainer of the HiSilicon LPC BUS Driver, replacing
> John Garry.
> 
> Signed-off-by: Jay Fang <f.fangjian@huawei.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - MAINTAINERS: Update HiSilicon LPC BUS Driver maintainer
    https://git.kernel.org/soc/soc/c/a0e215088ef4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


