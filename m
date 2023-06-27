Return-Path: <SRS0=Mk1L=CP=rts-flowmailer.siemens.com=fm-72506-20230627015618d3114bbf7c5a91d06d-fv_Ij2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37440EB64D9
	for <soc@archiver.kernel.org>; Tue, 27 Jun 2023 01:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CEF7DC433CC; Tue, 27 Jun 2023 01:56:31 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5F64C433C8
	for <soc@kernel.org>; Tue, 27 Jun 2023 01:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5F64C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20230627015618d3114bbf7c5a91d06d
        for <soc@kernel.org>;
        Tue, 27 Jun 2023 03:56:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=felix.moessbauer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Kd9AXUdMdBnyR4stAIi1JYhDUVh2/vdM8utOmyH4SdA=;
 b=LTrMgSzLJbU/X3xf9PxdB2k4HvbK3Mvvp/Gb8glyIQCpub31hm/RSJqNmclk2gAw38pUEV
 oq0fszGM2mMhwes1glajH7zahmiSISLHKqLyhZ0Tao8i30+hXj+7vH75iGm9B37StZaWKhmz
 2lHUFVThXo0tZWw7XV8I/sXW3cK38=;
Message-ID: <96522dbb16dc3cecac9c20e32d58e5ea0ddf0f2c.camel@siemens.com>
Subject: Re: [PATCH RESEND 0/2] arm/arm64: dts: Enable device-tree overlay
 support for RPi devices
From: Moessbauer Felix <felix.moessbauer@siemens.com>
To: Florian Fainelli <f.fainelli@gmail.com>, Aurelien Jarno
	 <aurelien@aurel32.net>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Olof Johansson <olof@lixom.net>, Rob Herring
	 <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: <soc.lore.kernel.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Nicolas Saenz Julienne
 <nsaenz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 devicetree@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
  soc@kernel.org, quirin.gylstorff@siemens.com, manuel.matzinger@siemens.com
Date: Tue, 27 Jun 2023 09:56:09 +0800
In-Reply-To: <2cfbf1a0-2cef-057d-dce4-13ee50c626d7@gmail.com>
References: <20220427233607.1225419-1-aurelien@aurel32.net>
	 <2cfbf1a0-2cef-057d-dce4-13ee50c626d7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-72506:519-21489:flowmailer

On Wed, 2022-05-18 at 12:52 -0700, Florian Fainelli wrote:
>=20
>=20
> On 4/27/2022 4:36 PM, Aurelien Jarno wrote:
> > This patchset changes the generation of the Raspberry Pi devices
> > DTB
> > files to improve the support for out-of-tree device-tree overlays,
> > like
> > it has recently been done for the Nvidia SoCs.
> >=20
> > I personally only need that for arm64, but I have added a similar
> > patch
> > to do the same on arm.
>=20
> This looks good to me, Rob, does that approach work for you?

Since May 2023 this patch is integrated into the Debian kernel build
[1]. However it would be better if we could integrate it into the
kernel directly. Is there anything blocking? For me, the patch looks
fine. Similar patches for Nvidia boards also already got integrated
[2].

If there is no general objection against enabling the overlays, I plan
to send patches for the sun8i-h3 arm boards as well.

Best regards,
Felix Moessbauer
Siemens AG

[1]
https://salsa.debian.org/kernel-team/linux/-/commit/fae42149fd0a37c68a496ef=
bbb11f1dac484a163
[2]
https://lore.kernel.org/all/20220203184327.65878-1-jonathanh@nvidia.com/T/
