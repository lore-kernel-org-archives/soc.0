Return-Path: <andy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69263C04FFE
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 11:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54DEAC4AF63; Wed,  8 May 2024 11:23:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87D81C113CC;
	Wed,  8 May 2024 11:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87D81C113CC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: MOih625/QquGkthoeUwprg==
X-CSE-MsgGUID: kB6vZ5h1SKKbj7RoID7Qpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11182128"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="11182128"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:23:29 -0700
X-CSE-ConnectionGUID: DDDUpA6HSwGhnsuqPO2K2Q==
X-CSE-MsgGUID: SpWFN6DVTrizRaGQVsd3fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28728808"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:23:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s4fON-00000005PTS-044g;
	Wed, 08 May 2024 14:23:23 +0300
Date: Wed, 8 May 2024 14:23:22 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v9 5/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
Message-ID: <ZjtgqnOc6xzTLAt0@smile.fi.intel.com>
References: <20240508103118.23345-1-kabel@kernel.org>
 <20240508103118.23345-6-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508103118.23345-6-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 08, 2024 at 12:31:14PM +0200, Marek Behún wrote:
> Add support for the watchdog mechanism provided by the MCU.

...

> +	return omnia_cmd_write_u16(mcu->client, OMNIA_CMD_SET_WDT_TIMEOUT,
> +				   timeout * 10);

DECI (from units.h)

...

> +	return timeleft / 10;

Ditto.

...

> +	mcu->wdt.max_timeout = 6553; /* 65535 deciseconds */

Ditto.

	mcu->wdt.max_timeout = 65536 / DECI;

(and no need in a comment)

-- 
With Best Regards,
Andy Shevchenko


