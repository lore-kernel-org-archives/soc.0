Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219BA3F58CE
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001876; cv=none; b=ouWZqJhxvs3S/L+dojvwSInEIkXHZ2jviudGtF0nzp0JgDXIbgZ3nTWMvNT2J7VXtCvr4YP4iE0x9I7GrEamsk2CXg00XR/dxtjnG7HWfQoOPnKAgDiT10Hcngchg09IZbo+n7sA237eXjmIFJZHdBPJ3YqolxC7sqYlmgwr6ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001876; c=relaxed/simple;
	bh=/plP7IyhIlpRNW6KCMAhZ6+fmF+Y8/RiPkNXHlrfz/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIswcLc1zCTuN/3KLpE2nNWapj+v6MvNGPrS5W3yuvbUcWrJwgv2qtmSsROIeqJ+SdF1dIUakjP/rBk+YtpdAguOu0PcCmP1f3BTzWT+4UgGiyIvOpn9+FkMgwe8JwKz3zf47cwaKKa/etn8T7ToOdqNLO+GcrMjfIHNqrTumvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxKk0NhA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxKk0NhA"
Received: by smtp.kernel.org (Postfix)
	id C49EC1F00899; Tue,  9 Jun 2026 10:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897611F00893;
	Tue,  9 Jun 2026 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781001874;
	bh=YcHgwG1umZziWxLp8w9eGy5YxpmQ5JmqA/xiQqJwoVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZxKk0NhAgfC/rpnNb9meaPbJtZFwLJ5gf8rVMBOfcs8Lz4+ny5LbnR1C32wMv0Fq9
	 rpFGYzqmC0mbJvq9bCY2oTghknuJKeowtymkV9m4jOdgIDXWuneLLhlsdiYcuVBKra
	 SUL4muoYrnZLpsI1j1Aqdla1mIFnRMiSbbCRqtZoxFVBuQR3hYzpA4SZdOlCUHPysl
	 4EGOMcAZBjTZkWTMuxQ+tIzzRFc2jyOLvCgxO9JkW7eq5IAzn8sfP0oOgvpAt6y4eY
	 kg3en7ThRCNS2/MPRxBHRi75ttjhGyYFZuve8gfwZtSizZdJJN936N5q9QQWV6MMq/
	 lkKGU/e5rPghQ==
Date: Tue, 9 Jun 2026 12:44:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,2/3] MediaTek ARM32 Device Tree updates for v7.2
Message-ID: <20260609-innocent-durable-dinosaur-b11dcd@quoll>
References: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
 <20260601091225.5223-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601091225.5223-2-angelogioacchino.delregno@collabora.com>

On Mon, Jun 01, 2026 at 11:12:21AM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts32-for-v7.2
> 
> for you to fetch changes up to ba6afff1d9b70028a5fc3df2d3acbee501c20a53:
> 
>   arm: dts: mediatek: mt8135: fix pinctrl node name (2026-05-11 11:39:02 +0200)
> 

Thanks, applied

Best regards,
Krzysztof

