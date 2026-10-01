Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690144B7A4D
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856546; cv=none; b=k9Qy43RorQg2slk7J7HJjoKa+qiYxv2LCKn0l60DveOncAMZ0p/LjPCk7zoaWKl0mLrEQ1D2NXlAlG28dC400IXz8Rael9kd5cTDzvPRcIMPnQB95bXs1fWnuDaLCQl3JrFLM/5sbl77CMx0lD1/gELoAjIaqq944dt//SkL9aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856546; c=relaxed/simple;
	bh=UMRLVJpZmHRrWYD//INxfKsuDEJTpWpwUpSBpCNb1pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pG6+WDOGTjCofhFQDC4Rqlanyg10cpXK2Ogf1TElhRF2Hc40dqOrm8afyWeNPsXp9K6c/Ehsz5cLkDLCxlEJL6+2EsNkEzRLsgFbtwVXQyhUVgp30/D0xS6y1y7GaEmciyA+x8kxWU2Ug+z3Hc/Z3yYLtS7b5VpoabyhZgfdfcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgW5Jy0Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgW5Jy0Z"
Received: by smtp.kernel.org (Postfix)
	id D60A01F0089B; Thu,  1 Oct 2026 12:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC341F000FF;
	Thu,  1 Oct 2026 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856534;
	bh=fTheCtXk8XaSmkfHsLnCjU58UvR0FjZKzHGfT+fHM6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XgW5Jy0ZaSFeVwUsAQA87Zo1H/iLOEUmZTLoHoCpkQu1OZzviJMO2eXr1jEKmDdd5
	 zkXVROYIE8BlF7w0Kwlw+RWyZu0gt2xMi8YD9qeWv55ux6ZxdgQend3eEG5/Aqj/cA
	 FjIWpyn3+pwpR1SsZd1AuXJhrUWiGL6kpU9Z56YoS/ctdALAGvBsQ7ysIbwMEZuSlc
	 EnUKXTlcIlXYtoJTQkhtL9VShUh/Iwdu9HUrkVgKdeqMcEIwusV0ANXPNttg+kqLgL
	 GA45LrKr7cxHI9dJ+yS9jH4Qsk7SxO2Dq7dUi4SAGhfwNIniSzTVFgA5HYjbz8SFap
	 LpAeTSiVjqMdA==
Date: Thu, 1 Oct 2026 14:08:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.4
Message-ID: <20261001-free-zealous-porpoise-7c6eb8@quoll>
References: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>

On Wed, Sep 23, 2026 at 12:32:05PM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-for-v7.4
> 
> for you to fetch changes up to bf89276b2db391cbb25d1a0e898280fe85b16fb5:
> 
>   arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs (2026-09-21 12:22:18 +0200)
> 

Thanks, applied

Best regards,
Krzysztof

