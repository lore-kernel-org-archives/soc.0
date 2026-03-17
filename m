Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB2B38F234
	for <soc@lists.linux.dev>; Tue, 17 Mar 2026 08:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736669; cv=none; b=SMdKr7Uipqum4BR/AMHZ5zou3Te9pjegUpt9aYMa+kSWajs1G/d/BDH1KohoJouosMOBrxzhVmcfWQTM1Vx2H6mab6eb8ezsmxmFDnZKIWvalJ9JsIcHue2sI7cB5zKudL+njjeTj7Q+jyIIL0pb5R8PrQZNVgAuU7i29Nyuayg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736669; c=relaxed/simple;
	bh=3ROM+tLx7TMgQ2ugUywzp/sxA2JiAFepBbbuV9ioIf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U47E42kOG+ssMtNQQ/pWHvFV9AisjDWZJI5Fjo/Q2m7rDQPMO+dLskfuhEdGECszdG8TAhq2tqR8zRcwxYCLCV4fiuc1CsV1EbWL23vH1OTaCA/ZES5KDmHxXuH1JimF3lDUZxXhWRpJcCj3TZMsDk9OVQ05abFhBSjHN8ccuRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCcd57nS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCcd57nS"
Received: by smtp.kernel.org (Postfix)
	id 6EE3DC2BC9E; Tue, 17 Mar 2026 08:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BF4C4CEF7;
	Tue, 17 Mar 2026 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773736669;
	bh=3ROM+tLx7TMgQ2ugUywzp/sxA2JiAFepBbbuV9ioIf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCcd57nSkG1imRW3wcIKJ54uHE9cRNkCGPtjkmjAasDZcQiuxxEDoUysrVEfofKR3
	 kqfkuzNAcljChr4EIELEZ+2RPGojZKbuuykN1BBjCAAJi8swMKPA8aUBRsH4nlOktS
	 rATS7B/pW5HbCkwH3zuY34CGmxzgQZlozYnofd1f1TlqHlMp/u0Yu8QtaaazNL7NqL
	 LovXvsUQsbz6UnNi7/NP7wfGpc3mjjZuESbkrpiLhQU9MiazhJLQ0Jo50PLJNS76IM
	 tHaK3xc3NChdBWIiTshcNY6M0Ru4NrjDDKD3Qy89A1udxKWs9+madYqmcJMP8PEPUA
	 nmILck5nB27Ww==
Date: Tue, 17 Mar 2026 09:37:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip driver fixes for 7.0 #1
Message-ID: <20260317-functional-hot-dingo-a286aa@quoll>
References: <4719110.LvFx2qVVIh@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4719110.LvFx2qVVIh@phil>

On Sat, Mar 14, 2026 at 07:41:19PM +0100, Heiko Stuebner wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-drvfixes1
> 
> for you to fetch changes up to 24ed11ee5bacf9a9aca18fc6b47667c7f38d578b:
> 
>   soc: rockchip: grf: Add missing of_node_put() when returning (2026-02-22 23:27:20 +0100)
> 
> ----------------------------------------------------------------
> Fixing a missing of_node_put() call.

Thanks, applied

Best regards,
Krzysztof

