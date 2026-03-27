Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFE734F26F
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 11:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612626; cv=none; b=jfNeATQAHmyH0di6ZovyGEL98n50RqbMtd1aRBw3XJzP2kMFTM/y0ME6xXREygqg5R7C4QwaPBh7dVzxoEre5PJ4oSz5527cnlksTqucg8stlv9lcASQudQiEWTm7NexGvu+Sdazq8xJ4SqQ530dIPZ6GyodZugWwRxhnmzh5Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612626; c=relaxed/simple;
	bh=y1RW/9S9unAXA+oodhH5vVUMi8x3886TICOzSz9gIiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bm2vM0/lgY2Sumu2VZ2W855nrb69W+e+Rz1I+i+cTZRsMDqigpb4V99zqUjKovsGKWhC5CmgD2UccnxNrr0i+2v3g8ayCL4ApFwwha5GGz78ye5Eqi1KLEupWEZGJiR58Tsx6ISjqKNv3LXvNpL+BWf5aHTsknI1V70EQQoa3hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6E2y2gB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6E2y2gB"
Received: by smtp.kernel.org (Postfix)
	id 98D74C2BC9E; Fri, 27 Mar 2026 11:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A7DC19423;
	Fri, 27 Mar 2026 11:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774612625;
	bh=y1RW/9S9unAXA+oodhH5vVUMi8x3886TICOzSz9gIiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6E2y2gBO/BU0CDdIMOXmOhlBjIXaP9lyFu3dxakbPk4wxVR+igCBAP64Gl0g9Flz
	 gbpzWq8ZNTfWLZBo/cadPLVW+4ZxietRThPixyENWsd9tu4FSR1N+Bj1jAz0+pcOhC
	 DYTmS4Cgj10BLQWELxHbPnsk6oEMt+kFTXdVXRtV3l0KoEvvnxUhbAQaiOpMlPFiOW
	 0h7qwfwEhVAlhiPE8/wrMys8gTgUjqeRfbVtaV+qAPtKc8YF8kcBsK1lDM9dGkndD5
	 EcuhOfZ3fbhHMN4bSKYEc/jrJGVNt8oHt+yQIvu1+KCX0Y4mf9qANLI50KRkStITFn
	 0NEyO23vkv2Ew==
Date: Fri, 27 Mar 2026 12:57:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2] Rockchip dts fixes for 7.0 #1
Message-ID: <20260327-lumpy-mule-of-health-7efec3@quoll>
References: <5057236.GXAFRqVoOG@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5057236.GXAFRqVoOG@phil>

On Mon, Mar 23, 2026 at 10:58:16PM +0100, Heiko Stuebner wrote:
> Hi SoC maintainers,
> 
> As requested by Krzysztof, here is a more condensed PR.
> 
> Changes in v2 are that I dropped fixes for dt-schema errors and fixes
> for commits introduced not closesly to the current release. These have
> been moved to the current branches.
> 
> The Pinebook regression fix actually also is for a commit from august
> last year, but fixes an actively tracked regression, so maybe carries
> a bit more weight.
> 
> 
> Please pull
> 
> Thanks
> Heiko
> 
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-dtsfixes1-v2
> 
> for you to fetch changes up to 29d1f56c4f3001b7f547123e0a307c009ac717f8:
> 
>   Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro" (2026-02-22 23:28:06 +0100)

Thanks, applied

Best regards,
Krzysztof

