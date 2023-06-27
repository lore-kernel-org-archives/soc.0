Return-Path: <SRS0=uZ08=CP=rts-flowmailer.siemens.com=fm-72506-2023062706530468e99c25e2de833a0d-BeWN80@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E1BEB64D9
	for <soc@archiver.kernel.org>; Tue, 27 Jun 2023 06:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4672C433CB; Tue, 27 Jun 2023 06:53:10 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6308C433C9
	for <soc@kernel.org>; Tue, 27 Jun 2023 06:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6308C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2023062706530468e99c25e2de833a0d
        for <soc@kernel.org>;
        Tue, 27 Jun 2023 08:53:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=felix.moessbauer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=C+p//STBZ2y3ZVgAHwk3tOO6JRAOpZfI3q7W2BWRGhc=;
 b=WA3GflvTmh0TpmZLiO9TgOkB0Wa8K2zM4qoWOCNIWoFjFVBgqL6+h+sz9MsVIFjnrq/KeF
 x2a02E8RxJiIaQpIvT763ndEXyIDHvPy3gC30yHqRZfyrZQvkC8vRKCAiPFb0xOAFC2i2JnF
 TgIut49jf61txwFXIJqPqi3iUGfE8=;
Message-ID: <67b75edc23b0ef53bffbc218a93d916b2b66d3ee.camel@siemens.com>
Subject: Re: [PATCH RESEND 0/2] arm/arm64: dts: Enable device-tree overlay
 support for RPi devices
From: Moessbauer Felix <felix.moessbauer@siemens.com>
To: Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, Arnd
 Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Olof
 Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
 bcm-kernel-feedback-list@broadcom.com
List-Id: <soc.lore.kernel.org>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Linus Walleij
	 <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Phil Elwell
	 <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, soc@kernel.org, 
	quirin.gylstorff@siemens.com, manuel.matzinger@siemens.com
Date: Tue, 27 Jun 2023 14:52:56 +0800
In-Reply-To: <6f079ec5-37d3-78e8-9632-b394cf5bd66b@i2se.com>
References: <20220427233607.1225419-1-aurelien@aurel32.net>
	 <2cfbf1a0-2cef-057d-dce4-13ee50c626d7@gmail.com>
	 <96522dbb16dc3cecac9c20e32d58e5ea0ddf0f2c.camel@siemens.com>
	 <6f079ec5-37d3-78e8-9632-b394cf5bd66b@i2se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-72506:519-21489:flowmailer

On Tue, 2023-06-27 at 07:59 +0200, Stefan Wahren wrote:
> Hi Felix,
>=20
> Am 27.06.23 um 03:56 schrieb Moessbauer Felix:
> > On Wed, 2022-05-18 at 12:52 -0700, Florian Fainelli wrote:
> > >=20
> > >=20
> > > On 4/27/2022 4:36 PM, Aurelien Jarno wrote:
> > > > This patchset changes the generation of the Raspberry Pi
> > > > devices
> > > > DTB
> > > > files to improve the support for out-of-tree device-tree
> > > > overlays,
> > > > like
> > > > it has recently been done for the Nvidia SoCs.
> > > >=20
> > > > I personally only need that for arm64, but I have added a
> > > > similar
> > > > patch
> > > > to do the same on arm.
> > >=20
> > > This looks good to me, Rob, does that approach work for you?
> >=20
> > Since May 2023 this patch is integrated into the Debian kernel
> > build
> > [1]. However it would be better if we could integrate it into the
> > kernel directly. Is there anything blocking? For me, the patch
> > looks
> > fine. Similar patches for Nvidia boards also already got integrated
> > [2].
> >=20
> > If there is no general objection against enabling the overlays, I
> > plan
> > to send patches for the sun8i-h3 arm boards as well.
>=20
> this series has been resubmitted recently and applied. Could you
> please=20
> check current linux-next?

Thanks for the quick response. That was indeed a very recent change
(not yet in a release) which I missed.

Then I'll send the patches for the sun8i-h3-*pi*.dts by end of today.

Felix

>=20
> Best regards
>=20
> >=20
> > Best regards,
> > Felix Moessbauer
> > Siemens AG
> >=20
> > [1]
> > https://salsa.debian.org/kernel-team/linux/-/commit/fae42149fd0a37c68a4=
96efbbb11f1dac484a163
> > [2]
> > https://lore.kernel.org/all/20220203184327.65878-1-jonathanh@nvidia.com=
/T/

