Return-Path: <SRS0=isyU=75=ioremap.net=zbr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D3EC76196
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 11:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB497C4339B; Thu,  6 Apr 2023 11:47:58 +0000 (UTC)
Received: from forward502b.mail.yandex.net (forward502b.mail.yandex.net [178.154.239.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9236AC433D2;
	Thu,  6 Apr 2023 11:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9236AC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ioremap.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ioremap.net
Received: from mail-nwsmtp-smtp-production-main-92.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:131b:0:640:f0f5:0])
	by forward502b.mail.yandex.net (Yandex) with ESMTP id 519DE5F0EC;
	Thu,  6 Apr 2023 14:47:42 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id clONjBKWn4Y0-rKcaeQLr;
	Thu, 06 Apr 2023 14:47:41 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ioremap.net; s=mail; t=1680781661;
	bh=WOKr1v7lcEyp0qi7jQb23tgfBsFOsN9ygiSdXAkNyhQ=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=BqMpUcsxqxJmjzX28fvcvDuGfC9z2mRGuzfNF5heZd78+AzLxaAVj4vkYXMlyjKFj
	 EXdRSv+tI2EJ406g/gepBMI8+rBHDBsYoSgFk6Z3QIuJ9gvpovaXgejIF1LHAcxHIK
	 vh/cepa4x4CHgFBkieNO8Dm09OAHWxHFB+/ty89o=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.myt.yp-c.yandex.net; dkim=pass header.i=@ioremap.net
Message-ID: <bdcf41d5-cd61-1e95-0b21-b8fe401644bd@ioremap.net>
Date: Thu, 6 Apr 2023 12:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V5 2/6] dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W
 bridges
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Stefan Wahren <stefan.wahren@chargebyte.com>
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
 <20230404080243.9613-3-stefan.wahren@chargebyte.com>
 <20230404133937.GA3778861-robh@kernel.org>
 <e2afed14-fed3-772c-3acc-dc132b5a1078@i2se.com>
 <2023040651-baboon-busybody-6175@gregkh>
From: Evgeniy Polyakov <zbr@ioremap.net>
In-Reply-To: <2023040651-baboon-busybody-6175@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Stefan, Greg, hi

On 06/04/2023 10:58, Greg Kroah-Hartman wrote:
> On Thu, Apr 06, 2023 at 11:53:28AM +0200, Stefan Wahren wrote:
>> Unfortunately no feedback from Evgeniy so far. Should i resend these two
>> patches for you?
> 
> Please do.

Thank you for the patches Stefan, but I'm no longer a w1 maintainer, 
sorry I haven't updated the maintainers file, please send all w1 patches 
to Greg.

