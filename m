Return-Path: <SRS0=Ae9U=MN=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84403C25B10
	for <soc@archiver.kernel.org>; Fri, 10 May 2024 15:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63843C4AF07; Fri, 10 May 2024 15:44:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55A0BC113CC;
	Fri, 10 May 2024 15:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55A0BC113CC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: jRTQ3GW0Qt+TQECM+qCmvA==
X-CSE-MsgGUID: iTkPjEGjT/q3vH8r4pGgfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28827423"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="28827423"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:44:30 -0700
X-CSE-ConnectionGUID: h1YPf0ejRC+t5782D2zuPg==
X-CSE-MsgGUID: 9IoXcfQ8SiSQ5S13wD4zPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29760828"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:44:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1s5SQ2-000000069NR-1xrl;
	Fri, 10 May 2024 18:44:22 +0300
Date: Fri, 10 May 2024 18:44:22 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v10 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <Zj5A1qoH-aWbT3XU@smile.fi.intel.com>
References: <20240510101819.13551-1-kabel@kernel.org>
 <20240510101819.13551-3-kabel@kernel.org>
 <CAHp75VfdSqRbhek3eCPtdPtrv2FJyhpG0XvKFMfT9yrDsCjY2Q@mail.gmail.com>
 <20240510153629.bd3gkfm4he2rybui@kandell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510153629.bd3gkfm4he2rybui@kandell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 05:36:29PM +0200, Marek Behún wrote:
> On Fri, May 10, 2024 at 04:41:20PM +0300, Andy Shevchenko wrote:
> > On Fri, May 10, 2024 at 1:18 PM Marek Behún <kabel@kernel.org> wrote:

...

> > > +       err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
> > > +       if (!err)
> > > +               *dst = le32_to_cpu(reply);
> > > +
> > > +       return err;
> > 
> > Introduced here and "fixed" in the next patch. Something wrong with
> > rebasing / squashing?
> > 
> > You will need a v11 anyway. And you have now much more time for it,
> > don't forget to update the kernel version and date in the ABI
> > documentation.
> 
> It would seem so. I will send v11 also with the GPIO changes (to use
> __set_bit() and friends).

I hope it will make v6.11.

-- 
With Best Regards,
Andy Shevchenko


