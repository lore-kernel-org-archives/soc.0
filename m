Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FFA3F8814;
	Wed,  1 Apr 2026 11:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043531; cv=none; b=lfFpwDKMb4RZMCvyoUWgkmR/oeVVbChkKTJolYXZivcrM17ZbYZW90Ef+g3ZbZsj1/NOiGZDFyEZqZz/0hikFj7zwkOUmKcE+QYrMoLok3ng94MpTqidS12n0ZXY0CXTWFIFkJanl3643pSDmPjs2mvJo80dGqCz8Vf0UiAk34I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043531; c=relaxed/simple;
	bh=vwnSiQZ99mUCmzzXqPBktCwlYG0prAlCiZI4JiplVNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6nAbFv70Mk4u7vCaqFjTp+9ssFAkKCpGmCumIx+dSfS76CZa0FMoWPn0neojB+WJflEX+7e8jtcTyM2QWZCeSi2dP+L/1DJJPSl/sGOBEfWli8M3AWUHNFjT+HNy2xl8O3C+rsOJ6E6hpuvzeHH7a5xHHv+Vo/r4tQUIRyDtZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGi3bXl3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGi3bXl3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65000C4CEF7;
	Wed,  1 Apr 2026 11:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043530;
	bh=vwnSiQZ99mUCmzzXqPBktCwlYG0prAlCiZI4JiplVNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGi3bXl32jS6aAj8wQqLELCva0RyJe3oApGysu2vvy4MKOmnhuzOReKgG2geCtADl
	 sSSu8CFoh3SJEMn5flLhlSoJlngkewar/8WjmgrNbf6UOsDJrgE3MNsvy2D2YtGbb5
	 e8xe6hOfsyhZze60TlyAFpyvzFEAqZrs7j3EH5vf+RHiL8AIjuteCtzhA1hQAs62ix
	 S0iTLks/UZRSg9im5ctkGUeW7mB469OR6X9BWgSFNiLQw69QOGsNFaa8bm0eIQSHGl
	 geFaPwwd+rQQasVz7H+Mj5pk9/GnJMOGxRUDrjCTqwHcyDocvilnEJ2U/UoRZ+536i
	 YiolfgPQ+DDxA==
Date: Wed, 1 Apr 2026 13:38:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] nuvoton: first batch of arm64 devicetree changes for
 v7.1
Message-ID: <20260401-resourceful-fabulous-marmot-e26db2@quoll>
References: <8d8d5f9f7f8ee803ab14c4b3405d74b305a2ab81.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d8d5f9f7f8ee803ab14c4b3405d74b305a2ab81.camel@codeconstruct.com.au>

On Thu, Mar 26, 2026 at 01:56:03PM +1030, Andrew Jeffery wrote:
> Hello SoC maintainers,
> 
> Just the one Nuvoton devicetree change for v7.1
> 
> Please pull.
> 
> Andrew
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoton-arm64-7.1-devicetree-0
> 
> for you to fetch changes up to 6ee3f20368a4a6198988a54c1a744cbae1354359:
> 
>   arm64: dts: nuvoton: drop unused syscon property from watchdog node (2026-02-23 09:43:36 +1030)
> 
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof

