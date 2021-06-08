Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1943C47082
	for <soc@archiver.kernel.org>; Tue,  8 Jun 2021 10:09:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9DD45611BD; Tue,  8 Jun 2021 10:09:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8F71610C7;
	Tue,  8 Jun 2021 10:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623146951;
	bh=bL8krRWZqQwWrNcRXEvYBsAx1JmcUcZdNphn+9i2syA=;
	h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
	b=gvqGaSGsvkE1QAeo3jW8hAwHNBfo5KSzPBYuFVAi8PKVRkrej/XlJLdIG+/pWgsnZ
	 yrM5auanfsLycop10Q0Jj/4Qh7xDEBAYQiH2bBjJWdPR/PHfwDTMgMLLKG0916f8pY
	 LJyoYndrIjY0zExLPTeV4FSmVntn0VgwDL4Xj2X7EwIhYi62I1kBowoqGOK8LLK5CB
	 S+oohv3TzJWZaxNuDNg37FLf9zdFTVSqh78qqebPpu18kUYFs6GIXH2dbSN/VEC0Zp
	 IrnBIPHf1Ci8lRP9ONl/yJbfMqwwrfk84Wa/qgJd1eedHnX6n8KMOqi5eZBZLJbL+u
	 vF954asBsWONw==
Message-ID: <53511fc7f1d01341596ba27d8269dfa712aec100.camel@kernel.org>
Subject: Re: [PATCH V2 7/7] arm64: dts: broadcom: Add reference to RPi 400
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
Date: Tue, 08 Jun 2021 12:09:06 +0200
In-Reply-To: <1622981777-5023-8-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
	 <1622981777-5023-8-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-06-06 at 14:16 +0200, Stefan Wahren wrote:
> This adds a reference to the dts of the Raspberry Pi 400,
> so we don't need to maintain the content in arm64.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
> ---

Applied for next.

Regards,
Nicolas

