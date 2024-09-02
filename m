Return-Path: <andy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB57CA0ED3
	for <soc@archiver.kernel.org>; Mon,  2 Sep 2024 13:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EB88C4AF0C; Mon,  2 Sep 2024 13:23:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5A69C4CEC2;
	Mon,  2 Sep 2024 13:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5A69C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: aK4nCKs4TnmDKMb0542kOQ==
X-CSE-MsgGUID: 16z9Vz8kT6WbMelIq46bGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41363582"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="41363582"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:23:11 -0700
X-CSE-ConnectionGUID: u6+aIGH0SfyA1obri/uWWg==
X-CSE-MsgGUID: 5FjHlDoITn61o1HNa8vzDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64292077"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:23:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sl71M-00000004NaA-1diX;
	Mon, 02 Sep 2024 16:23:04 +0300
Date: Mon, 2 Sep 2024 16:23:04 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds 1/8] turris-omnia-mcu-interface.h: Move command
 execution function to global header
Message-ID: <ZtW8OI6ivN_1CRUE@smile.fi.intel.com>
References: <20240902124104.14297-1-kabel@kernel.org>
 <20240902124104.14297-2-kabel@kernel.org>
 <ZtW1wuUCvQQSPBH2@smile.fi.intel.com>
 <t3fazdw4aasl4oejkfowbavgxmwvvy6du2wvcku4wmstqn7cth@pvcgwzyzwsu5>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <t3fazdw4aasl4oejkfowbavgxmwvvy6du2wvcku4wmstqn7cth@pvcgwzyzwsu5>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 02:59:45PM +0200, Marek Behún wrote:
> On Mon, Sep 02, 2024 at 03:55:30PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 02, 2024 at 02:40:57PM +0200, Marek Behún wrote:

...

> > >  #include <linux/bitfield.h>
> > > +#include <linux/bitops.h>
> > 
> > >  #include <linux/bits.h>
> > 
> > You may drop this one now, as guaranteed by bitops.h.
> 
> How do I know that including bit.sh won't be ever deleted from
> bitops.h?

How do I?

Somebody should start writing documentation (and tooling?) for all this
header dependency hell we have in the Linux kernel project.

> Is there some database which symbols are supposed to be provided by
> which header, and not just randomly included from another header?

Bottom line, more explicit inclusions are fine, but here is a proverb:
"make a fool pray to God, he will break his forehead."

Means that either radical approach (none or all) is not good.

-- 
With Best Regards,
Andy Shevchenko


