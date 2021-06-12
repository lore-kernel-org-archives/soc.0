Return-Path: <SRS0=4GED=LG=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30FBC48BE5
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 09:21:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 93D2161374; Sat, 12 Jun 2021 09:21:35 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631CC6108E;
	Sat, 12 Jun 2021 09:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 631CC6108E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wr1-f50.google.com with SMTP id r9so8542518wrz.10;
        Sat, 12 Jun 2021 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VPyfpqUMlxaWdAzLxId3Zh5R6JorORKQlcjlpTdHelo=;
        b=WBu1HCdi/S31eLGZ4097FPwjEU+DY8GX9ch7FcVF2Pku3eCw7UKY2MgUUFvTO0Hj9X
         894JgYQx//cwhbtezHsqIc1BJGPSTQrtn2+Yhg+wxoaKClgGrAMDpAHmMwRgFw9Trjdr
         HPy/wMVkrzY604BmPMAU7OFsHXEPHKBB8xAuckjfNdDfwFXhyMZJjwWdTaGNSL6MCbrI
         PP6dlsn+/rfnyp6jBmillGqFo7DLgFxG2CrH1eSCiXQyoGiuwd5kxuibpMdpLblENOef
         V6Ao2+gcqT+1ZSv475obc0Fxso5cIxHVidPjwFnahKQedOMhCsTQUG43c9OD6rwZjE+f
         JWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VPyfpqUMlxaWdAzLxId3Zh5R6JorORKQlcjlpTdHelo=;
        b=E7ZVjllCVtXJMb/zVPA24YbkpbGOp6ZTAEDaYo4UhQ/5eJBj95jaey+8RwGihbaWcp
         CzHnJpLaDGJUnoib8e5Nztxro+qq0dZk9rncEocQUvBEfdyzWdXzrOG67djSdsgWvRQC
         Tt1PY2wkfDUKYA6zhLvWFDTRKaz7acSw8zxRWrTZLLlMyq3Y092UG5qVflVjKkhI5SJZ
         U/fZHLXRzy7x/IiL1eGt5yYQEYW/pqYo9cuxj3X27yPbpZCPPtVRQ0clcJDmp0cqHSgA
         cgGEzL1bQeuhb1XrknYcFw5wN1ZXzy+161Xr0UefJ6DYzmzOGO+NpYLjqkY9M57DoB4M
         3Nsw==
X-Gm-Message-State: AOAM531FLlQjWeRO3LQy8yUkV6ZkHvFQBD8vY7w9lw+zkVCYh6GEeWCf
	MaZ6BoAGB7zDLU4RYIOH114=
X-Google-Smtp-Source: ABdhPJx1SmIKt8DQjEBrnkm86h9UTaK5hGf5oK2W6pHvVhU3I/3Rp6viczcAtjNXXOl91Mjt/XRPZQ==
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr8237318wri.36.1623489694024;
        Sat, 12 Jun 2021 02:21:34 -0700 (PDT)
Received: from localhost.localdomain (haganm.plus.com. [212.159.108.31])
        by smtp.gmail.com with ESMTPSA id l10sm9562095wrs.11.2021.06.12.02.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 02:21:33 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
To: Vladimir Oltean <olteanv@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-2-mnhagan88@gmail.com>
 <20210611194644.64lvhvp76wy6guqp@skbuf>
From: Matthew Hagan <mnhagan88@gmail.com>
Message-ID: <f0af3f0a-ab13-ecdc-d834-c95ddcb52866@gmail.com>
Date: Sat, 12 Jun 2021 10:21:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611194644.64lvhvp76wy6guqp@skbuf>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Vladimir,

Many thanks for taking the time to review the submission.

On 11/06/2021 20:46, Vladimir Oltean wrote:

> On Fri, Jun 11, 2021 at 12:27:13AM +0100, Matthew Hagan wrote:
>> Add bindings for the Meraki MX64/MX65 series. Note this patch should be
>> applied on top of "dt-bindings: arm: bcm: add NSP devices to SoCs".
>>
>> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
>> index 78dfa315f3d0..7d184ba7d180 100644
>> --- a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
>> @@ -62,6 +62,12 @@ properties:
>>            - enum:
>>                - brcm,bcm958625hr
>>                - brcm,bcm958625k
>> +              - meraki,mx64
>> +              - meraki,mx64-a0
>> +              - meraki,mx64w
>> +              - meraki,mx64w-a0
>> +              - meraki,mx65
>> +              - meraki,mx65w
>>            - const: brcm,bcm58625
>>            - const: brcm,nsp
>>  
>> -- 
>> 2.26.3
>>
> I think these compatibles describe SoCs, whereas Meraki MX64/MX65 are
> boards, so this is a miscategorization. Can you not just describe the
> Northstar Plus SoC that you are using in your compatible string?

My understanding is that the bcm958625hr and bcm958625k are dev boards
using the BCM58625 SoC variant of NSP. For reference, a close example
can be found in brcm,bcm4708.yaml in the same directory:

      - description: BCM53012 based boards
        items:
          - enum:
              - brcm,bcm953012er
              - brcm,bcm953012hr
              - brcm,bcm953012k
              - meraki,mr32
          - const: brcm,brcm53012
          - const: brcm,brcm53016
          - const: brcm,bcm4708

For the compatible string we would definitely need to specify a unique
device name for identification by the OS, rather than just the SoC.

Of course I could be mistaken. Will await confirmation on this.

Matthew

