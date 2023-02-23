Return-Path: <lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5461C61DA4
	for <soc@archiver.kernel.org>; Thu, 23 Feb 2023 14:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69DD6C433A0; Thu, 23 Feb 2023 14:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7158C4339B;
	Thu, 23 Feb 2023 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677162177;
	bh=WGqt8RLcKSmbIcc2MNRCew8XW+1H7sKCg1zwDJkjD1A=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Enm8pxX9pfruSSv22Mv29j7w7F/dscxQhkGLeeJdwJYYPKjOxs8axWSTOcXxguWbQ
	 yXaJR7Dm1AeJ87fP6Bvn/PfN3w5gAlYB2phSRpwZbmivCu36rynmDQOi8TjaPOBlpO
	 TaSYDZnuX4P/0GGeXuc46BBg21nPfL90dvpjabzleNFiHaNriIE8Ng3Wpo0lzr1MBs
	 lqrG6cBHgFsB3ZgCiS4i+92WHkoC/jsuArnkWtJFeOdymC+I+ULHtlE/aNtglxTh4F
	 qWE5VYDB2zw8TDKFgmbz9iQVwk7Gii68aXLVpzSmIhTJlcrj27M1aEIMZ8EB+K12Pe
	 i7BQ/yK/3yIOg==
Date: Thu, 23 Feb 2023 14:22:52 +0000
From: Lee Jones <lee@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 1/8] dt-bindings: leds: register-bit-led: Add
 active-low property
Message-ID: <Y/d2vNUeuQTwQ2VG@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-2-pali@kernel.org>
 <Y9OycfvJEZ3tX/xm@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9OycfvJEZ3tX/xm@google.com>

On Fri, 27 Jan 2023, Lee Jones wrote:

> On Mon, 26 Dec 2022, Pali Rohár wrote:
> 
> > Allow to define inverted logic (0 - enable LED, 1 - disable LED) via
> > active-low property.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/leds/register-bit-led.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> 
> Needs a DT Ack (now Cc:ed)

I can't do anything with this set until we have a DT Ack.

If you don't receive one soon, I'd suggest resending the set again with
all of the DT people on Cc that it should have been sent to in the first
place.

> > diff --git a/Documentation/devicetree/bindings/leds/register-bit-led.yaml b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
> > index ed26ec19ecbd..418130b29caa 100644
> > --- a/Documentation/devicetree/bindings/leds/register-bit-led.yaml
> > +++ b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
> > @@ -43,6 +43,11 @@ properties:
> >          0x100000, 0x200000, 0x400000, 0x800000, 0x1000000, 0x2000000, 0x4000000,
> >          0x8000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000 ]
> >  
> > +  active-low:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      LED is ON when bit in register is not set
> > +
> >    offset:
> >      description:
> >        register offset to the register controlling this LED
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Lee Jones [李琼斯]

-- 
Lee Jones [李琼斯]
