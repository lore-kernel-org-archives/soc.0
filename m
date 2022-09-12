Return-Path: <SRS0=ZTeZ=ZP=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FECDECAAD5
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 12:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F7CEC433B5; Mon, 12 Sep 2022 12:08:13 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 14543C433D6;
	Mon, 12 Sep 2022 12:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14543C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 12 Sep 2022 21:08:09 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 6048120584CE;
	Mon, 12 Sep 2022 21:08:09 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Mon, 12 Sep 2022 21:08:09 +0900
Received: from [10.212.158.44] (unknown [10.212.158.44])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 1B5A9B62A4;
	Mon, 12 Sep 2022 21:08:08 +0900 (JST)
Subject: Re: [PATCH v2 2/8] ARM: dts: uniphier: Rename usb-phy node to
 usb-glue
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220912071511.1385-1-hayashi.kunihiko@socionext.com>
 <20220912071511.1385-3-hayashi.kunihiko@socionext.com>
 <2a386281-5a49-4df6-bafe-ef9de0fb0ca5@www.fastmail.com>
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <5040fdd1-3ca0-1659-a572-fcc9b64499f9@socionext.com>
Date: Mon, 12 Sep 2022 21:10:21 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2a386281-5a49-4df6-bafe-ef9de0fb0ca5@www.fastmail.com>
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Arnd,

Thank you for checking.

On 2022/09/12 17:32, Arnd Bergmann wrote:
> On Mon, Sep 12, 2022, at 9:15 AM, Kunihiko Hayashi wrote:
>> Actual phy nodes are each child node. The parent node should be usb-glue
>> node. This applies to the devicetre for Pro4 SoC.
>>
>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>> ---
>>   arch/arm/boot/dts/uniphier-pro4.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi
>> b/arch/arm/boot/dts/uniphier-pro4.dtsi
>> index a53b73ee93e9..cf62821c69ca 100644
>> --- a/arch/arm/boot/dts/uniphier-pro4.dtsi
>> +++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
>> @@ -376,7 +376,7 @@ pinctrl: pinctrl {
>>   				compatible =
> "socionext,uniphier-pro4-pinctrl";
>>   			};
>>
>> -			usb-phy {
>> +			usb-glue {
>>   				compatible =
> "socionext,uniphier-pro4-usb2-phy";
>>   				#address-cells = <1>;
>>   				#size-cells = <0>;
> 
> Not sure about this one. What hardware does this node
> actaully represent? I don't see any other soc dts files
> refer to node names as 'glue', so there is probably a
> better name for it. In the binding document, it's called
> "usb-controller", but I'm not sure that is the right name
> either.
Surely, "glue" is uncommon, and "usb-controller" is suitable
to represent the integration of usb-related functionality.
I'll review the node names.

Thank you,

---
Best Regards
Kunihiko Hayashi
