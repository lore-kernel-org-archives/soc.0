Return-Path: <SRS0=Swux=L4=intel.com=andriy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEB1C04FFE
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 16:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1AAFC32781; Tue, 23 Apr 2024 16:02:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A321C3277B;
	Tue, 23 Apr 2024 16:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A321C3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713888147; x=1745424147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HFFwjiYOHI722TkSuHxO69tPaC2lX97mlCw0Vvqe9zI=;
  b=XeqyfHpbQJfL9eSxraFRBzS9s5vHErWIGBHZ6Nsl/vYY5eMScccitX9P
   +6P0IMRbBYo48hFTYkCL0pJM9VLSgy7BjsEiZk2MSt+rKnnMtNCnacrqJ
   AQhnjDjnoEflv91eoE4vkhc8TfDSFnFc41+U6P5VMd4lTAtDtKbQdG9oR
   KUJxvkNxSpgFJLwL0/cEgnbK/W31cgTlyzFSTj8WuxbzGf6JCa5AJnoJR
   3cyH1Dd2/itXg3GwTVfmNFF9egNxq5e0IFWU4JRGca1QiWQFptmc4J18d
   VDEOrl66pBeMl/LSHzN5Ymz5MkbDHYscW3GT1H7mN57leRqRFDj80c84l
   w==;
X-CSE-ConnectionGUID: byETxwvFRJmpxbyVPUf2Qg==
X-CSE-MsgGUID: PTAF42BLThe/+QB+6H2yOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13268575"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="13268575"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:02:27 -0700
X-CSE-ConnectionGUID: bGemZzCETp+/H7xXhhPXkA==
X-CSE-MsgGUID: 9/RkTXQ0QR6teQhyCDgV8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24467949"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:02:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rzIb7-00000000NvI-45kl;
	Tue, 23 Apr 2024 19:02:21 +0300
Date: Tue, 23 Apr 2024 19:02:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, arm@kernel.org
Subject: Re: [PATCH v6 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
Message-ID: <ZifbjfBg0lBRkpoS@smile.fi.intel.com>
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-9-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418121116.22184-9-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 18, 2024 at 02:11:13PM +0200, Marek Behún wrote:
> A few drivers register a devm action to remove a debugfs directory,
> implementing a one-liner function that calls debufs_remove_recursive().
> Help drivers avoid this repeated implementations by adding managed
> version of debugfs directory create function.

...

> +static inline struct dentry *
> +devm_debugfs_create_dir(struct device *dev, const char *name,
> +			struct dentry *parent)
> +{
> +	struct dentry *dentry;
> +	int err;

> +	dentry = debugfs_create_dir(name, parent);
> +	if (IS_ERR(dentry))
> +		return dentry;

Why do we care?

> +	err = devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
> +				       dentry);
> +	if (err < 0)
> +		return ERR_PTR(err);
> +
> +	return dentry;
> +}

static inline struct dentry *
devm_debugfs_create_dir(struct device *dev, const char *name, struct dentry *parent)
{
	struct dentry *dentry;
	int err;

	dentry = debugfs_create_dir(name, parent);

	err = devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop, dentry);
	if (err)
		return ERR_PTR(err);

	return dentry;
}

?

-- 
With Best Regards,
Andy Shevchenko


