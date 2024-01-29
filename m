Return-Path: <SRS0=O2z2=JH=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE01FC47422
	for <soc@archiver.kernel.org>; Mon, 29 Jan 2024 11:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB877C43390; Mon, 29 Jan 2024 11:41:49 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8B57C433C7;
	Mon, 29 Jan 2024 11:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8B57C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706528505;
	bh=EN7taMbsZ4JvwQRhusiP6ICCLdzXLJsw+sqYbACBuDI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qg+07uLjBw2ybBNZrJWOLESfJSu/Z2qKHYYqb3Xu7iLw+R+//eSR8MoZf/F6WOLHP
	 BQJ87G9T3U1ZDy5TNNAUBI3bo6/QjIc4lqpyjKBGjXWfkiy6ih8DjydbNJOamY9dGI
	 4lITctITMYoVcNdoAVMfDC6X2C6DmOfuORJUZ9E3IxydCL0lYWrAA0K9gogkMab2e6
	 NcvCPUwrXHT0NdiQ4ds0UtOaF7qqYlryb/fd0G+sUgmS4uf9mpZYbgO3N4hdbeeyYt
	 Zp/fGJOiWMSqBfBefZK4/oRLKiE+hTtcNc8oQwaHywywK+uNJ1g7ic7FjC/B00UcIF
	 W9xnB1OgTqZ5g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E4A5F3780029;
	Mon, 29 Jan 2024 11:41:44 +0000 (UTC)
Message-ID: <841e102c-c5ab-432c-bdba-efdd67a3c129@collabora.com>
Date: Mon, 29 Jan 2024 12:41:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support for airoha en7581 Soc
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, dd@embedd.com
References: <ZbeJ5okKQ66FXGxP@lore-desk>
 <f16842b0-0086-41b6-a366-e27ccb2905c1@collabora.com>
 <20240129-gawk-strongly-91344f34d004@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240129-gawk-strongly-91344f34d004@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/01/24 12:39, Conor Dooley ha scritto:
> On Mon, Jan 29, 2024 at 12:34:37PM +0100, AngeloGioacchino Del Regno wrote:
>> Il 29/01/24 12:20, Lorenzo Bianconi ha scritto:
>>> Hi Matthias,
>>>
>>> I was wondering about the status of the following patches:
>>> https://lore.kernel.org/linux-arm-kernel/20231001122418.2688120-4-dd@embedd.com/T/#rbafabf4bf2473327f35ce7d79623f63838630537
>>>
>>> Do we need to respin them? Thx in advance.
>>>
>>
>> Lorenzo, I don't think you have to.
> 
> The compatibles in en7581-evb.dts appear to be undocumented as of
> whatever linux-next I have checked out from late last week.
> 

Right, there's a 7523, but not a 7581.
Needs one more commit :-)

>>
>> Matthias, should we update the MAINTAINERS file to include the MediaTek
>> Airoha folder?
>>
>> Actually that question is for both ARM and ARM64.
>>
>> Cheers

