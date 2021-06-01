Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABE1C47080
	for <soc@archiver.kernel.org>; Tue,  1 Jun 2021 09:36:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 14EDF60FE5; Tue,  1 Jun 2021 09:36:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60458611CA;
	Tue,  1 Jun 2021 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622540170;
	bh=XcOwWvTd7DXF9/7voob3uiilvL0AFQVxbZTA2b3WL7E=;
	h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
	b=J+xj/Wff05jT5pnhLd/ik9Uk+4pgbY8zgUsmzlauVgiF8sfuXqYEUS4k2mX4JyXKx
	 bBo2zv8wrvTOEg7yHOnMUO1yhNR1TgbpILpGKAcno7V+qASWmHQo70NDHW7yBpiLi+
	 WbiSiF4zOzSD1+q8CQjVnK/Z2xu5mAal/xjMGHodLcZyHnd+MiUSmvpmGuWYf7P90H
	 gn7Qr24XoJitUlQhirxN/YMl5HzR39URnUhxQnpMJ0vl+m8t1LStrhCmEEf4EKzhJU
	 aeLlezGqCKMS51tRYN7RRht5spoMoMAaScAGrrMu8CBw7+1i3wM1jTHImM80cbmVBL
	 zW7qohiR0wQ4Q==
Message-ID: <6faee8b64235d92ffa308b570718ea1eb68b758b.camel@kernel.org>
Subject: Re: [PATCH 1/6] ARM: dts: bcm283x: Fix up MMC node names
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
Date: Tue, 01 Jun 2021 11:36:05 +0200
In-Reply-To: <1622366775-5309-2-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
	 <1622366775-5309-2-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-05-30 at 11:26 +0200, Stefan Wahren wrote:
> Fix the node names for the MMC/SD card controller to conform
> to the standard node name mmc@..
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas

