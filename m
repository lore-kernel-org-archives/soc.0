Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7A8C433E9
	for <soc@archiver.kernel.org>; Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A0F0864D79; Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 866D261608;
	Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611703211;
	bh=4t2OkFpj7yMiOk5b2pMLADPeGdtq4dkYmqo+wf/DNbs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RbPnGIKbL+gqLRWq1JU5z8k3IfC0Y7an1aUK3mR+V7gh1zlhtZtjupC1A0uX1LO8E
	 0p4QvcAvxdktbArdAP3zH4j8fwgBgzjw7o4DYpvh86VyqLTBoYMlEDbadgrg6OwIr0
	 1GNq2xArGcaija/AlXacqD6B0stEqmrvu3j+s0uQEeYm25ooTh+JU1A5b5CjXm5bKP
	 qdQTaxk5zVEebxYfJ1gKuAP5kqt7GWpB1+4O7X93gRRARqwHC+zZp3cmlY/T/1vQ8V
	 ssmKdEMdsLX/5D0WQW9VY/en6a1aW4qolh2CIiSLNNpzDrk2V72kzjIPQucMkzkUfG
	 +MVnGOkR3/Jtg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 81DCE652DA;
	Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.11 / 2nd
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161170321152.26028.6069873234006296061.git-patchwork-notify@kernel.org>
Date: Tue, 26 Jan 2021 23:20:11 +0000
References: <20210125003357.yd72y4f5vcdnvhnr@toshiba.co.jp>
In-Reply-To: <20210125003357.yd72y4f5vcdnvhnr@toshiba.co.jp>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 25 Jan 2021 09:33:57 +0900 you wrote:
> Hi, SoC team,
> 
> This request includes the WDT / DT patch for the Visconti SoC.
> Please pull for v5.11 kernel cycle.
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: Visconti: device tree changes for 5.11 / 2nd
    https://git.kernel.org/soc/soc/c/cfd7eed90315

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


