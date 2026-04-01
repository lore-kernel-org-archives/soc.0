Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82C3F99FB
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 11:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044349; cv=none; b=i50a1J/zqZPXcNpW+CFkO1bXsg1Xrh/4+Ns7wMIpPTLMrak+lyIlB67xuG8sKAFtEjzBR7v39bZBJiNA3LhJOug91S3Am72Zt5g76JodNnBY9xkcKwnBH4FEUOMqYQRiy8ebU+9TMtqf6ahXPay3Fte0QABpKyvwf1r3b3cW/u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044349; c=relaxed/simple;
	bh=8bFBCsVMJnke/coqS6cZXLm60R6QVNtAu/p4N7NwRDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIXt5IV6OOk6uNKrQgb6XSV1Z4KU59j5T0m7oR/CCStFoOUmhVRC6Fz96dX0lrjSwRLH5TXlMvrjVtqYjBpyfSHRh2NS1o1/bmgsvQm+YMsFqZcv1VsCAxjtKMxqZEJOQgfMm3Ww3TScw1EVUblQuBJRAafUtn3Btt4w3+acRn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTeqr13F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTeqr13F"
Received: by smtp.kernel.org (Postfix)
	id 4C121C2BCC4; Wed,  1 Apr 2026 11:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32D5C2BCB9;
	Wed,  1 Apr 2026 11:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044349;
	bh=8bFBCsVMJnke/coqS6cZXLm60R6QVNtAu/p4N7NwRDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTeqr13Fl+j5wBWj6QfYbYMVez4DJprV4/Z/dOKv3ivMV7RtMZABppsyA1JXy+jof
	 KEhDmjgUgWEgt1DdGAGt3eTezlK/W6DhLk+wAbngKJlJapK6XkDT+vRN69T7TdjFa0
	 UnueeiXWBJgVp/1KJSprLHFwkuDmxw3zgoSuTLgCti9U6wrKQQOiCNdutDWTdzDaqa
	 h2D4Uku3h7eDOATeQodWoCy1QJJRusRXaqkKnl/z/vE9fuxC/1vxI7GvN9zF+icmFr
	 /8IF5f8a7vnBmpL4VfAoTStHlgjNTdNxtEjnoDyapazP1vvcj752yBIH0+6WQQ78sm
	 kyRE1ptM7DvUA==
Date: Wed, 1 Apr 2026 13:52:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: soc@kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, zhangyi.ac@huawei.com, 
	"Wuliebao (Joab, Turing Solution)" <wuliebao@huawei.com>, "Shenqingchun(DanielShen)" <daniel.shen@huawei.com>, 
	huangdaode@huawei.com, liguozhu@hisilicon.com, "Zengtao (B)" <prime.zeng@hisilicon.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, shiju.jose@huawei.com, salil.mehta@huawei.com, 
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [GIT,PULL] arm64: dts: hisilicon: fixes for v7.0
Message-ID: <20260401-illegal-omniscient-lynx-c4ea5a@quoll>
References: <69C63082.1000806@hisilicon.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69C63082.1000806@hisilicon.com>

On Fri, Mar 27, 2026 at 03:23:46PM +0800, Wei Xu wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> ---
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/hisilicon/linux-hisi.git tags/hisi-dts-fixes-for-7.0
> 
> for you to fetch changes up to 1af997cad473d505248df6d9577183bb91f69670:
> 
>   arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges (2026-03-21 03:38:11 +0000)

Thanks, applied

Best regards,
Krzysztof

