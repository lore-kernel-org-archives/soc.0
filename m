Return-Path: <SRS0=zQgr=SL=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F4FC433FE
	for <soc@archiver.kernel.org>; Thu, 27 Jan 2022 09:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61EFAC340EA; Thu, 27 Jan 2022 09:33:15 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42BC3C340E4
	for <soc@kernel.org>; Thu, 27 Jan 2022 09:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42BC3C340E4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 89ADE3F1C6
	for <soc@kernel.org>; Thu, 27 Jan 2022 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1643275992;
	bh=p+i9EFnJNrdVtc4uBwrKoxlD6kOk5KMf1UoN4cwo1S0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=CSuujtj5l4ciHkZDMqCmofg3vFvh7u4GaJH5RDjW9l+qdz9JqH6ENn2vWWhh8jJyS
	 rEnWOtc3w6pxH0TpihmbHxdFE2CBLJLPaK476sGpUk43tDdST7UtZ1dgN5KJO9uXAj
	 fLOrXqtsXXVogJlNYKeRUsWZCA7IRuHS0J8Dcd0O0yESlNR9d3Io/EjPQxLZxrbbB2
	 gauY45QlLvA7OTdyqRtPPiIasxbRpqQ1G+XgS8mZ/qLDgAVTxYE1EfL4k5HCVdx3e0
	 ofvq3Yfz2s9dJUAwLqr9IDNiVqKdluJKPEqLeTAjneQvg1TWiwEii4atPbJpSz2EAp
	 yyTG/MjSh/NQw==
Received: by mail-wr1-f69.google.com with SMTP id c9-20020adfa709000000b001dde29c3202so821649wrd.22
        for <soc@kernel.org>; Thu, 27 Jan 2022 01:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p+i9EFnJNrdVtc4uBwrKoxlD6kOk5KMf1UoN4cwo1S0=;
        b=preVtCKtyGGmx2HFvjZmWzq2G1OP8HX6+1At822KCRFtwCueSAPFgguIDJjiqqmxYV
         dlzPOFAZ/6JCtJ4UbnPOtzZ16WqWoUi4s+qG8pdmauPvQ5wYQshdb6DeiZDCKA/EmXnO
         sFTY9utqcjrjzecsKHXz4KnOZuLAhqdJhjWIfCMOk/ROWzaiQe2dbAl1f7UO0Ocie1Qy
         0hinOm1qNA56qW2hgAF+Or83lc9rD11A9rHP0HoLSHaZLogfEbCcVG/lCK5mM2mUfNt/
         JcfGpx0JFMRgcQGNLWrRKJqNXJEd5gvebcGtoiGZ7x/QrFG0SRqeNGmO28x0NpVUQ1NP
         m/9w==
X-Gm-Message-State: AOAM531jAZgVVPAFiI21sxJsSWxSKVdvSAE4D0wz0MG+FO6/FgwgdjCH
	vTYyNufI3lP+al9Uu5BSk6iNbIYOp0KHQwsertWvy1jG2fVie5FfwXKtU5rN9UVQNzcT1PVuWw9
	eyqznEYt2Be5eENGSx51ibn0=
X-Received: by 2002:a05:600c:4c95:: with SMTP id g21mr10950994wmp.109.1643275992103;
        Thu, 27 Jan 2022 01:33:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylkC1THY/nwhhXFgrVxt7l8XIbuf9Roo2kAya94TjPY/GyRJpntPDuMR7MZ7Sr8GNGxVlciw==
X-Received: by 2002:a05:600c:4c95:: with SMTP id g21mr10950974wmp.109.1643275991855;
        Thu, 27 Jan 2022 01:33:11 -0800 (PST)
Received: from [192.168.0.63] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id r16sm1599447wmq.3.2022.01.27.01.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 01:33:11 -0800 (PST)
Message-ID: <1812c271-0a6f-2ebf-e329-4d3c0e34024c@canonical.com>
Date: Thu, 27 Jan 2022 10:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL 1/2] memory: drivers for v5.17
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20211224111124.6097-1-krzysztof.kozlowski@canonical.com>
 <724c16d2-5afc-4d41-8d84-3ba570d14cee@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <724c16d2-5afc-4d41-8d84-3ba570d14cee@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2022 13:00, Krzysztof Kozlowski wrote:
> On 24/12/2021 12:11, Krzysztof Kozlowski wrote:
>> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
>>
>>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.17
>>
>> for you to fetch changes up to de369801658a9a54759ac011af770e8c01d9db7f:
>>
>>   Merge branch 'for-v5.17/tegra-mc' into mem-ctrl-next (2021-12-22 12:59:03 +0100)
>>
>> ----------------------------------------------------------------
>> Memory controller drivers for v5.17
>>
>> 1. Minor improvements: Mediatek SMI, Freescale/NXP IFC, Tegra20 and
>>    Tegra30.
>> 2. Convert Freescale/NXP IFC bindings to dtschema.
>>
>> ----------------------------------------------------------------
>> AngeloGioacchino Del Regno (1):
>>       memory: mtk-smi: Use ARRAY_SIZE to define MTK_SMI_CLK_NR_MAX
>>
>> Dmitry Osipenko (2):
>>       memory: tegra30-emc: Print additional memory info
>>       memory: tegra20-emc: Correct memory device mask
>>
>> Jason Wang (1):
>>       memory: brcmstb_dpfe: fix typo in a comment
>>
>> Krzysztof Kozlowski (1):
>>       Merge branch 'for-v5.17/tegra-mc' into mem-ctrl-next
>>
>> Li Yang (2):
>>       dt-bindings: memory: fsl: convert ifc binding to yaml schema
>>       memory: fsl_ifc: populate child devices without relying on simple-bus
>>
>> Rikard Falkeborn (1):
>>       memory: tegra: Constify struct thermal_cooling_device_ops
>>
> 
> Arnd, Olof,
> 
> I think this one was not pulled by you. Any chances of sending this to
> Linus past 5.17-rc1? If not, could you pull it as v5.18 material?

I'll send all this as v5.18 material, so this pull-req can be skipped.


Best regards,
Krzysztof
