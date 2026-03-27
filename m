Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4D133C186
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612822; cv=none; b=bZoLB3cGOYLvqewBRs6vvB5GRQ3KZKp5kHEZkKiXkx3BPF/eD7PBYePG4yZASV1GhxvxgenNZzWqiRjgwxCSAz5PdbChH8puQmwPTrnmROvPUQPTIrKRNuswA0eyZp0jKhCyQGMkBPEmsX+eMjR6e/dgJMDCSKOwjnl0ReTltNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612822; c=relaxed/simple;
	bh=Hgu8cRYk4SE3289kzFso0+E7966W6uLpPsOi8UON7d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oovXUptr5Xtinthqv36G8gP9heBoGEjLMGJ7YIzW0DmeAPOaKORDvKryx5NMnlI2mb9Wo7qI6ZrwYwRpcYVdoq/ZztCkrCW3LJZTFtYsF3azbE3odPeMI1YPkgOtEapHP4rfWkgP00RluczF9aQ374q06SlgNl4P8twODXrfGNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rK1EzE/v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rK1EzE/v"
Received: by smtp.kernel.org (Postfix)
	id 26BC0C2BC9E; Fri, 27 Mar 2026 12:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF40CC19423;
	Fri, 27 Mar 2026 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774612822;
	bh=Hgu8cRYk4SE3289kzFso0+E7966W6uLpPsOi8UON7d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rK1EzE/vxBy/JHy81zZVnf3hh5uMjBNOTIncXF9ngGwsUjxbirTRYTh3xBzsjxE/L
	 ZUedbn041wbp0MLFxEPR0Inaw9+NQroS0t8soQZH7cU0BP6/rirX9aJUxscOV0RlNF
	 ArjqsX02yx2AMa/zv6i64xzcdnAKUIy67PMyyDdxVbx1+7sq+1j1GSf26hVnpTPp4e
	 wJ5mY8Eg3OUdDhjPZIFMl53Y3tQtdzgKg+FzwOk8dBILjp7766QdP72TFtoizloHkG
	 XrnMc0igtf4YFkZrU86BVh6Hn5crpOKnaskJVLdXthrWCzIVxi27sLMuxuOmT1CPST
	 pfdhWs6KmXMaA==
Date: Fri, 27 Mar 2026 13:00:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	ALKML <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [GIT PULL] arm64: dts: juno/fvp: Updates for v7.1
Message-ID: <20260327-screeching-oxpecker-of-popularity-deac89@quoll>
References: <20260325160027.4115793-1-sudeep.holla@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325160027.4115793-1-sudeep.holla@kernel.org>

On Wed, Mar 25, 2026 at 04:00:21PM +0000, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-7.1
> 
> for you to fetch changes up to 87599f1843d3baa4083dc9dd01c95826b536de24:
> 
>   arm64: dts: arm/corstone1000: Add corstone-1000-a320 (2026-03-23 10:03:28 +0000)
> 
> ----------------------------------------------------------------
> Armv8 Juno/FVP/Vexpress updates for v7.1
> 
> 1. The primary addition is initial support for Zena CSS that includes:
>    a new binding compatibility, a shared `zena-css.dtsi` description, and
>    an FVP device tree.
> 
> 2. Extension of Corstone-1000 FVP platform support with binding updates
>    to add the new `arm,corstone1000-a320-fvp` platform, and the
>    `arm,corstone1000-ethos-u85` NPU integration.
> 
> Overall, this combines new platform enablement with some DTS layout
> cleanup for Arm reference FVP based systems.

Thanks, applied

Best regards,
Krzysztof

