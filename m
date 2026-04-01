Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDCC1C68F;
	Wed,  1 Apr 2026 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043221; cv=none; b=OhCvIS/SqYqx49Qfs0VmFK8qnfGG0tbaQbEDyhFQipGx6sscVhwwIPUb6fZMLmK2jdeYtpJititL+n8T7AoUbRza9s5ONjdfPptccphZ20MNQGHEHVARzmnBPuv3I2AaP8A0TD0kGlGz9UggSkc5+4b35PsPKTBmZFyWEgsriyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043221; c=relaxed/simple;
	bh=WP7aMfbv/ILGmqyI+0/9zkY2yavAid0gw/ITIKmxPF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQVxmkEpe5pyM/gV9F2QuQ3R0oTWLhRBGvsAZyfjoQF4SYFxMi0y/R3tOwUuay2dad4KdklsGqaR9p0AGOp5gQoSJUzCJu21RpD1zMM4/I3Vhy9SmXQ657lln29nBlJx3dy408AoV1/FZDEMI4jjkOp4GHYerSnSftXxhCqmDQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tylho3wr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tylho3wr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3249DC116C6;
	Wed,  1 Apr 2026 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043220;
	bh=WP7aMfbv/ILGmqyI+0/9zkY2yavAid0gw/ITIKmxPF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tylho3wrCv6pG2LF2mwddsKlQBptnSsWn2JnykRidEfsQ8hwWvZ4SstQWLUXEPCqI
	 x17KikpghkeS34k9BGsUVSITbJ+BzO5VWcgHZ00Mijk5r1kdwgUoSkhUNjQYwvLrHI
	 9Wo23/uO/q12YyuEtlWoHXohdxeW+28Pzv6DggstihDf1s/lcqVTX02Ixtha6jdCJc
	 IxIv4Iq+QhYfIVHroiqz23yu0BJYZ/bqIbS7HNgVqZFgPqLdcPYUr0Tb4cE8Hgo3UW
	 l2pJFpI1Ex5m6oMm5ZfFPuy7au3mpfiYWwX9D9tNXFuG/IPwOcsPDvPr7dVLUSffjp
	 N85af9OpqAq8g==
Date: Wed, 1 Apr 2026 13:33:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] aspeed: first batch of fixes for v7.0
Message-ID: <20260401-fanatic-benevolent-squid-8118bf@quoll>
References: <4afeb8eaa663835725cebaeb8c1b6f50dce184dd.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4afeb8eaa663835725cebaeb8c1b6f50dce184dd.camel@codeconstruct.com.au>

On Thu, Mar 26, 2026 at 01:25:03PM +1030, Andrew Jeffery wrote:
> Hello SoC maintainers,
> 
> I've been intending to send out this fix PR for a while now, but time
> has escaped me recently.
> 
> Andrew
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed-7.0-fixes-0
> 
> for you to fetch changes up to 7ec1bd3d9be671d04325b9e06149b8813f6a4836:
> 
>   soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching (2026-02-23 09:43:21 +1030)
> 
> ----------------------------------------------------------------
> aspeed: first batch of fixes for v7.0
> 

Thanks, applied

Best regards,
Krzysztof

