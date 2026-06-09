Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54B940860D
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006564; cv=none; b=fPYBZ8ilFBUuieEVxFoiUSA9ZdI3NnDPinPiAMxOLZYt4PaVs+2hlamOySoLg9dbVwxk4/vPRdNBq0xVjVGwpdDv0/eVTeRT1vKoMwxJNJnWWp1q3Ck7o4DMPjdTx/FZVn18hqk2D+HxD0hzF/6mNOaUt9SdK9O2YPRp7m8xo1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006564; c=relaxed/simple;
	bh=CdeR6+Nv79QlB0OdrjaN1x8uVcOb4IrpYtBeQd5B2Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZmQfzqBys6C5VHaaVtO7lweKGYMXRwxNDj3brv2geAg43qIQ+rLFyDBq5LMmTF3P6Y9OtOwLcHLQjzGiy4vbPacp/fshW9HQwwDlGprdW/P6vKARdUwQj/MBS1xytyYoJ8MDky4F03aathcnW1J0khMkRZ7J00kW0Cb5Dl8Fi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqNRQoCz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqNRQoCz"
Received: by smtp.kernel.org (Postfix)
	id B08A91F00899; Tue,  9 Jun 2026 12:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70021F00898;
	Tue,  9 Jun 2026 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006563;
	bh=IyCAMloLhkllngJF0JqA/JkEkj/AJ7aZDzAZ/+FDEJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OqNRQoCzjVI35tiv/Ve4MAFcrROXYcwRIoudRVwqkbkgbAtDgIl+92WZgUwkTjP2r
	 7aMD5jVkxTepGqd883cal6QC3VmS75R0ZLMiH98jpGhwA6F/P9+Z8NWJlUL045F6ta
	 KyWKkSNG0wNrpRB2oBH96YyxmNU5ME+RYq0BLNq5d3A2AtVYumWQqzq6vFAXP4V50l
	 IERNvQzoyVbVLkELF37wPNvErD9PlvvGrx6J0SXg1CPI+G4XUFHEPJy5qRbAF5uVUR
	 laOHEcz/z8Yq+KY1Xnew+e03UBPiI2TGAlfgQwnJpbBtwuP6eRzEcSc/v414whXln+
	 DirBb+CLAGnKg==
Date: Tue, 9 Jun 2026 14:02:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
Message-ID: <20260609-raspberry-mastiff-of-focus-e74de3@quoll>
References: <9d4694cb-f596-4538-a437-6f2fbb6304f4@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9d4694cb-f596-4538-a437-6f2fbb6304f4@linaro.org>

On Tue, Jun 02, 2026 at 09:52:55AM +0200, Neil Armstrong wrote:
> Hi,
> 
> Here's the v2 of Amlogic ARM64 DT changes for v7.2, contains improvements for the Khadas VIM4
> and VIM1s SBCs, plus some additions for the Phicomm N1 and a couple of low priority fixes.
> 
> A bad "Fixes" commit sha was introduced for a commit in the same PR, I squashed it with the
> appropriate commit and dropped the previous tag.
> 
> This PR is largely the same as `amlogic-arm64-dt-for-v7.1`, but I sent the fixes
> separately as `amlogic-fixes-v7.1-rc` as discussed with Arnd, so this tag
> `amlogic-arm64-dt-for-v7.2-v1` is based on top of `amlogic-fixes-v7.1-rc`.
> 
> Thanks,
> Neil
> 
> The following changes since commit 174a0ef3b33434f475c87e66f37980e39b73805a:
> 
>   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-21 15:46:29 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.2-v2
> 
> for you to fetch changes up to eec0722a5cac08ba995847c8eb63118cc708560b:
> 
>   arm64: dts: amlogic: t7: Add i2c pinctrl node (2026-06-02 09:49:46 +0200)
> 

Thanks, applied

Best regards,
Krzysztof

