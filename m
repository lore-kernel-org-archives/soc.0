Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E7219A93
	for <soc@lists.linux.dev>; Wed, 14 May 2025 08:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211018; cv=none; b=YEGcMOMpucJxxxrW1kGeG2YFyiSdGMX3a3V+vTGTP7sRvqWVsl3LFSOIW+H0DhnDeoOINH6HQm+a4grOLH8uLXramtISVd2F4YHZWlCMFwwr8ghuwfI6TDIuD8PfH1DwaLdfZNLPXpHvePmjM7DoyiMs18ZoE4Ptle9kv7jXhVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211018; c=relaxed/simple;
	bh=TBytcNs6FKDZ35AsCgJO/0ul5mShvUrDsvFdhjjy6J0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoRbDdeXf4lgg3hBajoX0X3UqqFDMjL+rGa3jOgYtkKzKRyz/AY2O2G+HRSGbvjN4bjClFhIzU+3RwWRP3i8wsvATDTDhZ8mLUvMH389g2oHucGhYeZAz+PldMXEJm4YKJVAIGcK6TAGTsFES3wrxDQ8k0MfL7UQeiFLSNa71zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=E+A7igkF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="E+A7igkF"
Received: by smtp.kernel.org (Postfix)
	id 9B0D3C4CEEB; Wed, 14 May 2025 08:23:37 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FCCAC4CEF0;
	Wed, 14 May 2025 08:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4FCCAC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747211014;
	bh=TBytcNs6FKDZ35AsCgJO/0ul5mShvUrDsvFdhjjy6J0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E+A7igkFqNNN53OBFsXGTmN+URMDOWMnwhBRLkWwbOwqjzNX0Nz5Q2iuezPyVt4wq
	 Awb6Vd1u/esp2YL//5HJ5A7XChXdFaUvrR842Gxuj969r0xWVlGSSzI/CflKTn39WC
	 DlVJlbgbKJ10ZVp6ceP9MDZa0PO4U3lbmbyq4W9mhWQYD61fCnOb67O+uMXeXpCYVx
	 AcnaB0CHXkvhxjB9NcyDGRrvfio53S+qCVYxQYYjxbTYRhe6xHMAqkY5yxjWT47gaR
	 X8WexRE+AZkU3Y/+TjIpiKm0Ld+Xv9K6mWt97ru/WqI6mczXifCnXjpPNkp9z3EZPP
	 5uLT1Zpc5d3yw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3EF9D17E05F0;
	Wed, 14 May 2025 10:23:34 +0200 (CEST)
Message-ID: <ed7ad534-a517-4005-b61e-c8f2e82f1b27@collabora.com>
Date: Wed, 14 May 2025 10:23:33 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.16
To: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
 <7e8718b0-df78-44a6-a102-89529d6abcce@app.fastmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <7e8718b0-df78-44a6-a102-89529d6abcce@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/05/25 22:54, Arnd Bergmann ha scritto:
> On Tue, May 6, 2025, at 11:17, AngeloGioacchino Del Regno wrote:
> 
>>     - Since SCP firmwares are available on linux-firmware, the
>>       necessary nodes for the dual-core SCP were added to devicetree
>>       along with the firmware-name property in mt8390-genio-common,
>>       enabling hardware video encoders and decoders on the MediaTek
>>       Genio 510 and Genio 700 EVKs.
> 
> This looks wrong to me: the devicetree should never care about
> particular file names in a Linux repository.
> 
> Usually what happens is that the device driver must work with
> a particular firmware version, so the driver is the one that
> constructs a name based on what firmware is knows and what
> hardware it is running on, so a newer version of the driver
> can attempt to load a newer firmware that may be incompatible
> with the old driver.
> 
> The other patches in the branch all look fine to me.
> 
> Can you resend the pull request without these patches and
> try to come up with a different approach?
> 
>       Arnd

Uhm, I'm not sure if there was a misunderstanding - not only the MediaTek
devicetrees do that, but also Qualcomm ones are doing the same with their
adsp, cdsp, modem and adreno zap firmwares...

....not sure, should I drop those commits for now?

Thanks,
Angelo
