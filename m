Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE4B11CA9
	for <soc@lists.linux.dev>; Thu, 13 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741877707; cv=none; b=aC7XGt5TvQAwniNUmXyDGQeUmmJgqZBxkaoDSNIW1t1Ab6KNhKsTw5jJkUu59uh7yoHNZym3TUzt4XiwsCsE9kLLE0IN/jwgUBYD2g4nHq8hV6AWoRR/KOXv5j+weKXHlHmpBZcu/d5Piq+qAtjSpSkJohLaNslvnv6clxoOhwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741877707; c=relaxed/simple;
	bh=aB/1xWCtge2A14D7gWkDYwClmMINQeE78a2chUdOCUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MN94/yRoBeoKNrYXVtoKOHeOJNfMzhFSE/kCKVgxpx/8HefUkLRtMzF+7FirB6WdkzIt55wWJAUUxsvmZ8LOTXRSWYMJDIkA455fQcHqYFTUBsu7SS/bJ7mhph3PSxLyxJBvAaE6vUn9/DwM3DzD9NNTD4RprNMf8U1nTURBZ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 27C23C4CEDD; Thu, 13 Mar 2025 14:55:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06555C4CEEE;
	Thu, 13 Mar 2025 14:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06555C4CEEE
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: EKrwTyQHS1i8tlD9DEDt/w==
X-CSE-MsgGUID: gq7VzyYmRuKdisqG9VoAgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54377765"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="54377765"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:55:06 -0700
X-CSE-ConnectionGUID: mMDFGEiPRGy+NFppYP91sQ==
X-CSE-MsgGUID: j+rBMYUTS9m310XjyX3BCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="121478821"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:55:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tsjxb-00000002D1f-2i6W;
	Thu, 13 Mar 2025 16:54:59 +0200
Date: Thu, 13 Mar 2025 16:54:59 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded
 controller
Message-ID: <Z9Lxw4qVApejzeAE@smile.fi.intel.com>
References: <20250313144331.70591-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313144331.70591-1-francesco@dolcini.it>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 13, 2025 at 03:43:29PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series adds support for the Toradex Embedded Controller, currently used
> on Toradex SMARC iMX95 and iMX8MP boards, with more to come in the future.

How many do you have that will come with like 99% guarantee?

> The EC provides board power-off, reset and GPIO expander functionalities.
> 
> Sending it as an RFC to gather initial feedback on it before investing more
> time in testing and adding the remaining functionalities, with that said both
> the code and the binding are in condition to be wholly reviewed.

This doesn't explain why you need a separate folder.

-- 
With Best Regards,
Andy Shevchenko


