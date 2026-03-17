Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D738E5FB
	for <soc@lists.linux.dev>; Tue, 17 Mar 2026 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737312; cv=none; b=WJGzVcsQWLakTDsxpm16uBcaQYxIq/YBf/niqeL2OYpbjKmkqfJEgDgxGq9lliGnxlXFVNw1qWQBIQMhyGqaI5vZkAmBJx26xlDkBhLH+1AMmZbF7R9VacbsqmkIuJfccByPL6s3WyQksouTYkM7cQWXdy/GDc5O/B5VuO76hl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737312; c=relaxed/simple;
	bh=tDo9OmIfiT5G3x5H5qI/bsN8tjRVgdhgQfHqmc1A6Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HN6o92Ssb/kk6kp9f/v8xURXXlWxtnQ5N5FOEo6WIQGV3VNpnV+YQQjb1xHl5qZBNUK9keYk7SDDn9oLfdJN4umiMUQ6LgHjnmabb1d0K609zlWJVomTNz+GX84qwNHEVXrwzBqvB1+8j3+MxKRY0yn6UHs5RCrd2n3SjliZdxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laEyObRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laEyObRa"
Received: by smtp.kernel.org (Postfix)
	id BAB01C2BCB0; Tue, 17 Mar 2026 08:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212EAC4CEF7;
	Tue, 17 Mar 2026 08:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737312;
	bh=tDo9OmIfiT5G3x5H5qI/bsN8tjRVgdhgQfHqmc1A6Hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=laEyObRactQ5CBD7PtTv3zIoevfgiUwGfSazVh/UIZI5QYKl8MTU5/Tvrpdi+K7Pj
	 cc6BqNwaelGiGBLdCgFqGsxkVUfd8AqIUsxmYMBYr2DRvgOook17Un2v0V5EL+dLCQ
	 ftlGMlakXdzZPMREs013dieOJ/cMIxvA6fL0wFDarokubAE/IaTfFmZSupSpKI6nw/
	 w8FEU8iJOakGe4TSTKJWz++Q0DMeAwl877ANPlGrlM6JtKBdhBvDq+v+4xb3UKKY+e
	 ofViXdFqoLcPZu0RRRuiCAFW1kZNXQCcUadwRPMDHaKqVtSXHCU8uQWKuTEUhFBO4K
	 KTM8wnPTdOh7w==
Date: Tue, 17 Mar 2026 09:48:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.1 #1
Message-ID: <20260317-impetuous-attentive-penguin-43a503@quoll>
References: <13966995.uLZWGnKmhe@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13966995.uLZWGnKmhe@phil>

On Sat, Mar 14, 2026 at 07:45:34PM +0100, Heiko Stuebner wrote:
> Hi soc maintainers,
> 
> please find below Rockchip DT changes for the merge-window for 7.1 .
> 
> So far only arm64 changes :-)
> 
> 
> Please pull.
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
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-dts64-1

Next analysis reports:

Days in linux-next:
----------------------------------------
 1 | + (1)
 2 |
 3 |
 4 | + (1)

Please keep changes in next for at least few releases, in case of
development pulls. Allow community to actually test your code before you
send it to upstream maintainer. We are early in the cycle, so there is
no need to rush changes which were almost not in next.

I will leave pull for later (not reviewed yet).

Best regards,
Krzysztof

