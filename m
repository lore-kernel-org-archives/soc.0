Return-Path: <SRS0=wGUo=E6=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7651FEDE99E
	for <soc@archiver.kernel.org>; Thu, 14 Sep 2023 10:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E6DAC433CD; Thu, 14 Sep 2023 10:11:24 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 208B6C433C7;
	Thu, 14 Sep 2023 10:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 208B6C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DCF5A66072FF;
	Thu, 14 Sep 2023 11:11:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694686281;
	bh=pW2fXhgYd087DAThEUGlhnW+L8Z4AHCYWNF2WJy/EZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ehERT+FWUklXi+FT5EU8D6a6jQO1npQRKvZDNsX6gcJ/nXM5nD/+SOy0+kHzyF/P1
	 mx2zrYmsVi/tBxoeUF8JcFpobPeNT9/ZE8SLdQNIwKCUnjm/RT95E3aHChghGMeeS+
	 lBQf519TMsRvXvYpiYSO5bM6SzhXDhJF+gWgcYBw/q+voNW8r6+lxoQcQa+H8PiLcK
	 lamJoO8SVkKvJVmaziELiW61vps5Xrco0+/rwh1c4Qd1TDS6FytJHO+twrW9FNJ/E4
	 efBr/h6j9/Q3OTE91fkmd0KPtHJP1yFLw7BBrfxb+T4e1h72Cy5oreVoMyKbc9W5Fh
	 2JMyXr21QbHCQ==
Message-ID: <33789243-6774-bc80-6967-dfd2bc2ec9d6@collabora.com>
Date: Thu, 14 Sep 2023 12:11:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] arm64: dts: mediatek: Fix "mediatek,merge-mute" and
 "mediatek,merge-fifo-en" types
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh@kernel.org>, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230830195650.704737-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230830195650.704737-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 30/08/23 21:56, Rob Herring ha scritto:
> "mediatek,merge-mute" and "mediatek,merge-fifo-en" properties are defined
> and used as boolean properties which in DT have no value.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


