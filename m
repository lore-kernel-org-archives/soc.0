Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6736C9CB
	for <soc@lists.linux.dev>; Sat, 21 Mar 2026 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774091143; cv=none; b=jDfYdXlTx2nY5MEcysDiTH/n1+TbOJLQKt2SjRfd416Tj0t+lcd1xtsNZPecLP4GKZZK7/scAThG44Cg6lovq3SmLll6X2op/qg9eKwZKboU5Z/I4Qltja/CW1mW8/rHxK2vKkWUeKnKzTpfcO+b8T+coOyBaMB8zyyWQiJBl/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774091143; c=relaxed/simple;
	bh=mBvxoIxzZG+Y4MzcvY50ieLVvBcDyo7uxtSR7f3+gVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lr79iGL7JZfR1Bjzv8rSOTOrb0/sDXOth2sZSI3qAxEXMc/9+hpJiNN0AnG+FYA624y2/baBQo1k7qzf3Yxn5FLSIQc9AQCxoBcI7k0mYYh9neSenusG99MzUVzR0XJ90wtwC2mlhHK/k8ZINrmQ0SwOyliKfW9XhpO/wKtAvL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUnrJYze; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUnrJYze"
Received: by smtp.kernel.org (Postfix)
	id 9B38DC2BCB1; Sat, 21 Mar 2026 11:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD6AC19421;
	Sat, 21 Mar 2026 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774091142;
	bh=mBvxoIxzZG+Y4MzcvY50ieLVvBcDyo7uxtSR7f3+gVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pUnrJYzeTmlJr2A2znJ+jBRgkd6Ud8fcYUm5SYotmIEUEFEQIgOdbsdr18XQbJru/
	 2IAD8wIVZs/x+dxoS+SSpHISEhNhane6U+m8+H9kA/yjvuKBv+VRN+vlrPTowzBSw8
	 xhig17EeljZAKuRQhR5bZ948B9wY15k+3NUkNup40M2HF/bypATPRRPKACB2t7WOrA
	 e2LpxkdgSQhHj4clFObf6w4F1vowVWq3GrEg/e4s3vc0F4esjNNWk12D6Rwm80HVcB
	 zj66aHYWKBGvWrGS0eK6er4P7LfGgx0QissV2Pi0Ikz+9k3ihhgiQoCPEmY+Sugoke
	 7IyAaYuidsjKg==
Date: Sat, 21 Mar 2026 12:05:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.1 #1
Message-ID: <20260321-discerning-beautiful-honeybee-cebb5f@quoll>
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

Thanks, applied

Best regards,
Krzysztof

