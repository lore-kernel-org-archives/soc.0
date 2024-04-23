Return-Path: <SRS0=Swux=L4=intel.com=andriy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBD9C4345F
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 15:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BDF6C2BD11; Tue, 23 Apr 2024 15:56:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D884C116B1;
	Tue, 23 Apr 2024 15:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D884C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713887777; x=1745423777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eDmPZq4zP6biQMdIzFDesdBudE6whatP6FxVEteFrJI=;
  b=lENXAOVPlc0JHCUAasilHGu/r0IyldRVxTSQlywpduWbmQOf3RoxUogx
   E/+gpbs81qI9rgmSgyG3K8xPsjYcTo/NnYoPq5NivZzKl9F6gyDRXKlRD
   3fo9dQGWZMgJXZyh3LSwT4Vau6AqZFAeig6NjFakH9glZeGjMvg2D9+6a
   ip/tAmYiFnQ9dlrZ0X5d3vk+Qy4HZ8H5dGi1ecH1ZnfktbyCdRjixY0Km
   jGfJhtZFi1AWqKH+fOD4WRbPz5421oOFngfUmvOwOuuWaWpdzX1thscGg
   6m71dx5ymmyBbOWLrYHfB5QjmkOiz3nOMLrBdHTxDAHhEiUR/WdJxb1zY
   w==;
X-CSE-ConnectionGUID: 9C6mqTEBQlq1fdSZ6LiSLw==
X-CSE-MsgGUID: 2Bg4qjfdRNGxwPmBN+FBpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="31975337"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="31975337"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 08:56:06 -0700
X-CSE-ConnectionGUID: n9fAG1AVSUe3uwW42lZlfg==
X-CSE-MsgGUID: HJTQOSrTRRmvsXdhoI9vKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24385521"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 08:56:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rzIUz-00000000Nop-31AO;
	Tue, 23 Apr 2024 18:56:01 +0300
Date: Tue, 23 Apr 2024 18:56:01 +0300
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
Message-ID: <ZifaEfSD-0LGuVRh@smile.fi.intel.com>
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-7-kabel@kernel.org>
 <Zietl9AhJ_2VB5YQ@smile.fi.intel.com>
 <20240423171458.5e68b7ce@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423171458.5e68b7ce@thinkpad>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 23, 2024 at 05:14:58PM +0200, Marek Behún wrote:
> On Tue, 23 Apr 2024 15:46:15 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Thu, Apr 18, 2024 at 02:11:11PM +0200, Marek Behún wrote:
> > > Add resource managed version of irq_create_mapping(), to help drivers
> > > automatically dispose a linux irq mapping when driver is detached.  
> > 
> > AFAICS this is a dead code.
> > Please, drop it from the next version.

> Do you mean that it is not used when this patch is applied? 

No.

> Because it is used in the very next patch.

I missed that, sorry.

> Should I merge these two patches into one?

No.

-- 
With Best Regards,
Andy Shevchenko


