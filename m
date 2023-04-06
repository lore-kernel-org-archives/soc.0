Return-Path: <SRS0=Fn9z=75=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42346C7618D
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 09:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8976C433EF; Thu,  6 Apr 2023 09:53:55 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B809FC433D2;
	Thu,  6 Apr 2023 09:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B809FC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from [192.168.1.141] ([37.4.248.58]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mbj3Y-1qFZSR0syk-00dCMP; Thu, 06 Apr 2023 11:53:29 +0200
Message-ID: <e2afed14-fed3-772c-3acc-dc132b5a1078@i2se.com>
Date: Thu, 6 Apr 2023 11:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V5 2/6] dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W
 bridges
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Evgeniy Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-imx@nxp.com, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Stefan Wahren <stefan.wahren@chargebyte.com>
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
 <20230404080243.9613-3-stefan.wahren@chargebyte.com>
 <20230404133937.GA3778861-robh@kernel.org>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20230404133937.GA3778861-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:0O/V6QTsojIvgXV4Fk1tuxQtxxuAZMUe1iiigYfbvLQftTG6fms
 zi9q7rSWAKFJiPS67V4t4wTCmbsuhhisZdxEZ9DVGYSre/dTuQy4slbmVQDoId54BKYRfgl
 SMdvBy9UT2BcA6M/7Y3faj2lv4ou9l7ZaNjkmh3+EPWzdkSqS8mq4/wfiitHbHa65e9Fv87
 G9WtAPyBzc09gtUSZKrVw==
UI-OutboundReport: notjunk:1;M01:P0:CE6A8XmrUgc=;XlA21WkjInb765j+t3RZ0ju5wN/
 nvxHY0+p9CczOKbFZitZe8mguckGgQ22VizPlPoUUJHxdkJxDZZ20aiv2byrIp1tAH/S1seAe
 ZIC/XpNoMVAgwAQFRaLAKduegHdTlgp3UrtJ2E1fa6/GCnI5HZCRz1hhmduIRwURNgVMdWjZU
 nfTiybIP/tUPHpXOS8Zmn8Myv9rnJeifyzyzgbQDDBLoOrUwAVHjN5kSPtyRAOW5GnPAnTVhi
 un8F3YSB1ygZRBKStwRlGuK5KWosLRaGn98psMVA0vh7nJFNzJgeYguqUGHboKgsT/84Ny4Se
 CQEK268zZysVVTiwVzzfaWjZtXskGz4+ybKI3BcyRDxVJspv+lZRfBhbmTPMt31eTlndNXrKO
 y2aeWBHMuKAQDyrzEYtP4CXGLz4x0w2ztiVgjwBOc33CUOBcA8eBwlFWeEo2Y+ka9jwDtliWC
 F6LzDDNS4gdk+XJ3BnnPY2cjQSGu0AleoqcU03LljC49K9dzor/ehtcXeJ9UNKLK2D1MlXpHC
 FuEUV9cb63dRn2A8kkxHZk0IPwMAA8SMt89xs/SE0yDRLVvvpsxeKM9MqcKxPWQOF2cYdDwxw
 vyetMvLL9nnZFuIwRnZAAt+5YJI/LaIlnZ022GXHbJbD8tFJNiezRPgtXeDLBkjLMNarJYz/X
 29VEgUZdwvJ4My58HqLobTc8HtxwgeuTA7tpL3/UVQ==

Hi Greg,

Am 04.04.23 um 15:39 schrieb Rob Herring:
> On Tue, Apr 04, 2023 at 10:02:39AM +0200, Stefan Wahren wrote:
>> This adds a dedicated devicetree binding for the Maxim DS2482/DS2484
>> I2C to 1-W bridges, which can be extended later for further features
>> (e.g. sleep mode control GPIO). Since one wire is a bus, child nodes
>> needs to be allowed here.
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
>> ---
>>   .../devicetree/bindings/w1/maxim,ds2482.yaml  | 44 +++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Shawn Guo applied all patches from this series [1] except of this one 
and patch 3, which probably should go via your 1-w tree?

Unfortunately no feedback from Evgeniy so far. Should i resend these two 
patches for you?

Best regards
Stefan

[1] - 
https://lore.kernel.org/linux-arm-kernel/20230404080243.9613-1-stefan.wahren@chargebyte.com/T/

> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
