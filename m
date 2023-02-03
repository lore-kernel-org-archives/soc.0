Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299D3C636D7
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED957C433A7; Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D267BC433A0;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434644;
	bh=0qF3w7SlpC7WpCeUwuzPnka2qHGRKbGfZBTBDRLRwak=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LHSfcKZxZA3XgAS7FOoHcIla2e3N1ZKyNc/rbwPEvDCFYMLzydNbchTFu7UqVt/gG
	 aqQ2YGpuaOOl7cGCE2w2+VsR/n8c+PDuj/vknJ3SFLljJQY0J0ztMI0y0P4gCeOFpU
	 +tOgkRoggjGL9VDXJNOxXOoMccaSbXhhEKsCVR4vFcY0OxWkCCJtiGATPYrIkE4ij0
	 x5v3TfREMZfWyfOQKuwjKxttsbbsM5F+oYghrBCmSUF+NDDCH4T87ZWU5KVSPi3S9T
	 GlCcv1sfTTyeSZ8qXgmsD5FGneSANcbP2wFwccJ0KMPp+UJj7f2SW8d627UyPZLtfE
	 ybbJlntCHOrWg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6651E4D036;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: mediatek: updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543464474.16250.8134307476202521008.git-patchwork-notify@kernel.org>
Date: Fri, 03 Feb 2023 14:30:44 +0000
References: <396d51fc-81f3-4a2b-d7a7-b966bfe3002a@gmail.com>
In-Reply-To: <396d51fc-81f3-4a2b-d7a7-b966bfe3002a@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 1 Feb 2023 19:21:27 +0100 you wrote:
> Hi Arnd and Olof,
> 
> Please see below for the list of updates to the MediaTek SoC drivers. Lost of
> things have happened.
> 
> We got support for MT8188 in the mutex, mmsys and power domain driver. Mutex and
> mmsys now also support the MT8195. There were several improvements for the SVS
> driver. Apart from that the PMIC wrapper binding finally was converted to yaml,
> this included some PMIC patches, which hold the corresponding Acked-by tags.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: mediatek: updates for v6.3
    https://git.kernel.org/soc/soc/c/426082a214db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


