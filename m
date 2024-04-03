Return-Path: <SRS0=EM7Q=LI=codeconstruct.com.au=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272DBCD1288
	for <soc@archiver.kernel.org>; Wed,  3 Apr 2024 03:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E96BAC433F1; Wed,  3 Apr 2024 03:29:32 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A32F8C433C7;
	Wed,  3 Apr 2024 03:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A32F8C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BF8CF20075;
	Wed,  3 Apr 2024 11:29:18 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712114969;
	bh=1EIgt9ACWXed19+CaCKn14yKWR326KDE1bbmos0k4nQ=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=WM/sePX4JC/BBusJTYbStdbfybWmQb6z2+R9oPr1BMeNxlNrdw5bi0fYd8PdI7ycT
	 6H8szIlqqZs8NWFXbe+6ZCHY0l1gcQwuzTnIja7f46/h26kG7rDSwKcDIp3dJvODGg
	 XXO9GKtObUHJCX4YPJXN5FllsBTKhoiVzBbfJcL8lM3JUW6x69IEjM8tuqrUDXYCd8
	 7OCM/5BxRwaaEsLPMsoamm8Qd1pQi92Vl/aMhPujUv/rXA3+u67j+pQLEwofxC66w6
	 /pDKlcOnnUDt9pR+0w94bfUgsOXdlCnLHazyMvuNUIoCl/SAL7OJghdsC8Kd1pDjko
	 lHGvD8/TY40/Q==
Message-ID: <42e91dc2bccdcac96abd729def8a05b2612488a7.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/3] ARM: dts: Disable unused ADC channels for Asrock
 X570D4U BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
List-Id: <soc.lore.kernel.org>
To: Renze Nicolai <renze@rnplus.nl>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org,  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au,  andrew@aj.id.au
Date: Wed, 03 Apr 2024 13:59:17 +1030
In-Reply-To: <20240329130152.878944-3-renze@rnplus.nl>
References: <20240329130152.878944-1-renze@rnplus.nl>
	 <20240329130152.878944-3-renze@rnplus.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0

Hi Renze,

On Fri, 2024-03-29 at 14:01 +0100, Renze Nicolai wrote:
> This commit disables unused ADC channels and labels the ADC channels used=
 with their function.

Please run this through checkpatch and address the warnings.

Also, the submitting patches documentation[1] suggests using the
imperative mood - instead of "This commit disables ...", use "Disable
...". The change subject is phrased the expected way.

[1]: https://docs.kernel.org/process/submitting-patches.html

Taking the subject and the description together, the description feels
a little redundant. Maybe it could be trimmed back to

> Also, label the ADC channels used with their function.

Andrew

