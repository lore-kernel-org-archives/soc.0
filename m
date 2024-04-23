Return-Path: <SRS0=8AdT=L4=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE01C4345F
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 17:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC3DEC2BD11; Tue, 23 Apr 2024 17:25:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97CF5C116B1;
	Tue, 23 Apr 2024 17:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 97CF5C116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: rjU/WiMrQZuC1hPhdCS6lQ==
X-CSE-MsgGUID: FLfgxMypTmmxqTPDW3J4TA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9612056"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9612056"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 10:25:20 -0700
X-CSE-ConnectionGUID: 9oqRrADpQuS4WG3/3jUS0g==
X-CSE-MsgGUID: 0WW+7nchRlKiYyH22DhnKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="29246863"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 10:25:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1rzJtK-00000000PZ0-3jQ9;
	Tue, 23 Apr 2024 20:25:14 +0300
Date: Tue, 23 Apr 2024 20:25:14 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-crypto@vger.kernel.org, arm@kernel.org
Subject: Re: [PATCH v6 07/11] platform: cznic: turris-omnia-mcu: Add support
 for MCU provided TRNG
Message-ID: <Zifu-l2o9ADkhMlW@smile.fi.intel.com>
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-8-kabel@kernel.org>
 <Zifamxfa18yjD_VS@smile.fi.intel.com>
 <20240423183225.6e4f90a7@thinkpad>
 <CAHp75VcfmTeG+G1DkteR6GN96y3+h_Mz1YQ8U5asHJ7oTq+KbQ@mail.gmail.com>
 <20240423185704.2237bc65@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423185704.2237bc65@thinkpad>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 23, 2024 at 06:57:04PM +0200, Marek Behún wrote:
> On Tue, 23 Apr 2024 19:43:41 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Apr 23, 2024 at 7:32 PM Marek Behún <kabel@kernel.org> wrote:
> > > On Tue, 23 Apr 2024 18:58:19 +0300
> > > Andy Shevchenko <andy@kernel.org> wrote:  
> > > > On Thu, Apr 18, 2024 at 02:11:12PM +0200, Marek Behún wrote:  

...

> > > > > +   irq_idx = omnia_int_to_gpio_idx[__bf_shf(INT_TRNG)];
> > > > > +   irq = devm_irq_create_mapping(dev, mcu->gc.irq.domain, irq_idx);
> > > > > +   if (irq < 0)
> > > > > +           return dev_err_probe(dev, irq, "Cannot map TRNG IRQ\n");  
> > > >
> > > > This looks like some workaround against existing gpiod_to_irq(). Why do you
> > > > need this?  
> > >
> > > Hmmm, I thought that would not work because that line is only valid
> > > as an IRQ, not as a GPIO (this is enforced via the valid_mask member of
> > > gpio_chip and gpio_irq_chip).
> > >
> > > But looking at the code of gpiolib, if I do
> > >   irq = gpiod_to_irq(gpiochip_get_desc(gc, irq_idx));
> > > the valid_mask is not enforced anywhere.  
> > 
> > Which one? GPIO has two: one per GPIO realm and one for IRQ domain.
> 
> The GPIO line validity is not enforced. The IRQ line validity is
> enforced in the gpiochip_to_irq() method.

Okay, but does it work for you as expected then?

If not, we should fix GPIO library to have gpiod_to_irq() to work as expected.

> > > Is this semantically right to do even in spite of the fact that the
> > > line is not a valid GPIO line?  
> > 
> > Yes. It's orthogonal to that.

-- 
With Best Regards,
Andy Shevchenko


