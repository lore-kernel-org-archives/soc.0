Return-Path: <jic23@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405C9C74A5B
	for <soc@archiver.kernel.org>; Sat, 11 Mar 2023 18:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02B18C433AA; Sat, 11 Mar 2023 18:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F786C433D2;
	Sat, 11 Mar 2023 18:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678557997;
	bh=GOsprbGMCTh8vvgH1NxGTJsbnd6+WJTpWCk1MiS32Gk=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=DrxiGBbb1pdW3L1oTqoeTZx2r6BeE0tjerapNGJhWJdundfZF5pX2bcxJSOrkKdFs
	 X51go0vh7SkfaMa3QBWxAuunqtjPvN4/TWdYc54bQWkpnt8RSu/mlnVb3vX7E63WCC
	 uO9qYaaaSzaI+DiasaMU7FFxztkIW2QL+6kV2xvJwWwG2WuqvlSz4rrQhSawd+trAi
	 Z86zZrw2MT5ECxOO97QnhAEUX1jUkvsi/K87IKxH7UklGYj1C+lCloIOKJOXpSdXQy
	 CV1+Xjm+dQmnBnHrgj9js2hyZGKrC46WS9p35GCp/PEEB1HiHdG6/wRMttzYt8XRQi
	 4NgiZMPm3JC8A==
Date: Sat, 11 Mar 2023 18:06:40 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Evgeniy
 Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-imx@nxp.com, Li Yang <leoyang.li@nxp.com>, Denis Ciocca
 <denis.ciocca@st.com>, soc@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stefan
 Wahren <stefan.wahren@chargebyte.com>
Subject: Re: [PATCH 4/8] dt-bindings: iio: st-sensors: Add IIS328DQ
 accelerometer
Message-ID: <20230311180640.4f975f78@jic23-huawei>
In-Reply-To: <9c2d0ca3-660e-72d2-d158-5c921cd9d607@i2se.com>
References: <20230306172249.74003-1-stefan.wahren@i2se.com>
	<20230306172249.74003-5-stefan.wahren@i2se.com>
	<633b1e27-d148-62d2-ef83-2d0da432c0a7@linaro.org>
	<9c2d0ca3-660e-72d2-d158-5c921cd9d607@i2se.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 Mar 2023 18:27:53 +0100
Stefan Wahren <stefan.wahren@i2se.com> wrote:

> Hi Krzysztof,
> 
> Am 07.03.23 um 09:23 schrieb Krzysztof Kozlowski:
> > On 06/03/2023 18:22, Stefan Wahren wrote:  
> >> From: Stefan Wahren <stefan.wahren@chargebyte.com>
> >>
> >> The ST IIS328DQ is an accelerometer sensor compatible with
> >> the existing ST sensor binding.  
> > If it is compatible with existing binding, then make it compatible.
> > Although your driver change suggests it is not compatible...  
> since the policy is to make the compatible so specific as possible, i 
> will fix the wording here.

Driver changes are naming only - which we do want as that isn't discoverable
from the device but it will 'work' fine with a fallback compatible of
st,h3lis331dl-accel be it with wrong device naming exposed to userspace.

Hmm. That shouldn't have the postfix as it's not a multi device package
(which are the cases where we need postfix as they have multiple drivers
binding to different independent things in the one package / part number)

If someone wants to add a compatible of st,h3lis331dl and deprecate
the accel variant that would be fine, but wouldn't help us much here
for a fallback compatible and it's probably not worth the effort.

Historically we've not been doing fallback compatibles right in this
driver but it's probably not worth 'fixing' that for old devices
as the only real benefit would be things working nicely with old kernels.
Nice to not make it worse though.

So I'd like to see this fallback to st,h3lis331dl-accel

Jonathan


> >
> > Best regards,
> > Krzysztof
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel  

