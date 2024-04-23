Return-Path: <SRS0=Swux=L4=intel.com=andriy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29801C4345F
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 12:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F116C2BD11; Tue, 23 Apr 2024 12:46:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B8FEC4AF07;
	Tue, 23 Apr 2024 12:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9B8FEC4AF07
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713876382; x=1745412382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nWKLAuSPqPzmYAhVoQUFTTnC7bmPAK4+uoykkEg6cxU=;
  b=P+bNKBHVGyJdsybG1p4cKKBINnfHB9RMVP3SCbyqjhE1En8aFc3kseXh
   t/B7+eiJKpf2Q3YQRLppDMSt/tn6duDH0CgKNiJiPzR/Gam/61KbGW3cf
   G3fPpdmfPTjWCDytw4oxQXx6t3AiJm4XRwkDg2ILAclxbi49xSnwN5b2q
   rSkJ0v8WkLrzPAYfEazutADlIFFo3A/ZZlIxr4kXYyI6xV3aI6HEtTfUJ
   MXBTxKZnQgEqWL8xoXcBvmG5oDPSEJ+F4oQ85ZimPywJbV5/PdoST+7Dc
   cpUCaR8+VgbYzbd3WNQS5fCldrJZHLSsK1xykb2irfH7KwhA9E517vQtz
   g==;
X-CSE-ConnectionGUID: MIhNzBtDRbWKA0vRfuW4GQ==
X-CSE-MsgGUID: RwyLHjoaR6G++MaL136XvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9578310"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9578310"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 05:46:21 -0700
X-CSE-ConnectionGUID: jm3JyQPXSWSIhatOc76i7Q==
X-CSE-MsgGUID: 0s/O9KbNTommFaUlAPhMcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="29160484"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 05:46:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rzFXM-00000000KmD-0TJ3;
	Tue, 23 Apr 2024 15:46:16 +0300
Date: Tue, 23 Apr 2024 15:46:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>, arm@kernel.org
Subject: Re: [PATCH v6 06/11] devm-helpers: Add resource managed version of
 irq_create_mapping()
Message-ID: <Zietl9AhJ_2VB5YQ@smile.fi.intel.com>
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-7-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418121116.22184-7-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 18, 2024 at 02:11:11PM +0200, Marek Behún wrote:
> Add resource managed version of irq_create_mapping(), to help drivers
> automatically dispose a linux irq mapping when driver is detached.

AFAICS this is a dead code.
Please, drop it from the next version.

-- 
With Best Regards,
Andy Shevchenko


