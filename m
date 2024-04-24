Return-Path: <andy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D90C4345F
	for <soc@archiver.kernel.org>; Wed, 24 Apr 2024 19:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 366AAC2BD11; Wed, 24 Apr 2024 19:47:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56B47C113CD;
	Wed, 24 Apr 2024 19:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 56B47C113CD
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: FNX225g2QUazM+QhjjnG9A==
X-CSE-MsgGUID: dCphpL6NRdGNIOXCSQP7JQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21066126"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="21066126"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 12:47:16 -0700
X-CSE-ConnectionGUID: rPj+xjYvTNa9M//QHhquJw==
X-CSE-MsgGUID: T2yKAZHXTGSHqHYD+k4zNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="24863622"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 12:47:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rziaF-00000000mFg-02Ei;
	Wed, 24 Apr 2024 22:47:11 +0300
Date: Wed, 24 Apr 2024 22:47:10 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v7 6/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU provided TRNG
Message-ID: <Zilhvv3ffWMDL1Uj@smile.fi.intel.com>
References: <20240424173809.7214-1-kabel@kernel.org>
 <20240424173809.7214-7-kabel@kernel.org>
 <ZilQiHLLj1eQxP2L@smile.fi.intel.com>
 <20240424205123.5fc82a1a@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424205123.5fc82a1a@dellmb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 24, 2024 at 08:51:23PM +0200, Marek Behún wrote:
> On Wed, 24 Apr 2024 21:33:44 +0300
> Andy Shevchenko <andy@kernel.org> wrote:
> > On Wed, Apr 24, 2024 at 07:38:05PM +0200, Marek Behún wrote:

...

> > > +static void omnia_irq_mapping_drop(void *res)
> > > +{
> > > +	irq_dispose_mapping((unsigned int)(unsigned long)res);
> > > +}
> > 
> > Leftover?
> 
> What do you mean? I dropped the devm-helpers.h changes, now I do
> devm_add_action_or_reset() manually, with this function as the action.

But why?

...

> > > +	irq_idx = omnia_int_to_gpio_idx[__bf_shf(INT_TRNG)];
> > > +	irq = gpiod_to_irq(gpiochip_get_desc(&mcu->gc, irq_idx));
> > > +	if (irq < 0)
> > > +		return dev_err_probe(dev, irq, "Cannot get TRNG IRQ\n");

> > > +	err = devm_add_action_or_reset(dev, omnia_irq_mapping_drop,
> > > +				       (void *)(unsigned long)irq);
> > > +	if (err)
> > > +		return err;
> > 
> > Are you sure it's correct now?
> 
> Yes, why wouldn't it?

For what purpose? I don't see drivers doing that. Are you expecting that
the same IRQ mapping will be reused for something else? Can you elaborate
how? (I can imagine one theoretical / weird case how to achieve that,
but impractical.)

Besides above, this is asymmetrical call to gpiod_to_irq(). If we really care
about this, it should be provided by GPIO library.

-- 
With Best Regards,
Andy Shevchenko


