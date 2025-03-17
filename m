Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98F22222BD
	for <soc@lists.linux.dev>; Mon, 17 Mar 2025 09:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203870; cv=none; b=O93uT71Rj8yicBnTanKq8nxKQ7TnxHazT/KcsgFPbUiTrhquCMdOm3izIZLpwS89Xtq5tSWmiotC9fkuVl4TUUa2dNjyTIX8kRua89YEX0eh0jMJljez6oRvpVCTnfrdRWlpcBJbTwpH6kuMri5rgsxPWjM/zMnzvOeSOmpd8gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203870; c=relaxed/simple;
	bh=7Nf3hHf8dKej995NglyVR9ZqEaj2C0bxlftFTKPalqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8hiV4jVKvfBC+xft51IoqVDpPd/xXNBPurxkeG26mpiLHXVNdGbpkhLLbThzfaHS0lNmXGJhV0d3NG+rY2DlEgeha+X9OL5aXps7Yi0rFaiJu1Y7k83gpWqeFOYVxQXAxkO9VH/8Nn1NuNTUEQCrTLej8/NsBGip3YkNcsabmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 6CA56C4CEE9; Mon, 17 Mar 2025 09:31:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17CA4C4CEE3;
	Mon, 17 Mar 2025 09:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17CA4C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: rHEidqoITAS8gviSyMWZzQ==
X-CSE-MsgGUID: 0FiHGJRmThWFDL3aEXAjFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43026824"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="43026824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 02:31:08 -0700
X-CSE-ConnectionGUID: pBR0xImMQ8+NXonsTk34yw==
X-CSE-MsgGUID: IizAQ4D4QEejbszgwRPrWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="121692078"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 02:31:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tu6oH-00000003GYa-3SeD;
	Mon, 17 Mar 2025 11:31:01 +0200
Date: Mon, 17 Mar 2025 11:31:01 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH v1 2/2] platform: toradex: add preliminary support
 for Embedded Controller
Message-ID: <Z9fr1bpFtLmZ5w0C@smile.fi.intel.com>
References: <20250313144331.70591-1-francesco@dolcini.it>
 <20250313144331.70591-3-francesco@dolcini.it>
 <Z9LxbzJ3zf0RT-JS@smile.fi.intel.com>
 <20250317083911.GA17428@francesco-nb>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317083911.GA17428@francesco-nb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 17, 2025 at 09:39:11AM +0100, Francesco Dolcini wrote:
> On Thu, Mar 13, 2025 at 04:53:35PM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 13, 2025 at 03:43:31PM +0100, Francesco Dolcini wrote:

...

> > > +	err = regmap_bulk_read(ec->regmap, EC_CHIP_ID_REG, &reg_val, EC_ID_VERSION_LEN);
> > > +	if (err)
> > > +		return dev_err_probe(dev, err,
> > > +				     "Cannot read id and version registers\n");
> > > +
> > > +	dev_info(dev, "Toradex Embedded Controller id %x - Firmware %d.%d\n",
> > 
> > Specifiers are semirandom. Why signed? Why x and not %u?
> 
> The firmware version ("Firmware %d.%d") is two unsigned decimal number,
> so yes, I will change to "Firmware %u.%u".
> 
> The ID is just an identifier that is documented as hex, therefore I
> think that the most convenient way to display it is as a hex number.

Thanks, don't forget to summarize this in the commit message, it seems
useful information.

-- 
With Best Regards,
Andy Shevchenko


