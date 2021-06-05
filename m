Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F352CC48BCF
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5B2446141D; Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 443A961423;
	Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622933885;
	bh=xGkeKIjiYgHvIPmcUHVFyoVBtTyWuCDPjAU/rIAGgFo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cWQp7SImHHYfud+lrPMlzksEkXooSE/csdTClBf+SU09CMSNfPcoreetSFMdw+DNu
	 04Q1qsjMZIEklpAdLsfkyHpe8AckQtVim5L7oJ191jEmR+gYvL1w+XftqVMh3J1YUs
	 mlpjNCIim4hy5uYtzlTw0XpyK127BIX/Wg1FwMhXV/Z351VL0XydngSgGNF4Hr+vtZ
	 uBths3Rp+BbDu8VTiPGE+L9ScTIqDnvaSqCPZRY0M2qK9CwiNIk7GXGSS9lJVv4on9
	 gNCfHrn6O0vmkJIH6hCvl3of0w/iINpXv7MXIjy/VmsoCSPNuJI1SPgZcWKPCjjpf+
	 ppAkrb9SwSdXg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3CD3360ACA;
	Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293388524.32315.17110856873449750879.git-patchwork-notify@kernel.org>
Date: Sat, 05 Jun 2021 22:58:05 +0000
References: <20210518100712.GA449561@jade>
In-Reply-To: <20210518100712.GA449561@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue, 18 May 2021 12:07:12 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small OP-TEE driver fix which uses export_uuid() to copy
> the client UUID instead of making asumptions about the internal format of
> uuid_t.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v5.13
    https://git.kernel.org/soc/soc/c/7468bed8f850

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


