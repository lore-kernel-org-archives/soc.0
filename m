Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD761E1E04
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 08:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894779; cv=none; b=b5d4F/nIzcOUwy0khzYmyvmJ7QekDqmu0SUs3FftyORnNG0FlkasKG1MR2E4NIzhNVa3vYVAhi9A6YDY9gAI52DjfbhM3OWrlnAnnXoh1DvEI/UBX8oidtzapqbU61t/7fHmpSAFHj0ER5VB8a+5oOvT5FRMxqD6vCvwz5zURLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894779; c=relaxed/simple;
	bh=BFlObOZeCKW1kez1s3sdnqR/uS9yq9vy54bq71cFFL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/LemT+JNb1Uw8JsachFvKuFYnehUgDCt1s9PCFOIGwliNimXwfJ5ItGW/nmCqkAHZExfl5hbxkpmm2j4Cn42mT56OfHD5tPSEXNwHLNsRrI80qqKvb6jdZpTQX8P8L+vAaKt68S3eYBItpQXarpib2Bvc8HI4mgtr/9ADVie7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEaEHBwJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEaEHBwJ"
Received: by smtp.kernel.org (Postfix)
	id 71097C19425; Sat, 11 Apr 2026 08:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC498C4CEF7;
	Sat, 11 Apr 2026 08:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775894779;
	bh=BFlObOZeCKW1kez1s3sdnqR/uS9yq9vy54bq71cFFL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEaEHBwJZOMvMvl5ETbmP1KK61OErN6X47FyIIrizbUxVqR2tAMMHbCZwOimoxd/0
	 3Utqa/dh2iqYRmmqyUih/a4ut4J6MGVbRvJICxSAr2rAz1T5ZLXFuux4FEX+uTdX57
	 By4sMD286ARaIKJkep9e687jtGfTmpBEXZLeWVJZNQVesrkGsUn2/o8Kfh/kSb0N9x
	 7yoiUGSy4geQHchyTqW3NLLQERJ0HX5HcBCWJlGMFB9iG/gRJgPEDc96bd9JEyAdGq
	 2TZ/Stuk3H56Ofi/Kz74wAh0pqDZOG9ESsjijlwmdYmyNlZonZFZ7GlFT8gQmJN+2n
	 vFuLEV/Alvzjg==
Date: Sat, 11 Apr 2026 10:06:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts32 changes for 7.1 #1
Message-ID: <20260411-voracious-innocent-stoat-74a79a@quoll>
References: <2771700.BddDVKsqQX@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2771700.BddDVKsqQX@phil>

On Fri, Apr 03, 2026 at 03:25:36PM +0200, Heiko Stuebner wrote:
> Hi soc maintainers,
> 
> please find below Rockchip ARM32 DT changes for the merge-window for 7.1 .
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
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-dts32-1
> 
> for you to fetch changes up to 94c8dc1fa8e1ad4037084204152bca1e799d7d1c:
> 
>   ARM: dts: rockchip: Pass linux,code to the power key on rk3288-veyron-pinky (2026-03-24 17:06:35 +0100)
> 
> ----------------------------------------------------------------
> A number of dt-schema cleanups that are log standing, so not suitable
> as fix for the current release.
> 

Thanks, applied

Best regards,
Krzysztof

