Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B935949503E
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856678; cv=none; b=YcU6NpyQVyHqQ9clnSPHBGgOm7v2w1sEGDmi/qSVfcg8KeySaw/3SQFYk4n7Cnr6qiL4wNbN9sw4qUYh5q2Zc1A70wXkmtGstqkGX1iGjHcGFjQtLFBhIGs11a2rmai7gSY3sXrCyzSQG3LqOm/uFSam7lVqGQH12LNopRzncJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856678; c=relaxed/simple;
	bh=Q8zvUCLPI7MsaXmigWkPbVZ/wi49mMB4Wlm6Qq6tJBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqXrcs+RIxHmbc3IBvOo3uBo+2BGIDj94O5wKb0VD/9tce8AsTarDPuQpC00JcnpcoOJRRsR1wGOhSJXgPVAdLP4c9ksroBpwY7zj4jwzf5klFpfUq31bdSf6TLcQJYiCYHA++OFH24R/5NAxVXEJwvR5raF3GHTOQOILJo/s2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8/6oesk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8/6oesk"
Received: by smtp.kernel.org (Postfix)
	id 2E4861F00898; Thu,  1 Oct 2026 12:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493451F000FF;
	Thu,  1 Oct 2026 12:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856667;
	bh=QTqQJkL63ohXjWLssut7aVeNBPbNyPoug3s4cPnbgPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i8/6oesk+nDhLAbk7K5hdssv8WTn/KKU/k/hD5wI0EcIm6J3f3kLBNo8TJCyL4jMp
	 zqWNuit5QKwBo7ymBSYCrhOmTjNsxXVsGUUCedu9uB2986F5RpZMeUTPIV5jFR6hRd
	 F2t0f9hLMrx6+YS0IbaFQfGMQip4S6lwNWuYc46ypZjIj8Y197cs/LsvnQM08eXIjf
	 1VCGnnOXafqZiPC6vwpWiRf7XiqQsZ9K0bgBWj8NKi+cOszmZqlouA0SuQWy0Y7qVA
	 /0iYpGdf6krAXkwJWoK/maXimWzImltBx9Ez/TFLrnPuKTc7lQa2oZamRxSEpjBMfe
	 2YEeyM22dGyZw==
Date: Thu, 1 Oct 2026 14:11:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,2/3] MediaTek ARM32 Device Tree updates for v7.4
Message-ID: <20261001-thundering-durable-seriema-0aae1a@quoll>
References: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
 <20260923103222.25504-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923103222.25504-2-angelogioacchino.delregno@collabora.com>

On Wed, Sep 23, 2026 at 12:32:06PM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts32-for-v7.4
> 
> for you to fetch changes up to 2e195497fc9fc0dd89cf95dab80a2d0486dab65b:
> 
>   ARM: dts: mediatek: Add basic support for Amazon ford board (2026-09-10 16:41:20 +0200)
> 

Thanks, applied

Best regards,
Krzysztof

