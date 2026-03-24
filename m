Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B825F38A288
	for <soc@lists.linux.dev>; Tue, 24 Mar 2026 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360349; cv=none; b=nQvInOntxAf0fWDkJNipFdcaiyqNuSIdZmYZZimT74X90UM3jyOyl9txOmgTMVe267ngpl3l+Pam4RizwVBGFUqueKrUyxPileC8dsBTCNEZ0q+Qpr0f8EZsucqe/Yt1b3dlXXZcLRr0Azn+v+WlYleev99TQn2hQlV3RuFiPtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360349; c=relaxed/simple;
	bh=94g3Jg52tfyyaalRLEEVRBjds2/VXmSCbqO88/kuIRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=neMGzZhCXWrkMLCvnx6NXZ8js6VWiHULfAm1hjsyyFUMonqKYX8K96pAa8CowvC5J6NVfubRd+eAO94yh7EUGx+PnC3QLW6L9eR0DaSaekp0qGhFWqRBBd8PsooSPc+3rN8huCjl6e5T3c3CDo/g8LFjSmJVU3ogcyG2ciFQV9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Br2n+bfW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Br2n+bfW"
Received: by smtp.kernel.org (Postfix)
	id 6A73FC4AF0D; Tue, 24 Mar 2026 13:52:29 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E5B5C2BC87;
	Tue, 24 Mar 2026 13:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E5B5C2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774360345;
	bh=94g3Jg52tfyyaalRLEEVRBjds2/VXmSCbqO88/kuIRM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Br2n+bfWa86iLGjFkIKN3RXN70ujcfb5BBGlJ72iAEPgKZfE7mXdNCAt3y5CCgyjA
	 mZOcyi2mcQPViWimIfZcQXVGr19CjvgsYAOBMYoDZXHZ7FtDIZ7prhuVJ4vvNrbBne
	 Z7dLzKzSbTWeIKV2TJkBHanxNz6/+3dbteGRV7ig8j6iAJ8E4JnTUJ963dleOyCQRY
	 hrwstTi04oV+K4s3/TnPwBc5b/TSYdX2G0wCpWg+Lo4ldPa82DyMjHFdiLBqzHgIqu
	 lHygSjtJb+uTCx1k93vYMoHfeZjMT3X7x0CA6dCaL9C09ApJfZ+inXHJR/Ya8CbLFb
	 XewNfOpBZ++bg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92CBA17E5A12;
	Tue, 24 Mar 2026 14:52:25 +0100 (CET)
Message-ID: <b8b9ad39-0e9e-4c38-b080-85153b2a66d1@collabora.com>
Date: Tue, 24 Mar 2026 14:52:25 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com
References: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>
 <20260321-aspiring-real-foxhound-4a18e7@quoll>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260321-aspiring-real-foxhound-4a18e7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/03/26 12:07, Krzysztof Kozlowski ha scritto:
> On Fri, Mar 20, 2026 at 09:56:38AM +0100, AngeloGioacchino Del Regno wrote:
>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>
>>    Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v7.1
>>
>> for you to fetch changes up to 820ed0c1a13c5fafb36232538d793f99a0986ef3:
>>
>>    arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count (2026-03-12 13:32:17 +0100)
> 
> Days in linux-next:
> ----------------------------------------
>   0 | +++ (3)
> 
> With 0 days in next, you cannot really react on any bug reports.
> 

OUCH!!!

Sorry about that, I didn't notice that my for-next didn't get pushed when I tried
to actually push it (and I was 100% convinced that I had checked after pushing).

Krzysztof, thanks for making me notice, that was completely unintentional.

I re-pushed the for-next branch exactly a second ago; that should give it some good
time in -next ... or well, otherwise, we can always delay those commits for v7.2 or
for fixes.

Cheers,
Angelo
