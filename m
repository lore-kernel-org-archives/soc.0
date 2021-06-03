Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FABAC47096
	for <soc@archiver.kernel.org>; Thu,  3 Jun 2021 08:07:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2411E613E3; Thu,  3 Jun 2021 08:07:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41550613DA;
	Thu,  3 Jun 2021 08:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622707678;
	bh=ZCxBDzAOQDZIqm3ZxZ469NlDtwy+ENaqxWFnIF4XOtY=;
	h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
	b=YozE3y6ApCVg3k/4PEGThwCDGna1C5plKG6UQw5G0Fq+/EYUkSGAodgauM+Mp+DpV
	 jRYvo7BJ4svcWjOmgAr6cSKQ68khI1Eeq6CbI5rv37+sAeKliaQmkAY+spaiqg71Wz
	 MuW2YJxtbAkJhz/TJ7yAkS4i1yS6MmsgLhUv8EuG5Y9ersuSUblCjVIidEAmOfeT2e
	 19oS62o7rHtU6WdXIhzWkMHRIXa4PVGNnunvcPBJkmP/7Ul0TxTq9O2gapJ82fPObW
	 5mC8NcvKf4Vi09RUt/TVWCfLJlE1wMlCtV9IEA5eX56NiSA4Dqtl07qCZ0N6pvnEfR
	 mv7gRQoQ2g+xQ==
Message-ID: <ac7614eb0aa7888a886e16d427afcd1d773a21a0.camel@kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: broadcom: Add reference to RPi 400
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
Date: Thu, 03 Jun 2021 10:07:52 +0200
In-Reply-To: <1622366775-5309-7-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
	 <1622366775-5309-7-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-05-30 at 11:26 +0200, Stefan Wahren wrote:
> This adds a reference to the dts of the Raspberry Pi 400,
> so we don't need to maintain the content in arm64.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas

