Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886B2486E7E
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855609; cv=none; b=bMLtBRb0RqH2RpKp3VdqqfNjslCoGGPFaC4GkcnRaVsQlmZ6pdeL2Fv43xIUrjhbF/TrOO8PtlwkA0Tl5QJ7aSxIsnULTG2JTvOAlz/cxEbvklUTbOY77zMv0Zhvk7l8WnQWd3QqHtDasMrfsYz+dFadOD8RoFru1uM74DRGvqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855609; c=relaxed/simple;
	bh=qgMxntBQ6/9AekkkQT6hZhcchuddRdZejSNkWO8PeS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFoP5F9NQMWUodhp7zMTJjmwk8iUcxZ4UQ3Rjk1kXDa/Mg0j3kOSaNbNXgwS28bIq3nLQc1aRy1gDH8R0U9TbSRhmHk9Be2y+B12YcWww8sfGSB3OvQVVgn3EES675ekEyGR9IVp6haAdD7WUYfpO6Uj/aSLU+X0I5XsT041b78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jO9dg2Jb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jO9dg2Jb"
Received: by smtp.kernel.org (Postfix)
	id 555D21F00898; Thu,  1 Oct 2026 11:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B3C1F000FF;
	Thu,  1 Oct 2026 11:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790855608;
	bh=5Mlkdl64PmAPMAqQJcQvZerEmXjJBZryxJajGPr9dYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jO9dg2JbYQZsG1Xo5tAXokcr/GNT9qTdFL3g+5yZ8SomdA9ZPkAKFlN2Yzd1jzts8
	 axnGAYQFxy1equJRv6CTrd+3nu0kq2iqwQSEPxapH5OHOciLVqqzV5Wb2H2huCJRmC
	 cPVlMpoXbpVm1Hz7ClxyJZ6Q6N/8Sc+yHLeyYxX/vqXl1C+50js7DnTvjeKCGsLQ/a
	 yAZ+JCyzhTf0UYu92cLPsLOeG7vgqO7NLpvztMmqxiZdzNLs4QSr2bNrIwD2AdYfxw
	 SP0p8t1xdYqeHfQH/m0hFzFhHs1ikASrIqOmS92wNYQW3WdYAHCfs2GNCt1ZqMX1lp
	 WQl0Vj32eLa/A==
Date: Thu, 1 Oct 2026 13:53:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.4
Message-ID: <20261001-delectable-provocative-condor-33bbbd@quoll>
References: <20260923024939.406813-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923024939.406813-1-andersson@kernel.org>

On Tue, Sep 22, 2026 at 09:49:39PM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.4
> 
> for you to fetch changes up to 897cf6d54f366885e190e75b3a221e7b3ae35065:
> 
>   arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor (2026-09-12 14:18:26 -0500)
> 

Thanks, applied

Best regards,
Krzysztof

