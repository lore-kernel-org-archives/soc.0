Return-Path: <SRS0=lwG7=QB=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114DECD379F
	for <soc@archiver.kernel.org>; Tue,  3 Sep 2024 16:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6FB8C4CEC9; Tue,  3 Sep 2024 16:28:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B75BBC4CEC4;
	Tue,  3 Sep 2024 16:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B75BBC4CEC4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: /Zprw15jRSmN7zIig6saGA==
X-CSE-MsgGUID: GVITWeJ9R9WExXeLwawimA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="13350424"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="13350424"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:28:09 -0700
X-CSE-ConnectionGUID: H0nsuZymTK6TK1w/YJD53g==
X-CSE-MsgGUID: KvJed8sQQw2POQM2xfjzKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="95703733"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:28:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1slWNu-00000004lnM-1jA0;
	Tue, 03 Sep 2024 19:28:02 +0300
Date: Tue, 3 Sep 2024 19:28:02 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
List-Id: <soc.lore.kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds v2 08/11] leds: turris-omnia: Use dev_err_probe()
 where appropriate
Message-ID: <Ztc5ErXbwF7ElhDF@smile.fi.intel.com>
References: <20240903101930.16251-1-kabel@kernel.org>
 <20240903101930.16251-9-kabel@kernel.org>
 <CAHp75VfEnuJb2s4QWJ3NNeXcx+qwNXf2ypJ6A35ECOEf+TA9EQ@mail.gmail.com>
 <224af639-babd-4d6e-813b-70fe07d5e337@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <224af639-babd-4d6e-813b-70fe07d5e337@lunn.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 05:56:29PM +0200, Andrew Lunn wrote:
> On Tue, Sep 03, 2024 at 01:45:49PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 3, 2024 at 1:20 PM Marek Behún <kabel@kernel.org> wrote:

...

> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "Cannot set LED %pOF to software mode\n", np);
> > 
> > Side note: Not sure how np is being used besides the messaging. If
> > it's only for the messaging, I would rather see %pfw and fwnode based
> > approach.
> 
> This board has a number of Ethernet switches described in DT.  Nobody
> takes ACPI seriously for any sort of complex networking. So using
> fwnode is probably pointless, this board will probably never be used
> with anything other than DT.

Okay, fair enough!

-- 
With Best Regards,
Andy Shevchenko


