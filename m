Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A995C4743D
	for <soc@archiver.kernel.org>; Tue,  8 Jun 2021 10:08:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F199B61246; Tue,  8 Jun 2021 10:08:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBD43610C7;
	Tue,  8 Jun 2021 10:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623146934;
	bh=sHlA+ACcUVq/vMizcuxob+sYrkGaRg/uGni6rq6akY0=;
	h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
	b=J4mzUTfnMX3RKMvkHi/yt8DXqtdTXXN3DZLptA+Jys8ahVipB8TXhCYzYo6bhJVNu
	 yae1fSxI/qyW8VotCHd7Zt2DXk2Uv0BbYMf7gw8rvPaq5VvjQ6pct1kTF99ny8dMON
	 N1MD3XmT52c43NTv1rBSDSEsqBGwZ8bxL1JL0SJ4NwI1nBH114cN0fzbtmvo1eKDEV
	 b7Y0Q3kBEbPsRmZaPah8nXhl90avUeG/wbTupThMnofv2RNgbsCFYPklFe3XgkiBJD
	 npnnrxEBXpqHYOMki66p2c1Wp1nEtBpO2LZgXds2t4l62o/vDTuInbfclzIgm0mRCr
	 /dGQKRMVArfsg==
Message-ID: <e74b54347fa63b9bee7b2f89c42b9243d009576f.camel@kernel.org>
Subject: Re: [PATCH V2 6/7] ARM: dts: Add Raspberry Pi 400 support
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
Date: Tue, 08 Jun 2021 12:08:49 +0200
In-Reply-To: <1622981777-5023-7-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
	 <1622981777-5023-7-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-06-06 at 14:16 +0200, Stefan Wahren wrote:
> The Raspberry Pi 400 is like a Pi 4 B designed into a keyboard. But there
> are some minor differences:
> 
> - higher CPU clock rate (1.8 GHz)
> - different Wifi chip (BCM43456)
> - power off is now handled via GPIO
> - no ACT LED
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Applied for next.

Regards,
Nicolas

