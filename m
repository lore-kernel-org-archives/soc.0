Return-Path: <andy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C78CA0ED3
	for <soc@archiver.kernel.org>; Mon,  2 Sep 2024 13:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9F5A2C4AF09; Mon,  2 Sep 2024 13:17:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92A75C4CEC7;
	Mon,  2 Sep 2024 13:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92A75C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: lcTes7kzSUGta2fBpk4OPg==
X-CSE-MsgGUID: uMzpJ0FBRSu/9N51Y3pC+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23670331"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23670331"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:17:25 -0700
X-CSE-ConnectionGUID: mx18IN+4QvSTKALky29K8w==
X-CSE-MsgGUID: 4sELQTiDQZG6g99mY0T2Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="95421338"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:17:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sl6vj-00000004NQu-20HD;
	Mon, 02 Sep 2024 16:17:15 +0300
Date: Mon, 2 Sep 2024 16:17:15 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds 5/8] leds: turris-omnia: Notify sysfs on MCU global
 LEDs brightness change
Message-ID: <ZtW625-GePwV8ffA@smile.fi.intel.com>
References: <20240902124104.14297-1-kabel@kernel.org>
 <20240902124104.14297-6-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240902124104.14297-6-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 02:41:01PM +0200, Marek Behún wrote:
> Recall that on Turris Omnia, the LED controller has a global brightness
> property, which allows the user to make the front LED panel dimmer.
> 
> There is also a button on the front panel, which by default is
> configured so that pressing it changes the global brightness to a lower
> value (unless it is at 0%, in which case pressing the button changes the
> global brightness to 100%).
> 
> Newer versions of the MCU firmware support informing the SOC that the
> brightness was changed by button press event via an interrupt.
> 
> Now that we have the turris-omnia-mcu driver, which adds support for MCU
> interrupts, add the ability to inform the userspace (via a sysfs
> notification) that the global brightness was changed.

...

> +	ret = devm_device_add_group(dev, &omnia_led_controller_group);

AFAIU the intention is to remove that API, hence this shall not be used.
Greg?

https://lore.kernel.org/lkml/20221109140711.105222-1-gregkh@linuxfoundation.org/

-- 
With Best Regards,
Andy Shevchenko


