Return-Path: <SRS0=Ao5Q=DF=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D803C001DE
	for <soc@archiver.kernel.org>; Wed, 19 Jul 2023 17:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1A65C433C8; Wed, 19 Jul 2023 17:56:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8FAF0C433CC
	for <soc@kernel.org>; Wed, 19 Jul 2023 17:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8FAF0C433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fbfcc6daa9so67003285e9.3
        for <soc@kernel.org>; Wed, 19 Jul 2023 10:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689789360; x=1692381360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+5oaw2J5+G3GYFPR3to60Ow5YDUAwCVY4MtrYxrWzo=;
        b=O5tdpOzllo11N68hbvqat1rL/4izSOZ0mS/2NFq3W6QpoHAAtnacEgIE/ney42oTv2
         baG9U7DhaLclF5umoDw473TrB85LBTE4niFhYh71kp24dX/IN8IpfpLtVSNPiSNmk0Dx
         ELKwjMmadFYml++d7mnvFvKSqrYKNyNROBtMVaoH+dgbYgQRa4NtT2p8yv3hAfaKipVP
         yy6b/5ssaNPZeA+Fct6luOsGclO3j1r2EQSsUwxf7NvfgxrmXZZxznrl1KpZMg4/Iu9x
         bA8Z4+a5tUdsu+6ZBbRGVBvC749z6UrX7ZbxxkgUHeCO5P4QVhijnULOlpui+1R/d/3A
         MUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689789360; x=1692381360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+5oaw2J5+G3GYFPR3to60Ow5YDUAwCVY4MtrYxrWzo=;
        b=Mn5GcRrM37r1mwAif8KbAJLLj/5vbhm0+ohaMjNSPAEgLXmlJZUeKyckKspzmdmwAE
         uaCwmm+ARuArbBFrLsncLRCRTjq0uyqD2qCyeU3G/AwonRSFOS16fjWtXejk5FFvOQla
         kRF0fzZWnwH6WBQdTvAysoBWPV1eHleJkRG3nGIjZn2HKTXMEZxIqz6X9WPPyxcwdiSV
         F3TspniWzMf6HPLyTmyIRGTMGerGOEuGcdoUvqjTTfsNdmwRf9w3hzigDme55hb4MhQq
         /ssQuEJ+YenqPe5Io37M24iW6pLEUzScyEwlRrIGEU48KpZb2E5cGzrO3i2viO7dvYr1
         cUGg==
X-Gm-Message-State: ABy/qLZFLBbWGgQ7+1sQLSPEy2K8OOJyTVV88nxL/t4Vrn8xkjiejhVR
	vXUwNCHgs1mbyrxf4s9pjHvVkQ==
X-Google-Smtp-Source: APBJJlGJWPVncsHecZCDgmX0fdTLwFLC8Wokgg9i2konxqVAbiNqQMmWxybL1xsSOpnBwDHWUMyY6A==
X-Received: by 2002:a05:600c:20f:b0:3fb:ab76:164b with SMTP id 15-20020a05600c020f00b003fbab76164bmr2552075wmi.13.1689789360496;
        Wed, 19 Jul 2023 10:56:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id y9-20020a7bcd89000000b003fbb1a9586esm2232470wmj.15.2023.07.19.10.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 10:56:00 -0700 (PDT)
Message-ID: <71f2c286-c205-13b8-885a-240eae4131e3@linaro.org>
Date: Wed, 19 Jul 2023 19:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] Documentation/process: maintainer-soc: add clean
 platforms profile
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, arm@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
 <20230719143309.204766-2-krzysztof.kozlowski@linaro.org>
 <CAL_JsqLXanpk+cMG0b8Ze9WAfmRqcu6-5EsdKVKG3TKCOwnm7A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqLXanpk+cMG0b8Ze9WAfmRqcu6-5EsdKVKG3TKCOwnm7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/07/2023 19:40, Rob Herring wrote:
> On Wed, Jul 19, 2023 at 8:33 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Some SoC platforms require that commits must not bring any new
>> dtbs_check warnings.  Maintainers of such platforms usually have some
>> automation set, so any new warning will be spotted sooner or later.
>> Worst case: they run the tests themselves.  Document requirements for
>> such platforms, so contributors can expect their patches being dropped
>> or ignored, if they bring new warnings for existing boards.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> ---
>>
>> Changes in v2:
>> 1. Add Rb tag.
>> 2. Implement Conor's feedback: change doc title, follow->should follow,
>>    minor style changes.
>> ---
>>  .../process/maintainer-handbooks.rst          |  1 +
>>  .../process/maintainer-soc-clean-dts.rst      | 23 +++++++++++++++++++
>>  MAINTAINERS                                   |  2 +-
>>  3 files changed, 25 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/process/maintainer-soc-clean-dts.rst
>>
>> diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
>> index 9992bfd7eaa3..976391cec528 100644
>> --- a/Documentation/process/maintainer-handbooks.rst
>> +++ b/Documentation/process/maintainer-handbooks.rst
>> @@ -17,5 +17,6 @@ Contents:
>>
>>     maintainer-netdev
>>     maintainer-soc
>> +   maintainer-soc-clean-dts
>>     maintainer-tip
>>     maintainer-kvm-x86
>> diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documentation/process/maintainer-soc-clean-dts.rst
>> new file mode 100644
>> index 000000000000..c460923f39be
>> --- /dev/null
>> +++ b/Documentation/process/maintainer-soc-clean-dts.rst
>> @@ -0,0 +1,23 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +==============================================
>> +SoC Platforms with DTS Compliance Requirements
>> +==============================================
>> +
>> +Overview
>> +--------
>> +
>> +SoC platforms or subarchitectures should follow all the rules from
>> +Documentation/process/maintainer-soc.rst.  However platforms referencing
>> +this document impose additional requirements listed below.
> 
> I would make it clear how platforms reference this doc:
> this document in MAINTAINERS impose...

Sure.

> 
>> +
>> +Strict DTS DT Schema Compliance
> 
> Schema and dtc
Ack

> 
> 
>> +-------------------------------
>> +
>> +No changes to the SoC platform Devicetree sources (DTS files) should introduce
>> +new ``make dtbs_check W=1`` warnings.  The platform maintainers have automation
>> +in place which should point out any new warnings.
> 
> If a soc.dtsi file has warnings a new board.dts will duplicate all
> those warnings. I imagine those are okay? 

This. I would assume that these were existing warnings, so new board
does not add anything new. Different question if new board comes with
the same warning for compatible in TXT (not DT schema).

> Or are we assuming soc.dtsi
> is warning free? Or do we need to distinguish both cases?

Warning free, or at least not many warnings, should be implied,
otherwise I don't think it is possible to spot new warnings.


> 
> I would like to see a build target for the warning free platforms, so
> we can easily run it and check for no warnings. Just hasn't been
> enough platforms yet to do that.
> 
Best regards,
Krzysztof

