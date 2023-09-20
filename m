Return-Path: <andy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF1CCE79D1
	for <soc@archiver.kernel.org>; Wed, 20 Sep 2023 13:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E44EC433CA; Wed, 20 Sep 2023 13:37:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CCE0C433C7;
	Wed, 20 Sep 2023 13:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5CCE0C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444314316"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="444314316"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 06:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740212810"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="740212810"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 06:36:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andy@kernel.org>)
	id 1qixNv-0000000DkxF-1arK;
	Wed, 20 Sep 2023 16:36:55 +0300
Date: Wed, 20 Sep 2023 16:36:55 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <ZQr1d3ugdxX52hI1@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
 <20230919103815.16818-4-kabel@kernel.org>
 <CACRpkdY8GcDYEDg=w4_ggY7O7kj-_X4ejpXni-t8M3yMivU88Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdY8GcDYEDg=w4_ggY7O7kj-_X4ejpXni-t8M3yMivU88Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 20, 2023 at 01:58:37PM +0200, Linus Walleij wrote:
> On Tue, Sep 19, 2023 at 12:38 PM Marek Behún <kabel@kernel.org> wrote:

...

> > +       if (type & IRQ_TYPE_EDGE_RISING)
> > +               mcu->rising |= bit;
> > +       else
> > +               mcu->rising &= ~bit;
> 
> And with bits in place of bitmasks these would be
> 
> if ()
>   __set_bit(bit, mcu->rising);
> else
>   __clear_bit(bit, mcu->rising);

More precisely __assign_bit() in this case.

-- 
With Best Regards,
Andy Shevchenko


