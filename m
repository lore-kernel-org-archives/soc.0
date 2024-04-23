Return-Path: <andy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B4FC4345F
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 16:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7FACC4AF09; Tue, 23 Apr 2024 16:06:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E23BCC116B1;
	Tue, 23 Apr 2024 16:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E23BCC116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: I0gWYpgBTQKtE4aW6X7VPA==
X-CSE-MsgGUID: wGrfkOZFR++DrBnLOf0Vfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9312970"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9312970"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:06:04 -0700
X-CSE-ConnectionGUID: LYGEq/79Sa+qDtrCi/1Veg==
X-CSE-MsgGUID: 65O88O6jRX2M92k6olZJSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="29058763"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:05:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rzIeX-00000000Nys-2y1l;
	Tue, 23 Apr 2024 19:05:53 +0300
Date: Tue, 23 Apr 2024 19:05:53 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, arm@kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v6 00/11] Turris Omnia MCU driver
Message-ID: <ZifcYXdJ7mSEJVfh@smile.fi.intel.com>
References: <20240418121116.22184-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418121116.22184-1-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 18, 2024 at 02:11:05PM +0200, Marek Behún wrote:
> Hello Andy, Dan, Linus, Arnd, Gregory, and others,
> 
> I am sending v6 of the series adding Turris Omnia MCU driver.
> 
> This series depends on the immutable branch between LEDs and locking,
> introducing devm_mutex_init(), see the PR
>   https://lore.kernel.org/linux-leds/20240412084616.GR2399047@google.com/

...

>   devm-helpers: Add resource managed version of irq_create_mapping()
>   devm-helpers: Add resource managed version of debugfs directory create
>     function

IIUC you created them as static inline, the header will become yet another
cumbersome and messy "kernel.h". Can we prevent that?

-- 
With Best Regards,
Andy Shevchenko


