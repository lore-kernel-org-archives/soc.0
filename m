Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B655CCA482
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D3B7C341D5; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1725AC341CE;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=PZxRHL7m52uG85C7j+UC25LHAihEuix01wTPzF3L3RM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Sxn8HeK1qrWzKWlEsTrpjZEIlsqJ2WpBqlM2ubIUOylPoPt9TAeCrdMgeUTl5la5b
	 p/1JlTtOL1y5Ln+WoGGUEF+5umKEHyOki1Z5TiDztfv3Ff/dd6LPK8MTWbfSPpWGWU
	 KgKSR31t/5HkxlwjVO5dEpCWMtsZL3AMVYLRrMdGhNNIeYPxBLxXbiLPcehlGpz05x
	 uEme8+bt/7jIHswxSSrz1xNSVzFQEq8po1EUqqKmZkNIrFd+yV7KcaSs7BXP6zZAqs
	 5atXTCw5Re3vge/EFlXjYQQG18xTvXzpgjzxuZj0EZj/uTdVL3XupgUgoMZN8H0d/d
	 pnxtPSET4DbWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8133E49FA0;
	Fri,  1 Jul 2022 20:41:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/5] Add Chameleon v3 devicetree
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809694.26141.4598667059443249770.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:36 +0000
References: <20220601154647.80071-1-pan@semihalf.com>
In-Reply-To: <20220601154647.80071-1-pan@semihalf.com>
To: =?utf-8?b?UGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1paGFsZi5jb20+?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Dinh Nguyen <dinguyen@kernel.org>:

On Wed,  1 Jun 2022 17:46:42 +0200 you wrote:
> The Google Chameleon v3 is a board made for testing both video and audio
> interfaces of external devices. It acts as a base board for the
> Mercury+ AA1 module.
> 
> socfpga_arria10_mercury_aa1.dtsi and socfpga_arria10_chameleonv3.dts
> have also been sent to u-boot:
> https://lists.denx.de/pipermail/u-boot/2022-May/485107.html
> https://lists.denx.de/pipermail/u-boot/2022-May/485111.html
> 
> [...]

Here is the summary with links:
  - [v2,1/5] ARM: dts: socfpga: Change Mercury+ AA1 dts to dtsi
    https://git.kernel.org/soc/soc/c/7e0ed53b074c
  - [v2,2/5] ARM: dts: socfpga: Move sdmmc-ecc node to Arria 10 dts
    https://git.kernel.org/soc/soc/c/cfdb455d1a54
  - [v2,3/5] ARM: dts: socfpga: Add atsha204a node to Mercury+ AA1 dts
    (no matching commit)
  - [v2,4/5] ARM: dts: socfpga: Add Google Chameleon v3 devicetree
    https://git.kernel.org/soc/soc/c/15596df74e58
  - [v2,5/5] dt-bindings: altera: Add Chameleon v3 board
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


