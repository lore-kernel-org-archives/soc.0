Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE4C3D2FF7
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856776; cv=none; b=lNtK3bxT8xC9C7zUaSx/USV9/OwUSs1sfV1DVgVNyr1A55fuMHz2iY+9zfNCFGmyhgagy/h4a6H+v4k14MMZU8uIJT094gBzZLWz+z/JAMvxk9vgD+ipmnsTERzJEvn2TrlIk9EEvFJM3QCfEjLg4DH9ZhRQ7aQgIs4SiLSIANg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856776; c=relaxed/simple;
	bh=w/3WYkwRufqQGX+lh9FyuSu1OutoljsEQQ0xckOM/v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7op81ET0j6DJ1NrcyywQsAHef/nat5Y2eL4h5oZm+iktC1mMhli04feb5bSTIXIVi0TW3ePJHsB0y70ZF7nh/DAXf6DNrz5HRURHTBP15nGOiShCIoNN+5pr+J7ddWnP7VbpRfcKr6fByQhNQwKs10ZvahmRlTrx9LDZJHBmk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mv2uQhff; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mv2uQhff"
Received: by smtp.kernel.org (Postfix)
	id CA7B81F0089D; Thu,  1 Oct 2026 12:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8428B1F0089A;
	Thu,  1 Oct 2026 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856771;
	bh=BjdWTCMCrG0qSY5UkWMV3CxXtTMt/S/l59K8lGrEUjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mv2uQhff028iEsz0sMG1AJEXmo0Q1SoxZBqU74WS7UHjYb5T1cA/NF8YNj3zfPWCN
	 zy7VyZ9jMQkJn0TEBD+4Uju18urhDsM6ioXFMI7+46fet+ECfZxegY4BBOF0EpL7mx
	 g05v8WCce9xWCh26rJ6O2p9lT6a0H4rDPcP/kOMcCU41ENhkJFrW7ipb45TyqBQ51F
	 965Qx63eAXN8Wx39QaWNFOB5V0IygeoJqWoImxkUMA2XhkMESaS1P01luR9z1GvKyN
	 ltfQpb+toIrithbl2tKEWP1nT2cPDW4NvaI2dDvc4SyDXZ/LSC+9ul0bQaVkfC5mIa
	 AP8qgOPW2155w==
Date: Thu, 1 Oct 2026 14:12:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,3/3] MediaTek SoC driver updates for v7.4
Message-ID: <20261001-quick-curvy-dragon-b0fbdd@quoll>
References: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
 <20260923103222.25504-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923103222.25504-3-angelogioacchino.delregno@collabora.com>

On Wed, Sep 23, 2026 at 12:32:07PM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-for-v7.4
> 
> for you to fetch changes up to 96c2b43b1fb305e91700f64e9f758fc140c66b83:
> 
>   soc: mediatek: mt8167-mmsys: add routes for all display paths (2026-09-21 15:10:28 +0200)
> 

Thanks, applied

Best regards,
Krzysztof

