Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC83C47082
	for <soc@archiver.kernel.org>; Tue,  8 Jun 2021 10:08:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0FC0B61263; Tue,  8 Jun 2021 10:08:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12B29610C7;
	Tue,  8 Jun 2021 10:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623146914;
	bh=wm2y0Largooha4aKi3qfuvMeG0kXbGFyM6u5UVrfvko=;
	h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
	b=j6+4OuLfdPXugeX2hkdbW7i12e6sxtYNH1BrFdjIWqEWZzZD/CUK8s9X7r3X4hBwE
	 x6AkltdrWBKNe/DCYzDV4FBwbUC/A3gKrA7JG+QwQs5YUNAxOUtPztQKKGLNqxsej0
	 ehVMVG3IX5ltEcQQmbADsy8xy4S4Nzlg6MTMYOMYtaQq7Nw/HIqxN+sNYQFr57vwlL
	 67tegIv/i8P3kULUSitxV7TTAIws0Ti0iT/FlQESGcrX8QQOGjThqufqk2CTbzd+hh
	 tk1RM6dxxYd3Y1LzbNjxvsKjXm/3HQolLxUrOlUS/to165+ovwPCHP8S4ppsyfRH13
	 en7TCsU5eu2AA==
Message-ID: <1059ec30752449462215cc235bbbc3141b71a936.camel@kernel.org>
Subject: Re: [PATCH V2 5/7] ARM: dts: bcm283x: Fix up GPIO LED node names
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,  Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Date: Tue, 08 Jun 2021 12:08:29 +0200
In-Reply-To: <1622981777-5023-6-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
	 <1622981777-5023-6-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-06-06 at 14:16 +0200, Stefan Wahren wrote:
> Fix the node names for the GPIO LEDs to conform to the standard node
> name led-..
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Applied for next.

Regards,
Nicolas

