Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4F5C433FE
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5C0E461526; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 40FE9614C8;
	Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633444832;
	bh=zq+mEj4wOKT4kUKbgOuYQFhKpvRnLP7wpn7idQ7n2TI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ba9ZXDv37GjQtJ0wgA5ECgYBnVI5GuuRHIWiGYg4HNWq2v3noCfPX9KUo8a5MYwJ2
	 P7BzbsNb70/++VyaHAOYwLcyvaGFb0dX3FiMn/TdUroCytj+RvphVTzoVxpYQPNVha
	 iupeozL4PGjPxU7wLeMgOiIhPG/ClGJzUKSK1xTX5xykxG6EGqxMdXZ+M1cZppm5hs
	 dT5ZWvhB1IH7/CBcKUvHWJ3yhN3154wno+VIbHLipn2yD5iqLJto9nVlB+Zwlwh9Ha
	 AXevdpR9dG0eEhXhcoPoQl+2Zcldms4Fp16CzoYjQbpnG64B964n01DsH9xRuhLklf
	 aE/OHz3thTqnA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 25C5760A1B;
	Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: config: multi v7 defconfig cleanups
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344483215.23473.5272536920383272965.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 14:40:32 +0000
References: <CACPK8XfTHOOksA8q7MeHW=7ijP_49iOyq1pDj2SQnqSBTDUoaA@mail.gmail.com>
In-Reply-To: <CACPK8XfTHOOksA8q7MeHW=7ijP_49iOyq1pDj2SQnqSBTDUoaA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 16 Sep 2021 08:26:14 +0000 you wrote:
> Hello soc maintainers,
> 
> Arnd has taken a few of the series through the fixes tree. The rest
> can probably wait for v5.16.
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: config: multi v7 defconfig cleanups
    https://git.kernel.org/soc/soc/c/cc98d7703988

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


