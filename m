Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6675CC35FEB
	for <soc@archiver.kernel.org>; Tue, 17 Sep 2024 07:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 051A0C4AF0D; Tue, 17 Sep 2024 07:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545C9C4CEC7;
	Tue, 17 Sep 2024 07:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726556905;
	bh=CtLX31xBKl7pTBviyO7QkqtzLTLLKRQCAQc0l5Biwe4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ly3yQwKS8/GQz3n9+dUoxaEjMwuaYdOdA/Y3+rjhDCcVAob/XSTaQI8qc2FBN86z+
	 IJbDhzy1A6XT+7GV1AsZrTllIGx08L0F3tQwc+2Ofg4ps45rd4bjiiqz+5zsyyOsZV
	 rbJbJr26IErc2wYiobRt4wBHP2KYevUydLN4XN+A/5aOGe9dtkceUpKE1I/RPFDAO1
	 Pbfj9NqyzxjQwv1VhZKLnd5ENEvzky2a8Cs1xcoJdI3AHs6sAqdINQE8THZ8q3GJlf
	 0Mm8FqYukT5tAXq98cOJjPLmTCi8d+YZbwLHYfWpJgkyLm2AP2t+Kbb2OdykWH5rjh
	 jiCAKCIi81+pA==
Date: Tue, 17 Sep 2024 09:08:19 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v3 05/11] dt-bindings: leds:
 cznic,turris-omnia-leds: Allow interrupts property
Message-ID: <wn6mj233oqouxbrbogpf27w5bdybukoblbold6gk25fdfmy5j2@dlzxkh7whlzw>
References: <20240913123103.21226-1-kabel@kernel.org>
 <20240913123103.21226-6-kabel@kernel.org>
 <rchpwlmgzsoj37oz6plzqcyxdyzpcdqtpmzik2gcflakeca3rm@vcdrovzs4nzh>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rchpwlmgzsoj37oz6plzqcyxdyzpcdqtpmzik2gcflakeca3rm@vcdrovzs4nzh>

On Mon, Sep 16, 2024 at 04:33:13PM +0200, Krzysztof Kozlowski wrote:
> On Fri, Sep 13, 2024 at 02:30:57PM +0200, Marek Behún wrote:
> > Extend the cznic,turris-omnia-leds binding with interrupts property,
> > specifying the global LED brightness changed by button press interrupt.
> > 
> > Signed-off-by: Marek Behún <kabel@kernel.org>
> > ---
> >  .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> > index 34ef5215c150..f52f6304c79e 100644
> > --- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> > +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> > @@ -23,6 +23,12 @@ properties:
> >      description: I2C slave address of the microcontroller.
> >      maxItems: 1
> >  
> > +  interrupts:
> > +    description:
> > +      Specifier for the global LED brightness changed by front button press
> > +      interrupt.
> 
> This "front button press" concerns me that you just hooked here
> gpio-key. Are you sure that this is the physical interrupt line going to
> this device?

No no no, that is a different interrupt from the gpio-key.

The button can be configure in two modes:

- it can act like a GPIO to the CPU, forwarding press and release events
  via the GPIO chip (so button press it is handled by CPU)
  - can be set with
      echo cpu >/sys/bus/i2c/devices/1-002a/front_button_mode
  - pressing it will generate the INT_BUTTON_PRESSED interrupt from the
    MCU

- it can change LED panel brightness (so button press is handled by MCU)
  - this is the default mode, configured after boot
  - can be set with
      echo mcu >/sys/bus/i2c/devices/1-002a/front_button_mode
  - pressing it will generate the INT_BRIGHTNESS_CHANGED interrupt

The INT_BUTTON_PRESSED and INT_BRIGHTNESS_CHANGED interrupt semantically
different (and also literally, they are at different bits). See
  https://gitlab.nic.cz/turris/hw/omnia_hw_ctrl/-/blob/master/src/drivers/i2c_iface.h?ref_type=heads#L289-L321

Marek
