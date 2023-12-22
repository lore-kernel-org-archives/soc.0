Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF6FC41535
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E648C43140; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58438C433B6;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=Jn00kBp/wmMKDecI5WiBiI34H6pOWpF1dtU79h/PyvY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=d7LszAwYmbutTPGCLTq0pszPx1Rc/KH1onEWBjOv4cHbUMZ6NJEtramy3B/GLucI5
	 7zJJCfLUu+sg1TZ4hhe5O//5rgAsVIyEHxUmBS2Dm58Q7fhgolg7nEoYQcItOiNI7B
	 AMKKFKT7dpQkzKV56NIx5VAXRPFWYF9tbZ5pAm3KHIJDEcJaSzYuSxhV/18Gx/wqDo
	 EpW6H91ce8wosDVIRaijD4jkP6IN7EpDT4UvqUYgYgFIcj4kUP1/HIRfiIBDIfcKQV
	 lXn8EEx5qNrXSu5N7dmb9qL5RIGJzyuZmdFZteHge9IsV4CoOy9+xbD9pRwpdyQXtn
	 ZvZqv2/qlH9ag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 28253DD4EEA;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE reserved system thread for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646716.10550.10539067429725067251.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231211102600.GA571787@rayden>
In-Reply-To: <20231211102600.GA571787@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Dec 2023 11:26:00 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these patches that enables SCMI with OP-TEE transport to to
> reserve a thread in the secure world to guarentee that requests will not
> have to wait for a thread to become available.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE reserved system thread for 6.8
    https://git.kernel.org/soc/soc/c/9d0e3c5a3d89

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


