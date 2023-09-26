Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1A2E7F12A
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 303BFC433AB; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A00FC433B9;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762233;
	bh=ZaC+tBH0IMiVEfDdpljuN8CAoFhOj8P2v4bGvS0Gn9E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=U9lhprQXGh9FWP6VMet4biiUHpDEVm/WRNs+Qqbb99it7/aoLo8JsguE197l2MbAO
	 59bypMqKDYYjhPUe7tfvhT3U4HtpnJUvELgcOuyItnSrLaFFzdWbP/epeYTOwzSkeV
	 QSmTxQrjM/ABMox5sm/ZgmTkEkvFjxwg6EN1M0WRfYQfQTzMghdXM8WImVdt/Mr6gS
	 Y47LnZyE6i/TonjkSjqLCDjJddNyE7vWm6BBElf3hdbaZVZEuV+fb8L16qZoQpIpf0
	 sEEF15jPxwBNO2+nGEThziuOUh4XHDJkW8a0U+sViW8sbSjRACCCo0bIkP+RfWLSG0
	 +0ls20RTKOwpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F38C5C73FE2;
	Tue, 26 Sep 2023 21:03:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Broadcom devicetree changes for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223299.24546.4394109960029795156.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:52 +0000
References: <20230818164539.2871539-1-florian.fainelli@broadcom.com>
In-Reply-To: <20230818164539.2871539-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Aug 2023 09:45:36 -0700 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.6/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Broadcom devicetree changes for 6.6
    https://git.kernel.org/soc/soc/c/44762a0c82fd
  - [GIT,PULL,2/4] Broadcom devicetree-arm64 changes for 6.6
    (no matching commit)
  - [GIT,PULL,3/4] Broadcom drivers changes for 6.6
    (no matching commit)
  - [GIT,PULL,4/4] Broadcom soc changes for 6.6
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


