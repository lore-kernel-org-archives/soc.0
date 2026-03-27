Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C705387357
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 11:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612132; cv=none; b=N7XkGepq0rfXQ86mVodmsT5w1qsARh1+cqRvyTx7tIVXAIeh6n2bV0sPZWbrSNU6ASiSYvxWzCU5g8WtwS8VuRtXOUXrjxzZk/rM5fD/+wOSJ7i43I1uFQdOs6pyKcC101h37jiT0oF+ea+nirDESKzDkiDqhuhK7szyTCuasho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612132; c=relaxed/simple;
	bh=xrRUKmyhPCiuaYTlCMRj3a13WH/c8JFo0ZT68nAbLLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OoeK9zV9B/S+x3qNzxzhOxhVL44MD/SeSXnJZC+SiZVdec3aqdoI2pNnlHpJKXUN0sTURJXxQEYDZBqBsXVMeI53FL7Es39zHuuN5n3SOBdac1jxTqhc60bwEdGJOEqaTdELYRQ6zGzNXTt7irmdRqOdSJe5GhJHtZYa8lrCnB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIfAGL5b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIfAGL5b"
Received: by smtp.kernel.org (Postfix)
	id C2616C2BCB2; Fri, 27 Mar 2026 11:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B04C19423;
	Fri, 27 Mar 2026 11:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774612131;
	bh=xrRUKmyhPCiuaYTlCMRj3a13WH/c8JFo0ZT68nAbLLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UIfAGL5bsDFl/7OUfYvUXfQWmeN1NrUqSkTBeECB7gsq29WEN3+OQF+0c0GnYujOT
	 uxhBvUTXPT28xIjm4jLFPp1hSqEzLgsWhKOhoCdqM9OinatkE1YJcCWk1ToOh/VdbD
	 jt3FhUXqiCjFZ+PTdvo9Tbj/3cG1p+4/XFXHP9bnfT0rwW5SydyjIs8DQ3BOED3CzA
	 fu/D5WyV+2k2vjkto/2Xj0S/8FTBvyuXXsJGfbEnxDOARKBDHjB5+LRshW05LiX2gO
	 WT1Iv0ZWjpaAGcGZwzhS+ZaxuPuDOVu05Q+iXWYKKy0ZYBuU/AmVFAYrHykM6lLEXA
	 TKy8KxLrAPpVA==
Date: Fri, 27 Mar 2026 12:48:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v7.1
Message-ID: <20260327-enthusiastic-narwhal-of-vigor-bb4ac5@quoll>
References: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>

On Fri, Mar 20, 2026 at 09:56:38AM +0100, AngeloGioacchino Del Regno wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v7.1
> 
> for you to fetch changes up to 820ed0c1a13c5fafb36232538d793f99a0986ef3:
> 
>   arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count (2026-03-12 13:32:17 +0100)
> 
> ----------------------------------------------------------------
> MediaTek ARM64 DeviceTree updates

Thanks, applied both.

Best regards,
Krzysztof

