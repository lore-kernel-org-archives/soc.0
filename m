Return-Path: <andy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458C3C04FFE
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 11:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CE69C4AF18; Wed,  8 May 2024 11:22:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40478C113CC;
	Wed,  8 May 2024 11:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40478C113CC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 08IpkEYPR/OvRAhSt3i4Zg==
X-CSE-MsgGUID: M+pBAJfQTCSkGvlxcZnuOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11181956"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="11181956"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:20:55 -0700
X-CSE-ConnectionGUID: HGJoPe/URRmVu6wu0/Gqyw==
X-CSE-MsgGUID: ZS/RoXZCQ0+PGzxnXRYA+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28728397"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:20:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s4fLo-00000005PQT-42KN;
	Wed, 08 May 2024 14:20:44 +0300
Date: Wed, 8 May 2024 14:20:44 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v9 4/9] platform: cznic: turris-omnia-mcu: Add support
 for poweroff and wakeup
Message-ID: <ZjtgDMen_B8eCNm7@smile.fi.intel.com>
References: <20240508103118.23345-1-kabel@kernel.org>
 <20240508103118.23345-5-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508103118.23345-5-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 08, 2024 at 12:31:13PM +0200, Marek Behún wrote:
> Add support for true board poweroff (MCU can disable all unnecessary
> voltage regulators) and wakeup at a specified time, implemented via a
> RTC driver so that the rtcwake utility can be used to configure it.

...

> +	tmp = cpu_to_be32(get_unaligned_le32(&cmd[1]));
> +	put_unaligned_le32(crc32_be(0xffffffff, (void *)&tmp, sizeof(tmp)),
> +			   &cmd[5]);

	put_unaligned_le32(crc32_be(~0, (void *)&tmp, sizeof(tmp)), &cmd[5]);

-- 
With Best Regards,
Andy Shevchenko


