Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFCBC4321E
	for <soc@archiver.kernel.org>; Mon,  5 Dec 2022 17:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DB16C43470; Mon,  5 Dec 2022 17:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C195C433D6;
	Mon,  5 Dec 2022 17:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670262015;
	bh=m8lsOkbuhCHowf6A8+qTvrWP75W0fqlNYVGexOCwpkU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=avnevtVXW10iPn4j+jlTqFGXyhexWLe42W90FacEIXhwASKvA/LwjHtsNoUfpTSDf
	 lu3OjRI2eSXydIg1I3MX/O/9LMmBXIjIv0tVOjnM/CsJxKEqVm4NrhZUOc2fdEzpXQ
	 lF3gx1/Uu9gC/p7PbOYbGLUigg3pmSQA7k8x94Ls07I7P7UYpsYnvf/D6jnvyWhg9D
	 tlk9aSMtKVKS2tyAvUWqyVIKzfA9LIpgZC2TrPFAXVDgwMZNSFezXJfBQONTIYCUXz
	 8qayj4dusFbUanAG7t/YikY2Uo9s4AOBlwgeQmSFo9Ppk7+dRxOu/J4tymrC/Q1pkA
	 6r7UQb7cB/yJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 535E5C5C7C6;
	Mon,  5 Dec 2022 17:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] soc: fsl: qe: request pins non-exclusively
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167026201533.16328.12288656896762023562.git-patchwork-notify@kernel.org>
Date: Mon, 05 Dec 2022 17:40:15 +0000
References: <Y400YXnWBdz1e/L5@google.com>
In-Reply-To: <Y400YXnWBdz1e/L5@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 4 Dec 2022 15:59:29 -0800 you wrote:
> Commit 84582f9ed090 ("soc: fsl: qe: Avoid using gpio_to_desc()") changed
> qe_pin_request() to request and hold GPIO corresponding to a given pin.
> Unfortunately this does not work, as fhci-hcd requests these GPIOs
> first, befor calling qe_pin_request() (see
> drivers/usb/host/fhci-hcd.c::of_fhci_probe()).
> To fix it change qe_pin_request() to request GPIOs non-exclusively, and
> free them once the code determines GPIO controller and offset for each
> GPIO/pin.
> 
> [...]

Here is the summary with links:
  - [v2] soc: fsl: qe: request pins non-exclusively
    https://git.kernel.org/soc/soc/c/66310b5a0fc1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


