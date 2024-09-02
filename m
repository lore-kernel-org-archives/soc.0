Return-Path: <andy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E9DCA0ED3
	for <soc@archiver.kernel.org>; Mon,  2 Sep 2024 12:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1950EC4CECA; Mon,  2 Sep 2024 12:55:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10B84C4CEC7;
	Mon,  2 Sep 2024 12:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10B84C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 3aenheQRTTKvYXurvjjNVQ==
X-CSE-MsgGUID: fbf3/m7ASZ2LHxe8fajcMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27738625"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="27738625"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 05:55:37 -0700
X-CSE-ConnectionGUID: yW609ukaQxG6TO3siCu3Gg==
X-CSE-MsgGUID: ORvfqQgLQAW6I/dFCR85nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64571554"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 05:55:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sl6ag-00000004Mjx-2qxL;
	Mon, 02 Sep 2024 15:55:30 +0300
Date: Mon, 2 Sep 2024 15:55:30 +0300
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
Message-ID: <ZtW1wuUCvQQSPBH2@smile.fi.intel.com>
References: <20240902124104.14297-1-kabel@kernel.org>
 <20240902124104.14297-2-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240902124104.14297-2-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 02:40:57PM +0200, Marek Behún wrote:
> Move the command execution functions from the turris-omnia-mcu platform
> driver private header to the global turris-omnia-mcu-interface.h header,
> so that they can be used by the LED driver.

...

>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>

>  #include <linux/bits.h>

You may drop this one now, as guaranteed by bitops.h.

> +#include <linux/types.h>
> +#include <asm/byteorder.h>
> +#include <asm/unaligned.h>

-- 
With Best Regards,
Andy Shevchenko


