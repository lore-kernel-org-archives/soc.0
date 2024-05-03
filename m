Return-Path: <SRS0=9VqE=MG=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23FFC4345F
	for <soc@archiver.kernel.org>; Fri,  3 May 2024 17:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3DD1C4AF1A; Fri,  3 May 2024 17:33:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9088C116B1;
	Fri,  3 May 2024 17:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9088C116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: w39E1+4KRqK7mEvCDfgEQQ==
X-CSE-MsgGUID: a/W7uwiRRfO1467aC5+0Tw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21983383"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="21983383"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 10:33:31 -0700
X-CSE-ConnectionGUID: aui29yz/Qg24JUuKZRvnfg==
X-CSE-MsgGUID: pz+GJqOtTvGvaTK7xCp82w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="32006610"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 10:33:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1s2wmj-00000003iyg-3sZy;
	Fri, 03 May 2024 20:33:25 +0300
Date: Fri, 3 May 2024 20:33:25 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v8 3/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <ZjUf5TDbgRxbkYSv@smile.fi.intel.com>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-4-kabel@kernel.org>
 <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>
 <20240503084306.klwzn67drsidq6l6@kandell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503084306.klwzn67drsidq6l6@kandell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 03, 2024 at 10:43:06AM +0200, Marek Behún wrote:
> On Fri, May 03, 2024 at 07:05:34AM +0300, Andy Shevchenko wrote:

...

> > > +       err = omnia_cmd_read(client, cmd, &reply, (__fls(bits) >> 3) + 1);
> > 
> > Perhaps a helper for this (__fls(x) >> 3 + (y)) ? It seems it's used
> > in a few places.
> 
> It is used 3 times:
>   rlen = ((__fls(rising) >> 3) << 1) + 1;
>   flen = ((__fls(falling) >> 3) << 1) + 2;
>   err = omnia_cmd_read(client, cmd, &reply, (__fls(bits) >> 3) + 1);
> 
> The last one is not compatible with the first two (because of the "<< 1").
> 
> The first two instances are contained within a function that is dedicated
> to "computing needed reply length".
> 
> I could probably do something like
> 
>   static inline unsigned int
>   omnia_compute_reply_len(uin32_t mask, bool interleaved, unsigned int offset)
>   {
>           return ((__fls(mask) >> 3) << interleaved) + 1 + offset;
>   }
> 
> Then the 3 instances would become
> 
>   rlen = omnia_compute_reply_len(rising, true, 0);
>   flen = omnia_compute_reply_len(falling, true, 1);
>   err = omnia_cmd_read(client, cmd, &reply,
>                        omnia_compute_reply_len(bits, false, 0));
> 
> What do you think?

Fine, but think about these bit operations, I believe it can be optimised.

-- 
With Best Regards,
Andy Shevchenko


