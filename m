Return-Path: <SRS0=mZ0q=IH=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B80EC433DB
	for <soc@archiver.kernel.org>; Tue,  9 Mar 2021 09:29:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C044665266; Tue,  9 Mar 2021 09:29:04 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 674AB65248
	for <soc@kernel.org>; Tue,  9 Mar 2021 09:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 674AB65248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJYfm-0005rQ-Eu
	for soc@kernel.org; Tue, 09 Mar 2021 09:29:02 +0000
Received: by mail-wr1-f71.google.com with SMTP id x9so6104186wro.9
        for <soc@kernel.org>; Tue, 09 Mar 2021 01:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y+DJYItk5T3eq0Zhm1ybWYn6qoUDmEqSxzTazQTJ2WI=;
        b=VRhTJtu7NZuJR8RBydaFK/ghUi3SjtUi2pZH9gFJUF1QLm2+f5n6CKDxavDSaVsVRr
         OJD2CPKpDi8WFoRPFr1gsah9Y87GBFCWkXZDNqFDNGCbERJarj6BkDpShkrQBcgHUt23
         C1hhN0v9w50ixZ2eOpEIT638JXyZKzhIWxww958fhoBgSvk2kuSE7vhVSznl/+XBK2ZG
         3NuTyyE3XOQ5Wn1uShHILO8fcxlUX3FT8+1ELc/JPVmVUWX+oRFHyISPvEDkvHevwTj2
         VTSh0aI+wcRSFzirkfj3tyHGGkNLoT1jb+cNrR9BbRyYVjCWb7wzfkMN79w65xDuz0ke
         Ubjw==
X-Gm-Message-State: AOAM530/9ElEJK3RY/iwLmEbyUx3GDOT6o/GK+FQ3kAq21tS6mczRu3s
	aVVh61MZLA0GMdjYX8zm58wtTJ7kyQEQ5QT3e6cQ3aPvo+kQDjBiYsZdcVScRLO4FubjYZs7/Wp
	klUkFXQqKFpbtBwDkOz5knYA=
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr2883344wmc.35.1615282142245;
        Tue, 09 Mar 2021 01:29:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDwieLYn65IgohT+IWkBV46K/G4fBAkiPaWogqYazvknK77lVtKE1MtKYWFR3j0TqjOVKdbw==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr2883318wmc.35.1615282142034;
        Tue, 09 Mar 2021 01:29:02 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id p14sm2967489wmc.30.2021.03.09.01.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 01:29:01 -0800 (PST)
Subject: Re: [PATCH v2] arm64: defconfig: enable Intel's eASIC N5X SoCFPGA and
 Keem Bay SoC
List-Id: <soc.lore.kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm@kernel.org, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
References: <20210308174824.278372-1-krzysztof.kozlowski@canonical.com>
 <776e0c26-4f05-2a3c-1536-f730b9109b1b@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7462eeec-5c4e-b4d5-cf94-9945042fc1d1@canonical.com>
Date: Tue, 9 Mar 2021 10:29:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <776e0c26-4f05-2a3c-1536-f730b9109b1b@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/03/2021 20:07, Dinh Nguyen wrote:
> Hi Krzysztof,
> 
> On 3/8/21 11:48 AM, Krzysztof Kozlowski wrote:
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> Enable in defconfig two Intel ARM64 architectures: the eASIC N5X SoCFPGA
>> and Keem Bay SoC.  This allows compile coverage when building default
>> config.
>>
>> For the N5X (and Agilex) enable also DesignWare SPI controller in MMIO.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> ---
>>
>> Hi Arnd,
>>
>> You asked me to check if all drivers are enabled for these platforms.
>> In general the answer is yes. In particular:
>> 1. Keem Bay is does not have much in upstream, but everything described
>>     in DTS is there,
>> 2. N5X shares a lot with Agilex SoCFPGA which already (mostly) is
>>     supported.
>>
>> Changes since v1:
>> 1. Enable also SPI_DW_MMIO
>> ---
>>   arch/arm64/configs/defconfig | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index d612f633b771..9f9adcb8b0e9 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -29,6 +29,7 @@ CONFIG_KALLSYMS_ALL=y
>>   CONFIG_PROFILING=y
>>   CONFIG_ARCH_ACTIONS=y
>>   CONFIG_ARCH_AGILEX=y
>> +CONFIG_ARCH_N5X=y
> 
> I just submitted a patch for this as well. From the looks of the 
> defconfig file, it looks like the platforms are in alphabetical order, 
> but then I see that ARCH_SUNXI is not in it's correct spot if there is a 
> rule for keeping things in alphabetical order.
> 

The rule is that order comes from savedefconfig, not alphabetical. This
way you avoid reshuffling of symbols on any future savedefconfig.

Best regards,
Krzysztof
