Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFCE36EA99
	for <soc@lists.linux.dev>; Sat, 21 Mar 2026 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774091279; cv=none; b=h3IL6pcsTc8iKP7TH2tPEMGa/TL27hSzh8egnNh3ohUxdopJvDmAfFJT5VIjcKdJB1JUD7/BuzcWanDuS93P6iErJ5UCAlFYEYRMj+6iQvp1wqRmJzWtOMYbrq+MQGGRu2CWHclxSk9ngVGN/W1GejWb8l+pM3b+jsPYlF3Ya/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774091279; c=relaxed/simple;
	bh=XFKXQYD2kqtkA+jmGE+zutnLx77qCWoy1ZMLmExRUQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ps9lALhJaPgidluGLtcolFz738O6d7oSd4906Efykkgv4k5VHVINw1bdIzco3rZm3ZtTBh9uJ/X2qHbX5tqeQOazu04opb4193JV47TTSVIqHkCo4lkj5HlEOIZNOrVVInWSO2fnVbZhE+nW5lTT5+t3bkzQNI/DcbSK+ZelI30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDtl0Jbh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDtl0Jbh"
Received: by smtp.kernel.org (Postfix)
	id 97B52C2BCB1; Sat, 21 Mar 2026 11:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE45CC2BC87;
	Sat, 21 Mar 2026 11:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774091279;
	bh=XFKXQYD2kqtkA+jmGE+zutnLx77qCWoy1ZMLmExRUQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDtl0JbhwyGaTS3tJOgb0IKjl9F5z6iruceht5j7MrEqf/WDtASl5vIFDFdhhi6wy
	 mx6FlXOv6WoUNY00PAN0egRVBn6DTS4beAbAzrUj9S+HDrXsc/52+Zl4/Nv26Dx5Sk
	 Ati9hJBG/oYm1bF2Wd5oy70ILDx3jGEp3LS9ozEykAmudpNfHYhPvoSBbW96cfVulM
	 OpZNP+u7zcx1cgecAXRkHgxuzQ017T02RE3lmBQY3ixVoqt9GGgscR3bwdaYz2QztQ
	 OCVRbLj59KRKIjBe3s/MUeaR6JU9Cb755/WSzVuYDJcr1mjXVWwlKo+ToVhLlEyk8b
	 d1FeKlu7wEuPA==
Date: Sat, 21 Mar 2026 12:07:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v7.1
Message-ID: <20260321-aspiring-real-foxhound-4a18e7@quoll>
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

Days in linux-next:
----------------------------------------
 0 | +++ (3)

With 0 days in next, you cannot really react on any bug reports.

Please send pull requests for next releast with code being in the next
for at least few next releases.

Best regards,
Krzysztof

