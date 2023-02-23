Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769F2C61DA4
	for <soc@archiver.kernel.org>; Thu, 23 Feb 2023 16:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4306EC4339C; Thu, 23 Feb 2023 16:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38BEC433D2;
	Thu, 23 Feb 2023 16:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677170917;
	bh=bEei/J02oyeEbj9wPT63afibNBX3GuVMrJSOGc4nAdY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=bZZ+91rB3MCrsX+m6XWtkSN0HasVmwsjwu9Rjc7YIqRMrhIciOM0zRYpKcFJDelBG
	 L/CNjw6P36gsdezmMpwVTjOlv4MoZkKS06Cb8/eRLCZUxhOLpuOZKPe6/sNtvMUlwy
	 CRlpiMxZexdNhITOjj4B5pN0PqGJzI70Wuoucp5G1t20b3UB1ku0nKWCaQ8JdhmZuS
	 Z47b9dZT6nGmkXWTI7nDMg+Qx2DqtIvh6diA5vbzOQGxO6VogCHntdOIuEv+DBZCAn
	 CyGzwhcRrCJXXgXyLtuxcfHoIUAlHT77vLMi90uXek2gsDVdZ1EokFmvpkUxVMTqko
	 eeny22faVCIUA==
Received: by pali.im (Postfix)
	id 0EF0860F; Thu, 23 Feb 2023 17:48:33 +0100 (CET)
Date: Thu, 23 Feb 2023 17:48:33 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 1/8] dt-bindings: leds: register-bit-led: Add
 active-low property
Message-ID: <20230223164833.bsaqwgevphnsenal@pali>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-2-pali@kernel.org>
 <Y9OycfvJEZ3tX/xm@google.com>
 <Y/d2vNUeuQTwQ2VG@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/d2vNUeuQTwQ2VG@google.com>
User-Agent: NeoMutt/20180716

On Thursday 23 February 2023 14:22:52 Lee Jones wrote:
> On Fri, 27 Jan 2023, Lee Jones wrote:
> 
> > On Mon, 26 Dec 2022, Pali Rohár wrote:
> > 
> > > Allow to define inverted logic (0 - enable LED, 1 - disable LED) via
> > > active-low property.
> > > 
> > > Signed-off-by: Pali Rohár <pali@kernel.org>
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > ---
> > >  Documentation/devicetree/bindings/leds/register-bit-led.yaml | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > 
> > Needs a DT Ack (now Cc:ed)
> 
> I can't do anything with this set until we have a DT Ack.
> 
> If you don't receive one soon, I'd suggest resending the set again with
> all of the DT people on Cc that it should have been sent to in the first
> place.

(Re)Sending one email multiple times is against email etiquette,
moreover it is spam technique and reason for marking sender on the
blacklist.

Moreover I have already sent it more than one time. DT people are known
to not respond to patches and pull requests and I have no motivation to
send reminder emails for them for more than half of year.

So I would suggest to not send emails to people who just do not want to
receive or read emails. It is logical reaction.

This patch is here for more than 6 months, so I do not see reason why to
wait for Godot. Rather move forward than stepping at the same position.

> > > diff --git a/Documentation/devicetree/bindings/leds/register-bit-led.yaml b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
> > > index ed26ec19ecbd..418130b29caa 100644
> > > --- a/Documentation/devicetree/bindings/leds/register-bit-led.yaml
> > > +++ b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
> > > @@ -43,6 +43,11 @@ properties:
> > >          0x100000, 0x200000, 0x400000, 0x800000, 0x1000000, 0x2000000, 0x4000000,
> > >          0x8000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000 ]
> > >  
> > > +  active-low:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +    description:
> > > +      LED is ON when bit in register is not set
> > > +
> > >    offset:
> > >      description:
> > >        register offset to the register controlling this LED
> > > -- 
> > > 2.20.1
> > > 
> > 
> > -- 
> > Lee Jones [李琼斯]
> 
> -- 
> Lee Jones [李琼斯]
