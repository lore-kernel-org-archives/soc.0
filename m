Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DFE190664
	for <soc@lists.linux.dev>; Wed,  8 Jan 2025 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338666; cv=none; b=XHDlYw9AArUxgMutWQg0CbJdPB4JCCMXlsDvDWdbO5TrYkkXjce4xXUgJcAiQHXwYwJqmnmVrYm6Bdlzw6PI9WKq8FatZUqca7kgVIswlbXIE3l99Kl6HSE2OoiJnWPljNcxyl2sI7Bw3F2IvfuiRejNLQzZ2BY+6AbycJmQwCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338666; c=relaxed/simple;
	bh=Vnh+oOkgXUlVPFAt0gfMUQi6C8dArvTIpOxd/A+3DEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OU+qrl3HMfT2PD9bWzfL/xqmUQIww4ZuQjpl+pb24r+PkvwyO+799hkqL+/yx8KKC8DcYoeYvQCkWqR89LtEp/u0uXDrNtkehPHljBPP5w9csVrnhTACuatIGir1+Fg/5LWPf1h59LDucLZktwT/L2KaPqhPOPW5NdErzpBNXaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dU295dGE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dU295dGE"
Received: by smtp.kernel.org (Postfix)
	id 4F7D2C4CEE0; Wed,  8 Jan 2025 12:17:46 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 856D7C4CEDD;
	Wed,  8 Jan 2025 12:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 856D7C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736338657;
	bh=Vnh+oOkgXUlVPFAt0gfMUQi6C8dArvTIpOxd/A+3DEQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dU295dGE/eDJDpTTubs/64hFUh5X8C63pJE+mfMiXgFSPA/yv+w2lDzzTP9SRAtyu
	 AodPP0J2Bf0us0a5ys06bQw7+WTiviRm7d0bldGKEeNvis77LzZ/njhX1HvPKxsOrx
	 JKV/ScD3hAUI+BeKv4+s5RbZ/a8MRhUHiKk+RJMlpSYNpWJtw3QocIEuPvN/rfioKG
	 VWpITUd+sQYsrYwVOVkgbcQhO3Vx2q5Ggob7s4LPTQHk+YdaodE3J8B0thHs6EufvI
	 B8U96UtQ0SDEhAoV5CQROyLMvcO5mAs4x+RdCvaFL4FOzH30hAJITyKI8z0M5RyGSk
	 oI3gMxuyWwC1Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F3FA017E152E;
	Wed,  8 Jan 2025 13:17:36 +0100 (CET)
Message-ID: <f79db33f-ecab-48e6-a2f2-47228183a273@collabora.com>
Date: Wed, 8 Jan 2025 13:17:36 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] MediaTek ARM32 DTS updates for v6.14
To: Matthias Brugger <matthias.bgg@gmail.com>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <ea93d0ea-a1a0-4d36-8880-4f05c85f0c1b@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ea93d0ea-a1a0-4d36-8880-4f05c85f0c1b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 08/01/25 13:14, Matthias Brugger ha scritto:
> Hi Arnd,
> 
> Would you mind to pull the following patches.
> 

Thanks Matthias, I admit I did actually forget about the dts32 change :-)

Cheers,
Angelo

> Regards,
> Matthias
> 
> ---
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>    Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk- 
> dts32-for-v6.14
> 
> for you to fetch changes up to 90234cf9b37c57201a24b78c217a91a8af774109:
> 
>    ARM: dts: mediatek: mt7623: fix IR nodename (2025-01-08 13:08:20 +0100)
> 
> ----------------------------------------------------------------
> mt7623: fix validation error of ir-receiver
> 
> ----------------------------------------------------------------
> Rafał Miłecki (1):
>        ARM: dts: mediatek: mt7623: fix IR nodename
> 
>   arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)



