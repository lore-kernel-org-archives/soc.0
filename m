Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE9EEB64DC
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7CD65C433B6; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6719CC4339A;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=RLptjTwBSyWtBMxjfINyW4m67uK5wW7r3zGBHXgtSA8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ClE0ptImjbTwStCdu1X4isE4FPgnXJ3+LwW3PAJgDsbYJOjHTYZQUuchRTc5S4HZZ
	 muKbywZEbEF/zwiFulD9Qm+av7xeDsfltkdiFoTbyR874x9ou5ama/QZFHpSj2WTbF
	 beLUnkFgpAgPUqgirEResdQ2RqHPGR4g90sPjS3A2SsU28JVBbx4b9o59EHhVACI1f
	 dQKj+2aziZNu5oslVdDCe4RYYUXEpCPghCPWP/QEC5R1HxvMdwO3ovKQbqBaz5Yj6N
	 KbqHkBjr2b+IA+hxoQ5pbErUFFglVXVLhcnu6/0PdYMElZivXxV1zk84/MyVHz7t3A
	 wQZzD0E+dhs0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4A458E2A037;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL RESEND] arm64: dts: ZynqMP DT changes for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611229.12258.11762098560995485040.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <CAHTX3d+2s_KmCnd=x5hydGb+LYoznAzYGTizvqqN2NFmrBurfw@mail.gmail.com>
In-Reply-To: <CAHTX3d+2s_KmCnd=x5hydGb+LYoznAzYGTizvqqN2NFmrBurfw@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Jun 2023 13:48:57 +0200 you wrote:
> Hi,
> 
> please pull these changes to your tree. Based on our chat I am sending
> this request again because previous
> one wasn't recorded properly in patchwork.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,RESEND] arm64: dts: ZynqMP DT changes for v6.5
    https://git.kernel.org/soc/soc/c/5e64ee420447

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


