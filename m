Return-Path: <SRS0=M/jh=56=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4262C05027
	for <soc@archiver.kernel.org>; Thu,  2 Feb 2023 09:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77E4AC4339C; Thu,  2 Feb 2023 09:08:23 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6CB9C433D2;
	Thu,  2 Feb 2023 09:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B6CB9C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 719246602EDA;
	Thu,  2 Feb 2023 09:08:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675328899;
	bh=5IakbPPTAHlstWlMaParv0t58Oe6vt85g0wiRgRU03M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AhJLb6xZ/WrXG051Pd9hnZMFZididw3HEhWfNcyYmcyYlxZorcpLJ43/xX4lHOkHm
	 T7an22q8EKxOvfoZaT7MzjEC3zZr25DQC5iiTGrr76VQ6TWTSUcrSI8UIJ41lFUSan
	 87WsaiLeOOB0TOOBeIswrszW2PdYwP/UNQPE8qJI3xFMoBv/U8FYkfSPVA2fJrGlEW
	 f2oNjJi9cIwRguMO7le/Y7krXBonv6PjymZWsVyRelhDZgHTiztw/2U7ySsoTarioO
	 ojIUAPMIdNcjCMIZOsQoIgP+DRyZrZRXMyiar+6GKNyFavbySmPJv/j6R/+FLXz/Io
	 IR8ovNuCfoRPA==
Message-ID: <4db8fb55-a02b-d98e-65f4-1a095c43104f@collabora.com>
Date: Thu, 2 Feb 2023 10:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] MAINTAINERS: Update entry for MediaTek SoC support
List-Id: <soc.lore.kernel.org>
To: matthias.bgg@kernel.org, arm@kernel.org, soc@kernel.org, arnd@arndb.de,
 olof@lixom.net
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230201152256.19514-1-matthias.bgg@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230201152256.19514-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/02/23 16:22, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The linux-mediatek IRC channel has moved to liber.chat for quite some
> time. Apart from that, not all patches are also send to LKML, so add
> this ML explicitly.
> 
> And last but not least:
> Angelo does a wunderfull job in reviewing patches for all kind of
> devices from MediaTek.
> 
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Is a R-b tag appropriate here to say "yes, go on with setting me as a reviewer"?

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: Thank you :-)

Cheers,
Angelo

