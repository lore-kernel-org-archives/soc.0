Return-Path: <SRS0=9rRj=NI=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9F3C27C52
	for <soc@archiver.kernel.org>; Thu,  6 Jun 2024 09:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6831AC4AF10; Thu,  6 Jun 2024 09:35:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50276C2BD10;
	Thu,  6 Jun 2024 09:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50276C2BD10
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: pQGawS78TlOsNMGBM4z3lA==
X-CSE-MsgGUID: 1TIdTSCwSSuDmK6gIu+I9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24954355"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="24954355"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 02:35:32 -0700
X-CSE-ConnectionGUID: EWQ0bgVtRwWYr9tt00L29A==
X-CSE-MsgGUID: iI3GwdagTe6sj/XsU5IoeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="42844269"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 02:35:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1sF9Wo-0000000E7ht-2BQq;
	Thu, 06 Jun 2024 12:35:26 +0300
Date: Thu, 6 Jun 2024 12:35:26 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v11 6/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU provided TRNG
Message-ID: <ZmGC3sacfMxnshEA@smile.fi.intel.com>
References: <20240605161851.13911-1-kabel@kernel.org>
 <20240605161851.13911-7-kabel@kernel.org>
 <CAHp75VfWZhmw00QP-ra4Zajn7LMvDW+NUT2fMx5kqeQ9eHLv5A@mail.gmail.com>
 <20240606111113.7f836744@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240606111113.7f836744@dellmb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 06, 2024 at 11:11:13AM +0200, Marek Behún wrote:
> On Wed, 5 Jun 2024 22:00:20 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> 
> > > +#include <linux/bitfield.h>
> > > +#include <linux/completion.h>
> > 
> > + errno.h
> 
> I use -EIO, -EINVAL and -ENOMEM in turris-omnia-mcu-base.c,
> -EINVAL, -ENOTSUPP in turris-omnia-mcu-gpio.c.

> Should I include errno.h in those also?

If you have err.h, then no (it includes asm/errno.h), otherwise, yes.

> Or is this only needed for -ERESTARTSYS?

Definitely yes for Linux internal error codes (>= 512).
Note, that ENOTSUPP is also Linux internal code.


-- 
With Best Regards,
Andy Shevchenko


