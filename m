Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0D0C47080
	for <soc@archiver.kernel.org>; Tue,  1 Jun 2021 10:03:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3787E61396; Tue,  1 Jun 2021 10:03:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E86AA61370;
	Tue,  1 Jun 2021 10:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622541835;
	bh=nzp7+OLvTqxKzfdH+odNOIhMHeiYs5RPeVqw/4YtOgg=;
	h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
	b=CBwhGs6QaPBgbk+wJcfLJCbLp/i4tGZM/PX/+Hk9LLmGMBBMkqn3tK0bipRWf44jV
	 nJZ5EBXFVhACQOPV5SanJAhgoYr9+N801DNZL/OMvLVnmqcPaDFSkQOkyUEOcnOiof
	 GgxnjUurTRmPgjkY48iVTuT7Lpm9l3DD5m5enl0cUPOTHWGDVAQX5sh31oUsTAnAIQ
	 0HyaQSMQO4hIL3B7tHWCQLevWTUioz6CkGzrw8ND5ODcPSeleH9rHxX9JBhIe/r+mC
	 6LXq4Ix0k3lOqX3u3txBqzIXcVcD/B/CzzqhmyU2vZ1aPZav783K0nifg+0wKwHluR
	 fiPWVrpkIQfow==
Message-ID: <3f50f07c276798ba7702f3742d06866de53f6a67.camel@kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: arm: bcm2835: Add Raspberry Pi 400 to
 DT schema
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
Date: Tue, 01 Jun 2021 12:03:49 +0200
In-Reply-To: <1622366775-5309-5-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
	 <1622366775-5309-5-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-05-30 at 11:26 +0200, Stefan Wahren wrote:
> Add new Raspberry Pi 400 to DT schema.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas

