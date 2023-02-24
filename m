Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84358C64ED8
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 09:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 674EAC4339C; Fri, 24 Feb 2023 09:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9EDC433EF;
	Fri, 24 Feb 2023 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677230533;
	bh=sdity4NTo8Pmm3rli7/crknvC0JpkESdwMpxg13DybA=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=DAYt4IMdzmVOydqnS6znwj0uY3tAPRI/ShXTIBv5IF3F28hcQ9RZ3wiKxTObNgfqh
	 hHhyisiparIvjrjNmA7vyKL3bD3AlNz+EYb1jzj29/gnJYnttIqY6HgPe4hAG8i8kI
	 Zkq3raTD57kk2pxuflDnPtqnBzj8fhI7LJLiBgIXCaXNCrn3ou04k/DkRnnl8HYhRJ
	 zthjI6yUwMjwIB3M1EQeDwZDeOx8j4FRm2Fko74WB/pVDEIwTkp/8cxF0TaZKyZAP9
	 l7AjDgC2YqEnHIaVPHiQA2V/899EhQn9PT8mlnLABPAI2fSy7U17sayLwym1h74LQB
	 JbXjb9pYuFLOA==
Message-ID: <d8172c80-a3a0-07f6-97ea-9130c49fab18@kernel.org>
Date: Fri, 24 Feb 2023 10:22:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND 5/8] leds: Add support for Turris 1.x LEDs
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-6-pali@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221226123630.6515-6-pali@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/12/2022 13:36, Pali Rohár wrote:
> This adds support for the RGB LEDs found on the front panel of the
> Turris 1.x routers. There are 8 RGB LEDs that are controlled by
> CZ.NIC CPLD firmware running on Lattice FPGA.
> 
> CPLD firmware provides HW triggering mode for all LEDs except WiFi LED
> which is automatically enabled after power on reset. LAN LEDs share HW
> registers for RGB colors settings, so it is not possible to set different
> colors for individual LAN LEDs.
> 
> CZ.NIC CPLD firmware is open source and available at:
> https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_CPLD.v
> 
> This driver uses the multicolor LED framework and HW led triggers.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Reviewed-by: Marek Behún <kabel@kernel.org>
> ---

+Cc Andy, Lee, Pavel,

It looks like entire review of Andy was ignored and you just resent the
same version without fixing anything.

https://lore.kernel.org/all/CAHp75Vcr6o2rm+T6Tr8sS4VXCLVHtmLPWy-njOKAvO4AcZoW=A@mail.gmail.com/

Your cover letter statement:
" list for a long time without any future movement."
is so not true.

You got reviews from me for other bits, you got reviews from Andy. All
these you ignored and did not send a corrected version.

This is not how the process looks like. If you receive the feedback,
either you implement it or you keep discussion going (if you do not
agree, for example).

Ignoring the feedback and sending the same version bypassing reviewers
is unacceptable.

Best regards,
Krzysztof

