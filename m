Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97505C43217
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 57DEE61381; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3BB5F613D5;
	Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633444832;
	bh=7IjZIurnL7Bsl/1THs59ImpGhpIs2oBieHCYgS098Do=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JUNH6UyGKUafWER420/bIgbzruKc4PZC3rriqx0oYKVL2MO0GuZIr2Ta9EgB7Qtwf
	 QqpZOzaDLIwydiCo1BXoVoMiM5NKSuuWSDQCITSRTV0+U7j558ibm9BveeSHJsKfx5
	 kSQoKXWCezC74SpaTVTxyZtN3xWfO+8+Pel7+k/f1oATyg9qqrFDrDPKFYMBfS+xks
	 T3NaYDDhzc1Sz5ygIM7XKx6oxo+MK7jo6+1/IQLIIk196if4fv+VplkoUyNNcKtKMB
	 FaZ3ppFLvaltkpcF5fI1podkckXDSP2oP/r56HKioTeSeyxyaests8NpJ32IBNkSER
	 3vTZS8gIb7txg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1D01260A3A;
	Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.16 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344483211.23473.18172383623680954001.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 14:40:32 +0000
References: <4439872.CQOukoFCf9@phil>
In-Reply-To: <4439872.CQOukoFCf9@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 27 Sep 2021 11:42:50 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in the next mails the first stack of Rockchip stuff
> for 5.16.
> 
> As I told Arnd, when he asked on IRC, I've rebased the parts that didn't
> make it into 5.15-rc on top of 5.15-rc1 and thus they're part of this
> pull request again.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 5.16 #1
    https://git.kernel.org/soc/soc/c/0ddc52da0353

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


