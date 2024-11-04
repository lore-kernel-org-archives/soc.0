Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BAE469D
	for <soc@lists.linux.dev>; Mon,  4 Nov 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730731895; cv=none; b=gYJkVYXIKuPIDkSfJyfudIKqnLynte+qMkXtxOiA0bEylLay2waX3pX2cAUc6tUGkTDUFklUO2WfCv4KX8szjlMjh4P04Pp6zaaSrGBP+/pm449kfXM/ankqs9Y1ipGYAOmVR0nDvaqB+fq/a96VisYz7zBrnCnewl3oqnOCS9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730731895; c=relaxed/simple;
	bh=wRD1k9qYGHSw3Ki2lqflDP8d+sagOGgk/7QMLra8St8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eW1UvC/5Tcjmh0T2LTS9J33isAEOp5iGDE8IPPyP0oSnTDLk2GvSp9nWgOko8ah7Q6E++y1qojxvIAmKbQ/FA2Apu8GVQ2IdJBTyXp/ij0D+MQVHjxClo4w0t8iQurIcSE8WSfbCODaai35m3C8ke1NB6m1GPpNs4esj7h8l9N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 351B2C4AF0C; Mon,  4 Nov 2024 14:51:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 004BDC4CECE;
	Mon,  4 Nov 2024 14:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 004BDC4CECE
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: u6Z8b23kQV2XX3p6cKBWLg==
X-CSE-MsgGUID: /9qRvtWWQyiASBUHgdaccQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55832691"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="55832691"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:51:32 -0800
X-CSE-ConnectionGUID: lKChbBCfTayaHR+zoyOkbA==
X-CSE-MsgGUID: 2rS0Hw92RemWtEtDNlFnFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="88249843"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:51:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1t7yQP-0000000B6JY-08Si;
	Mon, 04 Nov 2024 16:51:25 +0200
Date: Mon, 4 Nov 2024 16:51:24 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 02/12] leds: turris-omnia: Use command execution
 functions from the MCU driver
Message-ID: <ZyjfbOkJgpWVvj9v@smile.fi.intel.com>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-3-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104141924.18816-3-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 04, 2024 at 03:19:14PM +0100, Marek Behún wrote:
> Use the MCU command execution functions from the MCU driver instead of
> the ad-hoc implementation in the LED driver. This allows as to drop the
> LED driver implementation, which is a duplicate.

...

> +static int omnia_match_mcu_client(struct device *dev, void *data)
> +{
> +	struct i2c_client *client;
> +
> +	client = i2c_verify_client(dev);
> +	if (!client)
> +		return 0;
> +
> +	return client->addr == OMNIA_MCU_I2C_ADDR;
> +}
> +
> +static int omnia_find_mcu_and_get_features(struct device *dev)
> +{
> +	struct device *mcu_dev;
> +	int ret;
> +
> +	mcu_dev = device_find_child(dev->parent, NULL, omnia_match_mcu_client);
> +	if (!mcu_dev)
> +		return -ENODEV;
> +
> +	ret = omnia_mcu_get_features(i2c_verify_client(mcu_dev));
> +
> +	put_device(mcu_dev);
> +
> +	return ret;
>  }

I'm wondering why the MCU driver (and node) is not represented as syscon
(with some regmap beneath it).

In such a case it would be something like

  foo = syscon_regmap_lookup_by_compatible();

here instead of all these dances.

-- 
With Best Regards,
Andy Shevchenko


