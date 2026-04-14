Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A0C3E6DF3;
	Tue, 14 Apr 2026 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185102; cv=none; b=hhZUtDi5H4/wa0BUI8/YOp3eg5XE0p4CxjR5aiEWOhLsCpNHpyaKrkG632r3250W9Cto9azUgPtckKDLn6ru3JNGi7z5+dMTNZRgVYXJp1H0Wfbjk79wIk4DZbomJ+y2D4VnWi25KdZPWai5KMPR3qa9S9O+MLBz1fN44VQOgvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185102; c=relaxed/simple;
	bh=DtB5DYTaR28SLpzvv7nCbQkO6KtAJJ1wWIiVmOdIfaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4sJGI9a1yVJeI2egXHAKLNQHEgA00vJ7rMEGj8XAo6LMRjzeo3m4ZwSOqYneL/F3Tu3G4CyHIognTqA7Sb7Vxmi1KW2MN/ToN06W1etH/nS3oZj7FBQAQOVK+01LndBtqazd7jn5CHHTw+UMMQ8Jrf+dYLsRItG3/jMmWMWjKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUZZ36WQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUZZ36WQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D77C19425;
	Tue, 14 Apr 2026 16:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776185102;
	bh=DtB5DYTaR28SLpzvv7nCbQkO6KtAJJ1wWIiVmOdIfaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aUZZ36WQPvD5VXDAhUN8kn9hDHX8y/rFXzBwFBHj8Z/+AyewTEJe57G7U3P/2J+mu
	 f6iAJLIsEya1kwM0/GoCX6gceG6DI/KPLczf/692L6srICIXA+qj8Kw/R1F+bkR7bM
	 +28Ehl7h3iSR5NXvaESJe6BKTpIL5N1oRiVRPzes1NGmtzsFBTZb5IkuYRbUF9mCNI
	 W7wjsWrC7H9Bwdsce/2oru/2B9h2Yi7Wk7vieP51xR27ok38kd93a2k6vnXrqCo9fH
	 D5MZC7mVd8jZmFuAXSBqYzdyi0ZrRwIP0qtUpvKu4tqJGz6422NTule5W7Fwk+xtAq
	 viq72a875qHGA==
Date: Tue, 14 Apr 2026 18:44:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: SoC <soc@kernel.org>, arm@kernel.org, SoC list <soc@lists.linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>, 
	"Nishanth, Menon" <nm@ti.com>
Subject: Re: [GIT PULL] arm64: dts: ti: k3: Late DT update for v7.1
Message-ID: <20260414-viridian-turkey-of-progress-dd5094@quoll>
References: <6e294d61-9779-41ef-83f8-29f46fd98700@ti.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e294d61-9779-41ef-83f8-29f46fd98700@ti.com>

On Sun, Apr 12, 2026 at 12:52:51PM +0530, Vignesh Raghavendra wrote:
> Hi ARM SoC Maintainers,
> 
> This contains a single patch that updates r5f remoteproc DT nodes, warranted by recent 
> binding update merged via remoteproc tree.
> 
> The following changes since commit 47c806de9e9cf171d197f2f0df86df7f2bd1aa56:
> 
>   arm64: dts: ti: k3-pinctrl: sort shift values numerically (2026-03-27 19:55:06 +0530)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-dt-for-v7.1-part2
> 
> for you to fetch changes up to abe76f9f47d59ff80eb2fc59482aa76bbf6fd13a:
> 
>   arm64: dts: ti: k3: Use memory-region-names for r5f (2026-04-09 17:05:28 +0530)
> 
> ----------------------------------------------------------------
> TI K3 device tree updates for v7.1 part2
> 
> Late addition:
> - Use memory-region-names for r5f across K3 SoCs
> 

Thanks, applied

Best regards,
Krzysztof

