Return-Path: <SRS0=WIbn=AG=ioremap.net=zbr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8B3C77B70
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 22:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C193C4339B; Sat, 15 Apr 2023 22:26:12 +0000 (UTC)
Received: from forward501c.mail.yandex.net (forward501c.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6831FC433D2;
	Sat, 15 Apr 2023 22:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6831FC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ioremap.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ioremap.net
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:992a:0:640:c3bc:0])
	by forward501c.mail.yandex.net (Yandex) with ESMTP id 0B8D95E4FA;
	Sun, 16 Apr 2023 01:25:58 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id rPiwCiZWr8c0-9qdmcQtV;
	Sun, 16 Apr 2023 01:25:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ioremap.net; s=mail; t=1681597557;
	bh=j6QL5cAd6kmENaJ82LDvshMMXQELa95dKR1dUFlpYmE=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=KaRSxOwkFKngw62Mbq9RoV51ofVHld/zLGoioK+9FWyilxZT2EsW222DYznSvgdrT
	 7Rc//KVRiQ5bRdqCNuHZX4LAgcJlHMQ9mNXS0o1qanoaGGax8OkT//rCNVnF7Z/24H
	 JTMUIVhEess3Tjq0Zg7h1iT8bBbc+aOxoXFhLSbg=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@ioremap.net
Message-ID: <daa72583-922f-4ed5-f7e9-36423dd899a0@ioremap.net>
Date: Sat, 15 Apr 2023 23:25:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V5 2/6] dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W
 bridges
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Wahren <stefan.wahren@i2se.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Stefan Wahren <stefan.wahren@chargebyte.com>
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
 <20230404080243.9613-3-stefan.wahren@chargebyte.com>
 <20230404133937.GA3778861-robh@kernel.org>
 <e2afed14-fed3-772c-3acc-dc132b5a1078@i2se.com>
 <2023040651-baboon-busybody-6175@gregkh>
 <bdcf41d5-cd61-1e95-0b21-b8fe401644bd@ioremap.net>
 <dc794f94-42ff-33a5-facc-5fe09f6da295@linaro.org>
 <4649763c-4355-758e-dcdc-5bdb4277c441@linaro.org>
From: Evgeniy Polyakov <zbr@ioremap.net>
In-Reply-To: <4649763c-4355-758e-dcdc-5bdb4277c441@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof

On 15/04/2023 10:34, Krzysztof Kozlowski wrote:
>>> Thank you for the patches Stefan, but I'm no longer a w1 maintainer,
>>> sorry I haven't updated the maintainers file, please send all w1 patches
>>> to Greg.
>>
>> Thanks Evgeniy.
>>
>> If the one-wire subsystem is orphaned, I can manage the patches to
>> offload Greg a bit.
> 
> There was not feedback on my proposal, which I am optimistically going
> to understand as "go ahead". :)
> 
> I'll send a patch, assuming Evgeniy that you are not planning to
> maintain w1 anymore and a new maintainer would be useful.

Greg has been managing all the w1 patches for last years and as far as I 
understand, in particular since I stepped out, I'm totally not against 
anyone picking up the queue from him or doing it the way I've been doing 
through his tree, but please discuss it with him and come up with the 
solution which works best, I have no word in it.

Thank you.
