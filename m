Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD176C4167D
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 15:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98219C340F5; Fri, 25 Feb 2022 15:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8058AC340F6;
	Fri, 25 Feb 2022 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645804211;
	bh=/i+RH5epsMCiD3hUZam6ev4UTgIfx1K/vT2VhsmZVto=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RBSEhJf41c2Zfu2niL+oKGrKZFXmKAqDWrk34UhrKSRt5lPZHt0UsD2VsijrMSNOf
	 Fke0PzcOakKHxJvSmjxWB/5LRMapbAsIz0MzJOcpJX7BcXyaCAosndmXx7Ape0Iz6X
	 DJmKLUw0xffo71w9Z3Rliewo8sghZQkH5d7uC10B0ZThZaHl2PgFTe3hbju5nqVUqi
	 ykmtEQe8CdIangk6lZyw+bUgc9cD0vElqsbK9HzsoaytZ0yjj9EkXd4YVHpHl3E9LU
	 atVV6lpch1e0Ed5kdyeHJwzMbn8hAl/zL8nz4LarW5k88ISX3dPupExd5ORffLTnSr
	 eXvB26rjo65qw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4489FEAC081;
	Fri, 25 Feb 2022 15:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc/fsl drivers changes for fix (v5.17)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580421127.25553.4420347299523098788.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 15:50:11 +0000
References: <20220219012208.21835-1-leoyang.li@nxp.com>
In-Reply-To: <20220219012208.21835-1-leoyang.li@nxp.com>
To: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Feb 2022 19:22:08 -0600 you wrote:
> Hi soc maintainers,
> 
> Please merge the following changes for soc/fsl drivers.
> 
> Regards,
> Leo
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc/fsl drivers changes for fix (v5.17)
    https://git.kernel.org/soc/soc/c/c253bf70c657

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


