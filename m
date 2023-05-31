Return-Path: <SRS0=nJLM=BU=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98076C77B73
	for <soc@archiver.kernel.org>; Wed, 31 May 2023 06:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6936EC4339C; Wed, 31 May 2023 06:51:32 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBF67C433EF
	for <soc@kernel.org>; Wed, 31 May 2023 06:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBF67C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5147e40bbbbso7843134a12.3
        for <soc@kernel.org>; Tue, 30 May 2023 23:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685515889; x=1688107889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j8KIRkSeQpAAw2eR4yzI5lu3pYKOIqBElBCoG4tj2Oo=;
        b=QffMaphaCoZ9MsLlJH4EYBJfwdueijKDixcU+L4mAd16ePYDj0K5aB4E+PgA/s9Mzp
         lSJonPXOH8QCQHTTrHZbytT3t9Wv2XsAxdhFQKkRzLZhe/KB4KfwBzClynOcLPSdo2c1
         Y1hjwnCON7+/bNk7ME5Q8Ka+n7IUT+ARV8MrH8g6JZHFIZCnZ7+/mCu5x48ohbyQ+JuE
         DEgb2uuU/K2Z/mUFiz/ghvaTG8DwZMv5cvaQST7IyYMCFH+uPErFkZmxUddEeuJGmq4M
         SyTKhva1ZjnWqm62IlQeTaV5tj1Vo+NQ+/OZayWr4yGZQNEBo0sNhAooxpFfX9peBgX0
         5vWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685515889; x=1688107889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8KIRkSeQpAAw2eR4yzI5lu3pYKOIqBElBCoG4tj2Oo=;
        b=VOk5NEi+Sj53v28yJ6MgJIm5o8VNjzR/cylgD/H7P5IqhqsvKIv0HqrkK9smk4+NmN
         kCrAqlmufqWIz3E4xs+3helH63/aZ/hfJmuGFRq2fU539SDYVvZaRzl6BFFqjjcwORhe
         rdERCBgdkcqQAkG2Oquqp8+Xu0GUkNDSyUZsPFUqjEP6uX/dcTOroAXZyE/m51WJ/9NS
         cD6RKBSb1DXsOTjCGXa2kY6K4ckRU8ScXm0rBZIDFWkCm2J7J6PLUsNNffOCCicUWUn4
         qEh17Y2ld2tAMYz663jx7kODLzw/4yu7X7UTkC7rQduZTWMwgn8dccRXtZuUM1SUDrjx
         JEEg==
X-Gm-Message-State: AC+VfDxLfjfHtDDo/gWIBtxaMNKDVJjMC/XMt7zxrnHjrTf9c8R3MPVK
	QlnjwQ06POLhTpuzROy2kGu3lg==
X-Google-Smtp-Source: ACHHUZ41+Df1JF3rXv8WCdc5cE6mupu5PE4dFHFEEKvM7CJGANm6pLKrWAUKpgejEfJB4tpS9+W3aQ==
X-Received: by 2002:a17:907:7291:b0:96f:4ee4:10d4 with SMTP id dt17-20020a170907729100b0096f4ee410d4mr4511643ejc.43.1685515888922;
        Tue, 30 May 2023 23:51:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id d12-20020a17090648cc00b00965e9a23f2bsm8410703ejt.134.2023.05.30.23.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 23:51:28 -0700 (PDT)
Message-ID: <ed4c3564-4083-5568-f999-cfd7f02544a7@linaro.org>
Date: Wed, 31 May 2023 08:51:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] Documentation/process: add soc maintainer handbook
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, soc@kernel.org
Cc: conor@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, olof@lixom.net, palmer@dabbelt.com,
 robh+dt@kernel.org, arnd@arndb.de
References: <20230530-multiple-whooping-ee5706fceb67@wendy>
 <ZHbpb98Yn7SDZ4XZ@debian.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZHbpb98Yn7SDZ4XZ@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/05/2023 08:30, Bagas Sanjaya wrote:
>> +appropriate time later.  Most importantly, any incompatible changes should be
>> +clearly pointed out in the patch description and pull request, along with the
>> +expected impact on existing users, such as bootloaders or other operating
>> +systems.
>> +
>> +Driver Branch Dependencies
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +A common problem is synchronizing changes between device drivers and devicetree
>> +files, even if a change is compatible in both directions, this may require
>> +coordinating how the changes get merged through different maintainer trees.
>> +
>> +Usually the branch that includes a driver change will also include the
>> +corresponding change to the devicetree binding description, to ensure they are
>> +in fact compatible.  This means that the devicetree branch can end up causing
>> +warnings in the "make dtbs_check" step.  If a devicetree change depends on
>> +missing additions to a header file in include/dt-bindings/, it will fail the
>> +"make dtbs" step and not get merged.
> 
> Sounds like passing `make dtbs` is a merging requirement.

And why shouldn't be?

Best regards,
Krzysztof

