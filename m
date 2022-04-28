Return-Path: <SRS0=sTNi=VG=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EEBC433F5
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 00:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2516C385AE; Thu, 28 Apr 2022 00:02:01 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0753AC385A7;
	Thu, 28 Apr 2022 00:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0753AC385A7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d15so2895424pll.10;
        Wed, 27 Apr 2022 17:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MQAHzj75bUL24cVXZai27Cp7fT8NBFoM4IN6VdxYD9M=;
        b=qrgstjD662uD0mASf4Lns6/fJJC8Tw6D60c8TonIiOHwaARfrwncV13tYmVyM4dxRf
         Xp5N9IIzn+L4Dn/v+Nicm554zwRblHhkT7QlMbIKLyJKPqmozxzf1aEI2NehOEziAGce
         h9ZWydlpd9ICko97l/P64TYeUxHYPz57A/rzewn6fGiFStDOhSqD8SbfnuoJIpP6gYqu
         rsMar46OapajVOcXf1Qym7RuOOWc8lQDH9rGGJrswsJqBN/RU0gYvo49pN5fnRrL6p56
         KC8Ig8QDfOHwousLQ6SXkfmKHTHuqeJ7snT58Fac3P60N6gOV//APIBU7P483/8tkpqb
         sLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MQAHzj75bUL24cVXZai27Cp7fT8NBFoM4IN6VdxYD9M=;
        b=VXw+18oQ9sWC+00I7AGkOWj11u0CNj1xt1YU//gQ5OF6PLM9Qs1c2UA7Co6hcHH7Zr
         tjTUlvOCnNv3BEk4H9Oa1G30E5Vk5RyQJZNbrtnliCvRRUqitnnEYiDRlI5TEbmS8/l3
         A0e3F69oGwptQMMRgo7aIsdpPAB7/cf79Ls0PMIkWXEgixD9I2bpiXc+ph4g6MhDefan
         RnK6QvviMpS/RONvtWycPokaijMQcxpvwK8rtXT/BVcv3ImTe4V76QiGq24uw0H13RjP
         W705fP4W+Xc+LTYLM426ODh80xROkb2UbC09l1w7FlVF1HnVFFRw2MHj1XOfoDh/UnJJ
         2A0g==
X-Gm-Message-State: AOAM530C4mDMW7Ix8SgjGe4l6v0wzXuj8STnvXGyvMtZvbKBcSMJGuD0
	iE/sgtBM2fwYSf7yTGqqa5DbOZD+L+I=
X-Google-Smtp-Source: ABdhPJzZHN/PJml0c5wTRNM4ywoHQ5+7W4SXdULxBRlC6dGLU7RIBY8NFxoHyuzclzXuZoehvRDd8g==
X-Received: by 2002:a17:903:31d1:b0:159:804:e852 with SMTP id v17-20020a17090331d100b001590804e852mr30769629ple.19.1651104120170;
        Wed, 27 Apr 2022 17:02:00 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:4a48:7132:60ce:33ea:8830? ([2600:8802:b00:4a48:7132:60ce:33ea:8830])
        by smtp.gmail.com with ESMTPSA id x2-20020aa79182000000b00505a61ec387sm19612074pfa.138.2022.04.27.17.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 17:01:59 -0700 (PDT)
Message-ID: <21986066-f72c-83ce-d1b9-ef5767fdebef@gmail.com>
Date: Wed, 27 Apr 2022 17:01:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH v2 2/3] of: Add support for -@ when compiling overlays
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Detlev Casanova <detlev.casanova@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 f.fainelli@gmail.com, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 masahiroy@kernel.org, michal.lkml@markovi.net, ndesaulniers@google.com,
 nsaenz@kernel.org, olof@lixom.net, rjui@broadcom.com, sbranden@broadcom.com,
 soc@kernel.org, stefan.wahren@i2se.com
References: <20220427185243.173594-1-detlev.casanova@collabora.com>
 <20220427185243.173594-3-detlev.casanova@collabora.com>
 <Ymm0l2/oGpt/SeDO@robh.at.kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <Ymm0l2/oGpt/SeDO@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/27/2022 2:24 PM, Rob Herring wrote:
> On Wed, Apr 27, 2022 at 02:52:42PM -0400, Detlev Casanova wrote:
>> This commit adds an option to compile all device trees with -@ to add the
>> symbol table to the Device Tree Blobs.
> 
> Why would we want to tie this to the kernel config?
> 
> Globally enabling it has already been discussed and rejected.
> 
>> It prepares the introduction of device tree overlays that are
>> not applied on device trees at compile time (dtbo files.)
>>
>> These device tree overlays will be used by either a bootloader or a
>> linux userspace tool to extend the base device tree.
>>
>> This is used e.g. for drivers that need device tree nodes for optional
>> non plug and play devices, like an external DSI touchscreen panel that
>> embeds different i2c devices to control it.
> 
> You can already set DTC_FLAGS per directory (and target?), so enable it
> for the dtbs that have overlays.

Looks like this patch series from Aurelien should take care of that:

https://lore.kernel.org/linux-arm-kernel/20220427233607.1225419-1-
aurelien@aurel32.net/
-- 
Florian
