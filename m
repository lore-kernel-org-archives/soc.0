Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BA632F740
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775896876; cv=none; b=rjMUtUB+qtQdmZcuOW4gbZTXgd9y/RdMeBO5gHXYkNM5girOt1qF2xear9PThHgzDEqY5fJ3V9H/ZjyYgANaOqb484zEY9EHa9PbOLqpiUd6Pk1WsEtrNjx4GOMEEMrVcKaRf8pCAN36XMqXsVvlxOI234Wb/Bv14IWVeQLqPx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775896876; c=relaxed/simple;
	bh=kBsOxr3eKZCvLYnbyeQwhEckrwKolmqWuaSMv3r69rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6psJiqEiL95TngbxFI7NQvS/cW8FPtVt1gdBYbOmPtf3FPdZdtWlHDzQi02YqQ+D1OZ0i4UYErzd7X7PAiEyiZg1qKsv9mMStZkimvgw+Pr8KzQ4Oc7bXnCY5xyb1vGRdns+RsjTKOh+ae3Mc8Tnts8SNaWbHv84gcB9FdwqzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5+eQ3sS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5+eQ3sS"
Received: by smtp.kernel.org (Postfix)
	id D4CD9C4AF0B; Sat, 11 Apr 2026 08:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B876C4CEF7;
	Sat, 11 Apr 2026 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775896875;
	bh=kBsOxr3eKZCvLYnbyeQwhEckrwKolmqWuaSMv3r69rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5+eQ3sSpSYIFT37nLZmc0PwcBopPnwQTeTsz+FPR+P+hqhE5l3QX6t5WsGoPu6I9
	 m1Ndn18E9QbRV3Af4FeI/uvAL6O/poM0gBgpOqEnLCmZp3KkP/Uq1+WmB41hhYR16e
	 ic3Vav9zLb01BUObPsASr5ECqnJ6w8Hl+qxilrqls/eFd6kvW6opTq1qS75W1bKeNO
	 OHLHY4K9PQcvCY1rn0URjWc8ZlJ98Ju/HfNtwIPL0PW5R75634hQ0Wr5VpqEFc31B8
	 JxsZyKM/A3/HZYcjF9Z4l0VguPGIJU29iKdV7SQisN9Qc1roV/ywymJrv8cQT3vpLF
	 gh/4IfTZOHC5A==
Date: Sat, 11 Apr 2026 10:41:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [GIT PULL] One more Qualcomm driver update for v7.1
Message-ID: <20260411-adventurous-celadon-flamingo-10b27b@quoll>
References: <20260406132138.2265013-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406132138.2265013-1-andersson@kernel.org>

On Mon, Apr 06, 2026 at 08:21:38AM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit d6e766e391ef0b2be62682e007223fc72ba7764f:
> 
>   Merge branch '20260125-iris-ubwc-v4-1-1ff30644ac81@oss.qualcomm.com' into drivers-for-7.1 (2026-03-30 12:46:14 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.1-2
> 
> for you to fetch changes up to a31ad9339eff4ce401dec816b01a94b4e3c47898:
> 
>   firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X (2026-04-02 16:09:01 -0500)
> 
> ----------------------------------------------------------------
> One more Qualcomm driver update for v7.1
> 
> Flag Lenovo IdeaCentre Mini X to have functional QSEECOM/uefisecapp.
> 

Thanks, applied

Best regards,
Krzysztof

