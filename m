Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2594BC4167B
	for <soc@archiver.kernel.org>; Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9DB5C433F2; Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4823C433D2;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671465633;
	bh=3criKW31cBuuDsdbBMF452oWk03a6LJ76y7vJz4xkr4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ilUZTxIvPo9fBT4Qjy0OJBQ3QX7dGe8gruW7b1VSbm+nOXJrAEDlFcUvU8inwv83g
	 vJbXYtIACSyJ9jnwn131ZGHczZw9ljiJxqvmUr5zpNDMyoSnRaWsDIhXBB+knjGvH5
	 1O6ozEp7o8JymZuQ2/kFzt4++13SOvLCtdQ1X/BU6za3sICzAVrqg7nK30ovadLRGi
	 Eb55ARO49t9zFBnjhKk6IpX44ZjNyK9lH5/9Qpb1y51ZxUUzIm9FC4t8Ajh131Fbbe
	 KHeFSHuoiiq1s0w3ZmjKahsW9FwIRs8yschUn4GF/aFx5EFFPHG9DU02kHA03JG2bM
	 IE7j0ntPBwErw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 85B4BE21EF8;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: fixes for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167146563354.24111.8885678317086169447.git-patchwork-notify@kernel.org>
Date: Mon, 19 Dec 2022 16:00:33 +0000
References: <af4c45ce-a150-438f-dab4-e47b120c32c4@suse.com>
In-Reply-To: <af4c45ce-a150-438f-dab4-e47b120c32c4@suse.com>
To: Matthias Brugger <mbrugger@suse.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Dec 2022 12:07:19 +0100 you wrote:
> Hi Olof and Arnd,
> 
> Please pull the following fixes for v6.1.
> 
> Thanks,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: fixes for v6.1
    https://git.kernel.org/soc/soc/c/b9cb6be06b56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


