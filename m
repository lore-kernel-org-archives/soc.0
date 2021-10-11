Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C896C4332F
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 21:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1981D60F0F; Mon, 11 Oct 2021 21:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0127461027;
	Mon, 11 Oct 2021 21:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633989010;
	bh=hIqWJ3VyrkzTBztWtgnCE1mmZPHxEo58zSGgV/lzBpc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NNDL58nl/qLDJdsWYSGl0TFvrmor2H7SInx1El68fqdr8qTWmg82yLcXV0Hxsllfr
	 oVgBcTa3RELKbaa8cekJctRIwy3UcU1fTlQhnCiTJlRecBb/SoxQecYyeceaWHDRIW
	 YuH5ZwmrtEQsM7lXFzVTSzzjzGyxWGCPDzl72V3RaMy63FQGv7XRF6qJhByQp3r/o/
	 qr1gPC+YsvxHOfCjKdrdeD70jplA2PHhs8FVQvEswOJkPF3iIHVNDb2h10TcRmAQnW
	 wUuOmB5IKaE5fJC17cz3YsePE3n/EIIOdzVK2RyQCldOkrIcIRRCvZiaC3mbl79ISz
	 d6YNX9s2vidaA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E5A7060A38;
	Mon, 11 Oct 2021 21:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: dt for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163398900993.3472.6606280752491836298.git-patchwork-notify@kernel.org>
Date: Mon, 11 Oct 2021 21:50:09 +0000
References: <20211011123438.16562-1-nicolas.ferre@microchip.com>
In-Reply-To: <20211011123438.16562-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Oct 2021 14:34:38 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here is the first batch of dt changes for 5.16.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: dt for 5.16
    https://git.kernel.org/soc/soc/c/8071974c8311

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


