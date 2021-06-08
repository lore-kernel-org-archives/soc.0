Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA715C47082
	for <soc@archiver.kernel.org>; Tue,  8 Jun 2021 10:08:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7DDDC61278; Tue,  8 Jun 2021 10:08:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B68361246;
	Tue,  8 Jun 2021 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623146895;
	bh=DDCm8RVclriD3DXxISVlmK/eFSsArOhKQvHVfKr5azk=;
	h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
	b=NinrUWYtBwUgv/EiWPsmXVw2glIYAw7ZZF8OMPhafEeHbHE+RMgE0rwXBueurvfKT
	 KBHSo7jfOhIAdJG1NmrbCeWDIK4iM2iFjCLrc9FQ+vmJ4o93hf2p3+m+2wyPAtTcxM
	 fJQUrfF1X2aWawl2l+Ffg/QbIRDQr7j/prFQma8sUXtSHvSoL033LY0kWW5+zfH04E
	 dsYAwZA6ZDBdbkU731Ta13qNHNqQOew+MHq2slXIVH1ytJ1DJje6ixZXxBHmxvhMUr
	 fK/JoleZ3sWHFBc3xCNwmOKhiSiA/nbPxXAFq1pi3yaoaF3T++0ktBKcmycB8jIJ0R
	 OhgD6sBI1QhuQ==
Message-ID: <b047ebd63411bb66bb80d2593957d4614001fd0d.camel@kernel.org>
Subject: Re: [PATCH V2 3/7] ARM: dts: Move BCM2711 RPi specific into
 separate dtsi
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
Date: Tue, 08 Jun 2021 12:08:10 +0200
In-Reply-To: <1622981777-5023-4-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
	 <1622981777-5023-4-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-06-06 at 14:16 +0200, Stefan Wahren wrote:
> There is a lot of Raspberry Pi specific stuff (neither SoC or board
> specific) for the BCM2711 which is currently in the RPi 4 B dts. In order
> to avoid copy & paste for every new BCM2711 based Raspberry Pi, move it
> into a separate dtsi.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Applied for next.

Regards,
Nicolas

