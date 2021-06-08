Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA87C47082
	for <soc@archiver.kernel.org>; Tue,  8 Jun 2021 21:44:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 736CB6139A; Tue,  8 Jun 2021 21:44:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4CE46124B;
	Tue,  8 Jun 2021 21:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623188640;
	bh=DJHRGZItfqE1QvRxRO7816Y6H4I/ua4sDP85xNsGshw=;
	h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
	b=cKnyK3rZKiYxWOSBi5nL0Eo4YiLXhr8N9TizRAqfNqM1vKL25Iwk56Jik3wdKgWom
	 xUIrkaoKZ8GrCIThjRrNUqi69cNBBCf9x6xAcQI3Wwv4Wzkjz40+kfLG/CC5FYSHZn
	 VIXBm8W6ZxYvdXUi39HpAsyLH5HZpRzg6rsNpYHQrblEig47bd5EmJUi6wf/yA32ug
	 puQks3judst/njzxD6P1LtFlD5df2s9FsrhRqoj8h1IfC2v+6hQannbulPeWHWUmAM
	 PJTQbwuU9uWZSBisvlkO6pRvXQOSAW582aOOkJxO/rkklkcsjxTRRqKm91KcxVIK+e
	 00ZU5+oKEAKZw==
Message-ID: <26d44aba13411e69176356d619bf4993719c8bfb.camel@kernel.org>
Subject: Re: [PATCH V2 4/7] dt-bindings: arm: bcm2835: Add Raspberry Pi 400
 to DT schema
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
Date: Tue, 08 Jun 2021 23:43:54 +0200
In-Reply-To: <1622981777-5023-5-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
	 <1622981777-5023-5-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-06-06 at 14:16 +0200, Stefan Wahren wrote:
> Add new Raspberry Pi 400 to DT schema.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied for next.

Regards,
Nicolas

