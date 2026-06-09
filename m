Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CD83D34B3
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 10:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002036; cv=none; b=KHjfqcyHz31wefCiWx1iS4zA+f/yror/1SWTIZc5F6+BAqngLEKHiKOT/Hu4/sCsIL5Aoqf6ub27uo+llNlVppuLZqnhH2y9lXMtFAGPuKvHfgCp8YjaJFZaXaYB+nCayN8DmLjIsrPIKpVqZoPIFFHhEzo4hHoD6OkUmZSjjeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002036; c=relaxed/simple;
	bh=xpUm99h/ebH0hd/SNPA1i7UGjKlINt2zrVWitp9YWG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWTkS7J7a4N2iBzhc/yKT0zlJLgFrL02t7xlNC0DKlT6bSi5rf80tRCXBI9Uv/dGrjMDrUdj439bb4//9nhIyCPFiHtembaQ/MWCyrCedW38gFJtsYxtijvUFfODRtT3Rlbfu2J3An/r1Sa4+dGvSPNqs+Uv2tbuRpjO4bokWx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAjmjkmN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAjmjkmN"
Received: by smtp.kernel.org (Postfix)
	id 6AACD1F0089A; Tue,  9 Jun 2026 10:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A921F00893;
	Tue,  9 Jun 2026 10:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002035;
	bh=aTF97Kd6W3WUQyV9EptgWTJTCL8FDvW643/bkmmD2vA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dAjmjkmNUGQASADxrO2i+LYGgcDEblBlP4n0z7h7XGH+P88yCHs0mTyqdpq90dp8u
	 yQ6CGj58rgXsrPku93d5gF3xgZwfL4KX+yvcZuxab7Pm6I/Mck/k/usA7h3NMJIeLH
	 EGqazf43XlTOdNjjij+a3uwHaT8Hl9Ltyg+5ggyEIwOwb4U0Lv1YTMKpxHXO3sB9hM
	 hPT9VDF50xUXSeg6TpTuHucDwiWyKPIvWlLuiM9dySh7NmfyguKcFUy39Bfs8iuFs4
	 iPoqNQhGPGNw3fpnCN4DIK3bdMrq2f2KmD+2qrcL7PM1urOiBNaKm9t9VT5EGKhmZt
	 NQujfkgTJ6flg==
Date: Tue, 9 Jun 2026 12:47:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.2
Message-ID: <20260609-daffy-hot-chihuahua-a3cd23@quoll>
References: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>

On Mon, Jun 01, 2026 at 11:12:20AM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-for-v7.2
> 
> for you to fetch changes up to 9897c586b09f79ebcf2e67a888743c046b20d254:
> 
>   arm64: dts: mediatek: add LED and key support on Xiaomi AX3000T (2026-05-25 10:43:10 +0200)
> 
> ----------------------------------------------------------------
> MediaTek ARM64 DeviceTree updates
> 
> This adds improvements for already supported SoCs and devices.

Thanks, applied

Best regards,
Krzysztof

