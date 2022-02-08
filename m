Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C720EC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4154C340F2; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E86DC340ED;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644312109;
	bh=Uw8rNH6m/2G87p6cwM9to43W1RrbrGR2FlPRznSRkzc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MsbKL5xZWVE5l+frEbrW4kyfO+mT6BnNHz4gbFcO/HqkD5C1aa1k8Cls3PVcBxTCC
	 JCidGiBqvXcp+sP9LpleZkDofOv+RAIVJewJk/JE+QSNHYosGKKfapLmAMLhfYPhaJ
	 zUjI+mq4wudU9UBLsr+h9zEiglooC+9D8QrVStca6AbpMdrrJK5X7vK5w/2yD96Nu6
	 X0JNFMMvXxuFVVAsAFNEd/NuZC57I/OtEIVkBpODkDlHX/DTVcLBIOz1uloZStdMRz
	 Y0k86QFbtI3UNYaH9LdppSRpERmqqmtLNgdmb/j4H1Tjh/XfU/UoQPqAP/SAoBh2/I
	 0yV9E16l2A4Yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 77C14E6BB38;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: TI K3 fixes for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431210948.18327.14845215456274923920.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:21:49 +0000
References: <20220204130716.fjlm4vvcbtzcwlwx@chalice>
In-Reply-To: <20220204130716.fjlm4vvcbtzcwlwx@chalice>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Feb 2022 07:07:16 -0600 you wrote:
> Hi Arnd, Olof, ARM SoC Maintainers,
> 
> This PR is a retry of previous attempt at fixing up aliases way late in 5.17
> merge cycle for J721S2[1].
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: TI K3 fixes for v5.17
    https://git.kernel.org/soc/soc/c/99c410e89ed0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


