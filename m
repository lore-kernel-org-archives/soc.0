Return-Path: <SRS0=O2z2=JH=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15CBC47422
	for <soc@archiver.kernel.org>; Mon, 29 Jan 2024 11:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B100C433C7; Mon, 29 Jan 2024 11:34:43 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8286CC43390;
	Mon, 29 Jan 2024 11:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8286CC43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706528078;
	bh=sTKJ4dc2QFtniDlFh48ND0cmuzA7RoyY6+1+P+AHxDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wQPF620wrtJaSl0q0xFKnW3adUuXTYWJmKxXtlzkxberCxGP1QfBhLuR6DT6wNClT
	 f3NzVTcFG03xEB0RKQWIIxvOpGlRPNsGO2H780BtpAVX/BcqYCGgDcorvhlgusm0lZ
	 Fw9GLCJf05QZrcZyuruiOVyD02HYlq13Jrd6jdMBGm42Fc/FX8WQmN3NZlRaqH1D3g
	 iwzV/TIJD7ORChdOZyw2yIgSI6w6CCP2351rmO6sTkwH69r72+qkcUlvepMspo7ei0
	 QBk+v2B3EcZ9/k+MIMivZofRz6x57mbb8aA9/Olb1zCFMoGUNX3Kv9J7DZypla1dyy
	 12gD3Zs2ch93g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 00E263780029;
	Mon, 29 Jan 2024 11:34:37 +0000 (UTC)
Message-ID: <f16842b0-0086-41b6-a366-e27ccb2905c1@collabora.com>
Date: Mon, 29 Jan 2024 12:34:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support for airoha en7581 Soc
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, dd@embedd.com
References: <ZbeJ5okKQ66FXGxP@lore-desk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ZbeJ5okKQ66FXGxP@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/01/24 12:20, Lorenzo Bianconi ha scritto:
> Hi Matthias,
> 
> I was wondering about the status of the following patches:
> https://lore.kernel.org/linux-arm-kernel/20231001122418.2688120-4-dd@embedd.com/T/#rbafabf4bf2473327f35ce7d79623f63838630537
> 
> Do we need to respin them? Thx in advance.
> 

Lorenzo, I don't think you have to.

Matthias, should we update the MAINTAINERS file to include the MediaTek
Airoha folder?

Actually that question is for both ARM and ARM64.

Cheers
