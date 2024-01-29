Return-Path: <SRS0=O2z2=JH=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45472C47DB3
	for <soc@archiver.kernel.org>; Mon, 29 Jan 2024 15:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C253C433A6; Mon, 29 Jan 2024 15:26:05 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C872C43390;
	Mon, 29 Jan 2024 15:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C872C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706541961;
	bh=ZG1xdpwN0j3h4vKnLtfo8LYRJBlg+GcfkYEDQkyRxqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ysa22greBZ0JHsAFsS3IXsM1qRb2yNIow/l+dcTBSV43VW7AshKqq/zKCadcc4Vua
	 X/BNt7KPtu+pwUzuOQOh2fubD7jNt2X49Di1kpPjDsbhSg5A3Y8n1zVremNHzi3fRb
	 iD6dG/qdduDfQH27mEkjAOCFFG5v946A9NM4xNUaB3JjLYFF+uUn1nG04l8Bo7FxgW
	 hgl1JnnymkqjRSOf8mPrsff8gAIxbvuuMVcKhdKI4e18/YFRBLaB7xufM+O7KEAUD8
	 bjxOVxu0pr8ALAWE2apahyzfj5heYJqlu1j69Ee/mK0pB3+hmjC+lD1JvYcoW5uQ9n
	 y8b8hjOQoiygQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5AD4F378047E;
	Mon, 29 Jan 2024 15:26:00 +0000 (UTC)
Message-ID: <f90a6034-b1ca-4245-a3cd-91d43152b780@collabora.com>
Date: Mon, 29 Jan 2024 16:25:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support for airoha en7581 Soc
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, soc@kernel.org,
 dd@embedd.com
References: <ZbeJ5okKQ66FXGxP@lore-desk>
 <9e1ad877-f55c-4045-bb92-c30614d6c1ff@linaro.org>
 <ed322f44-6f7a-414d-a650-76c17c057b08@app.fastmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ed322f44-6f7a-414d-a650-76c17c057b08@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/01/24 16:22, Arnd Bergmann ha scritto:
> On Mon, Jan 29, 2024, at 16:08, Krzysztof Kozlowski wrote:
>> On 29/01/2024 12:20, Lorenzo Bianconi wrote:
>>> Hi Matthias,
>>>
>>> I was wondering about the status of the following patches:
>>> https://lore.kernel.org/linux-arm-kernel/20231001122418.2688120-4-dd@embedd.com/T/#rbafabf4bf2473327f35ce7d79623f63838630537
>>>
>>> Do we need to respin them? Thx in advance.
>>
>> I don't see anyone from SoC maintainers CCed on that patchset, so no one
>> will pick it up. Pinging makes sense if maintainers missed/ignored your
>> email. But if you do not send stuff to maintainers, you need to resend
>> to proper people, not ping.
>>
>> Additionally, this is a new arch, but it seems to miss any maintainers
>> update.
> 
> I expect this to be picked up by the mediatek maintainers,
> same as what we did for the arch/arm/ port that was merged
> first.

Yes, we're doing that.

> While airoha is a separate company these days,

Not really... it's still a MediaTek subsidiary...

https://corp.mediatek.com/about/subsidiary-information

https://www.airoha.com/about

> I assume this is still closely related to mt7623, mt7683,
> and mt7622, just like en7523 was.

I assume the same. I'll add the airoha directory to the MAINTAINERS file
under ARM/Mediatek.

Cheers
Angelo


