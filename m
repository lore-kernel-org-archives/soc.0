Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D506C47082
	for <soc@archiver.kernel.org>; Tue,  8 Jun 2021 10:07:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E0AAF61246; Tue,  8 Jun 2021 10:07:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAC42611BD;
	Tue,  8 Jun 2021 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623146843;
	bh=HWnJfiXMaoXffa4RbvZdEWRa3ODRe8Aq5SWBD1rAQ1I=;
	h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
	b=gYQlb1wblrQBg3HRS0ZCAnLx2aTysDd/Aao6cGQ+TszJz0Xhfsq1JyvPZvTqajvTC
	 XybD13og5j/ooA9kUmrW8AUvxHgiZsNM/sEIvX8pN4TnODmAJCEAgLlTo4f9NiVaLn
	 E9/hSpnGQIflxtiI/iAfHQM0pdclRlAsLjLYVn8YoedsaJpYXnAJz1r8JxFis1Wltt
	 p5FZIjen+Dlvu9VJXBAkGulwpp1hx3Sx8rIzAdg9ajnDxSsEBzL/8z42XgP4F12CE6
	 yFDU13PrPOCsnW0qz6tu9Gp/cqEsHnEx9zlzu+ZwPJhvTm05zsYImyPjMcvq7rsshp
	 UHnz0uvY/asOg==
Message-ID: <8547a99f6a12ec4e476c19e8485fb68bafb237e1.camel@kernel.org>
Subject: Re: [PATCH V2 1/7] ARM: dts: bcm283x: Fix up MMC node names
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
Date: Tue, 08 Jun 2021 12:07:18 +0200
In-Reply-To: <1622981777-5023-2-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
	 <1622981777-5023-2-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-06-06 at 14:16 +0200, Stefan Wahren wrote:
> Fix the node names for the MMC/SD card controller to conform
> to the standard node name mmc@..
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
> ---

Applied for next.

Regards,
Nicolas

