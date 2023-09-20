Return-Path: <andy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1D9CE79DE
	for <soc@archiver.kernel.org>; Wed, 20 Sep 2023 14:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE323C433CA; Wed, 20 Sep 2023 14:47:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3A9DC433C7;
	Wed, 20 Sep 2023 14:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3A9DC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384082614"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="384082614"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870403133"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="870403133"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:47:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andy@kernel.org>)
	id 1qiyTw-0000000G0eB-3vo6;
	Wed, 20 Sep 2023 17:47:12 +0300
Date: Wed, 20 Sep 2023 17:47:12 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/7] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <ZQsF8FWwfAuT26yE@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
 <20230919103815.16818-3-kabel@kernel.org>
 <ZQmUFPvIx91+ps6k@smile.fi.intel.com>
 <20230919171638.19bc1619@dellmb>
 <ZQnn+Gi0xVlsGCYA@smile.fi.intel.com>
 <20230920161953.6d952392@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920161953.6d952392@dellmb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 20, 2023 at 04:19:53PM +0200, Marek Behún wrote:
> On Tue, 19 Sep 2023 21:27:04 +0300
> Andy Shevchenko <andy@kernel.org> wrote:
> > On Tue, Sep 19, 2023 at 05:16:38PM +0200, Marek Behún wrote:
> > > On Tue, 19 Sep 2023 15:29:08 +0300
> > > Andy Shevchenko <andy@kernel.org> wrote:  
> > > > On Tue, Sep 19, 2023 at 12:38:10PM +0200, Marek Behún wrote:  

...

> > > > > +	if (likely(ret == ARRAY_SIZE(msgs)))    
> > > > 
> > > > Why likely()? Please, justify.  
> > > 
> > > Becuase it is unlikely the I2C transaction will fail. In most cases, it
> > > does not.  
> > 
> > Yes, but why likely() is needed? So, i.o.w. what's the benefit in _this_ case?
> 
> Compiler optimization (one branch avoided). But I guess this isn't a
> hot path, since I2C is insanely slow anyway. OK, I shall remove the
> likely() usage.

Have you seen the difference in the generated code, btw?

I don't think it will get you one independently on the hot/slow
path.

-- 
With Best Regards,
Andy Shevchenko


