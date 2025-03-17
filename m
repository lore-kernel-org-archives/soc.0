Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E759236426
	for <soc@lists.linux.dev>; Mon, 17 Mar 2025 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206483; cv=none; b=ZvRRMhCAJFoL+J52ceJU+QAi0eQRDWJJoBcBUxpsPz/sHJMPKf5YPMXtc+AyYjANT0JRpwL31wmu4cS9bTGwklPB8esUCgIjjeoyDQsRcDT0t9b7Lm4+QCAD/QSpEVDGQhmv/O7uDD+o3RqiM/s2JT3wkxR3PKQRjpyrxaTBRMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206483; c=relaxed/simple;
	bh=1gZtLBxayCdf5ZFM8fCyYmj67ZQlt8beW6Ly4XUj3qM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gE2wXBtSBor0RgvEcfCWsgdO8a9Uucd2gNjkCNRoSPt9mR6nghwOCTGLLCaTZ0jmkJS0YiTkhibZb1pMKtR7vpoJinsbG7+Cipp0jXcc7awgS/5S9fHRqyB7CgEGydp3Dwz1Huus8K17jw66zBEHD61lnHAy+owLyzlT3SCZIPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 8AF66C4CEE3; Mon, 17 Mar 2025 10:14:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56954C4CEE9;
	Mon, 17 Mar 2025 10:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 56954C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: Ju17TKEbSfKf02hY3up+xQ==
X-CSE-MsgGUID: PXisr1AETuqBxNHWF6Vrgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43426471"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="43426471"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:14:40 -0700
X-CSE-ConnectionGUID: nu+r8NFwSt21pzBBJiyiug==
X-CSE-MsgGUID: vgoUrolKS1CIjqT885NVtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="126761470"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:14:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tu7UP-00000003HEL-1Ug0;
	Mon, 17 Mar 2025 12:14:33 +0200
Date: Mon, 17 Mar 2025 12:14:32 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded
 controller
Message-ID: <Z9f2CE7cI4ODkM8O@smile.fi.intel.com>
References: <20250313144331.70591-1-francesco@dolcini.it>
 <4596db59-51fc-4497-9e94-670e9533e7aa@redhat.com>
 <20250317100856.GC17428@francesco-nb>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317100856.GC17428@francesco-nb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 17, 2025 at 11:08:56AM +0100, Francesco Dolcini wrote:
> On Thu, Mar 13, 2025 at 04:08:14PM +0100, Hans de Goede wrote:
> > On 13-Mar-25 3:43 PM, Francesco Dolcini wrote:

...

> > 1. A drivers/mfd/ MFD driver with the regmap stuff,
> >    registering "board-reset" and "gpio" cells
> 
> So, we considered the idea of going with an MFD driver, but looking at
> drivers/platform/cznic, that is doing something relatively close to what
> we are doing (just more feature rich, as of now), drivers/platform/
> seemed a better fit.
> 
> I am not 100% sure what's Andy opinion on this topic, from what I can
> understand his concerns are about the toradex directory (that we'll get
> rid of), not the drivers/platform/ parent you are concerned about.

Yes, my point is to have this inside existing folder whatever you decide
with the maintainers of the respective subsystem to be.

-- 
With Best Regards,
Andy Shevchenko


