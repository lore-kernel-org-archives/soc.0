Return-Path: <SRS0=5OsZ=TI=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA4FC433F5
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 10:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED815C340E7; Fri, 25 Feb 2022 10:26:23 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6003C340F1;
	Fri, 25 Feb 2022 10:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6003C340F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1645784783; x=1677320783;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Od2Q0PrAzsRZXZ0/z1Qgjp51QpoNvxr0jp+QIqhly54=;
  b=dS2kNRYH+ojGqwsGymkNMf/EcUoCjbjC/gOHbtoOyHRUioLzLtisZNpC
   Ha+xywXQ55fYaGOrfoVx+Alyt5xANmnPGkGRkQdao0pAnK4SHdDQBlNMM
   UPLcCVNnpNDmltWC78GqYQpBACMCA/AuQ0WurIskzjTF9fq2xRyzpApYp
   2T2giKcophZg97xmFxwKgPBhWDjznmvGdDrNjP5+3zwt6TGg1cEM0qkzp
   eCti75XX4jiZqqorORLM7yoVwI9S5FgO+JmeG9zuzzscnZWZ71IZ0bIcl
   nLSnS8A8fMZWJl8bObGqgj5HUkMr28PguXAnwsbJFUwxBBF9plSvO4hPM
   A==;
X-IronPort-AV: E=Sophos;i="5.90,136,1643698800"; 
   d="scan'208";a="154399769"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Feb 2022 03:26:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 25 Feb 2022 03:26:16 -0700
Received: from [10.12.72.56] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 25 Feb 2022 03:26:13 -0700
Message-ID: <3f5fdfca-1bbc-d6aa-4649-c50a9cd92052@microchip.com>
Date: Fri, 25 Feb 2022 11:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7] ARM: dts: add DT for lan966 SoC and 2-port board
 pcb8291
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
List-Id: <soc.lore.kernel.org>
CC: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>, <arnd@arndb.de>,
	<alexandre.belloni@bootlin.com>, <olof@lixom.net>, <soc@kernel.org>,
	<robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<UNGLinuxDriver@microchip.com>, <Manohar.Puri@microchip.com>
References: <20220221080858.14233-1-kavyasree.kotagiri@microchip.com>
 <3b4c56201a478876783e69243c901cd8@walle.cc>
 <85566f97-dcfc-f477-1ebb-5cac955b791a@microchip.com>
 <413b29b8a2e7a73561f942d4b7c78b9b@walle.cc>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <413b29b8a2e7a73561f942d4b7c78b9b@walle.cc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 24/02/2022 at 15:55, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi,
> 
> Am 2022-02-24 15:51, schrieb Nicolas Ferre:
>>>> +/ {
>>>> +     model = "Microchip LAN966 family SoC";
>>>> +     compatible = "microchip,lan966";
>>>
>>> As mentioned earlier, this isn't a documented compatible string. So,
>>> I guess without overwriting this in the board dts it will throw an
>>> error with the dt schema validator. OTOH, there are many dtsi files
>>> in arch/arm/boot/dts/ doing this. I don't know what is correct here.
>>
>> I see it documented here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/arm/atmel-at91.yaml#n165
>>
>> Isn't it what is expected?
> 
> That only documents
>     compatible = "microchip,lan9662-pcb8291", "microchip,lan9662",
> "microchip,lan966";
> 
> But not the one above.

Oh, you mean the "microchip,lan966" string alone in the compatibility 
string and not with the other ones before it...
I didn't know it could be different in yaml syntax. Thanks for 
highlighting that.

Best regards,
   Nicolas

> 
>>
>>> Everthing else looks good.
>>
>> Thanks a lot for your reviews.
>>
>>> Reviewed-by: Michael Walle <michael@walle.cc>
>>
>> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>> I'm queuing it to at91-dt branch for reaching arm-soc in 5.18 merge
>> window.
> 
> Nice, then I'm good to go for my patches on top of this :)
> 
> -michael


-- 
Nicolas Ferre
