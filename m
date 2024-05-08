Return-Path: <andy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B76C04FFE
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 10:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 151B4C4AF17; Wed,  8 May 2024 10:58:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EF30C3277B;
	Wed,  8 May 2024 10:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1EF30C3277B
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: aVqdoW2ZReyDQQb2pqG+kg==
X-CSE-MsgGUID: zVuweitDQmas6/pJkiFZyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22171411"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="22171411"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 03:58:37 -0700
X-CSE-ConnectionGUID: Ja0uQrJvRyaRl45hGG6lAw==
X-CSE-MsgGUID: OU+OvBErQyWZ2HLb66rDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28821136"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 03:58:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s4f0I-00000005P1l-21SC;
	Wed, 08 May 2024 13:58:30 +0300
Date: Wed, 8 May 2024 13:58:30 +0300
From: Andy Shevchenko <andy@kernel.org>
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
Subject: Re: [PATCH v9 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <Zjta1vXG0Yak3vz-@smile.fi.intel.com>
References: <20240508103118.23345-1-kabel@kernel.org>
 <20240508103118.23345-3-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508103118.23345-3-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 08, 2024 at 12:31:11PM +0200, Marek Behún wrote:
> Add the basic skeleton for a new platform driver for the microcontroller
> found on the Turris Omnia board.

Some cosmetics in case you need a new version.
Possibly can be done as follow up(s).

...

> +Date:		July 2024
> +KernelVersion:	6.10

TBH, I'm not sure you manage to squeeze this rather big driver to v6.10.

...

> +static const struct attribute_group *omnia_mcu_groups[] = {
> +	&omnia_mcu_base_group,
> +	NULL
> +};

__ATTRIBUTE_GROUPS()

...

Perhaps also

	struct i2c_client *client = mcu->client;

> +	struct device *dev = &mcu->client->dev;

	struct device *dev = &client->dev;

> +	bool suggest_fw_upgrade = false;
> +	u16 status;
> +	int err;
> +
> +	/* status word holds MCU type, which we need below */
> +	err = omnia_cmd_read_u16(mcu->client, OMNIA_CMD_GET_STATUS_WORD,
> +				 &status);

	err = omnia_cmd_read_u16(client, OMNIA_CMD_GET_STATUS_WORD, &status);

and so on...


> +	if (err)
> +		return err;

...

> +	/*
> +	 * check whether MCU firmware supports the OMNIA_CMD_GET_FEATURES

Check

> +	 * command

command.

> +	 */

-- 
With Best Regards,
Andy Shevchenko


