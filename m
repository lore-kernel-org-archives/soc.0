Return-Path: <SRS0=5k/X=WY=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD96C43334
	for <soc@archiver.kernel.org>; Fri, 17 Jun 2022 09:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78BEDC3411C; Fri, 17 Jun 2022 09:05:22 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C71C2C3411B;
	Fri, 17 Jun 2022 09:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C71C2C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id a15so4923568wrh.2;
        Fri, 17 Jun 2022 02:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=o/0mDcIFSqHQ/My738bTZT2mjhpWfk/KnpoBd1WgU1c=;
        b=dAaofN78+s4gFUVaIZ/nesusmR50ONgOtZ4su/WxPvXUq1uGErzGDltaEY5sYNQNZu
         vPaQG7MRjYmBjy3fOYTGflgW+h0bY+eedmQIzG2X1B66UoKYNTj38VHXFXUzq2w3egYc
         vx2PMzcy5jiC1dsqLu0Gn3uB2j5roTyVGJT3pC/eKEPM/afaxzfuOYrMp6w6wyua9/fd
         9Nj8Vb2O/FHpsjuZ0UWGG4KmQqCDMqlcSRHQOtGRUy5aV7uvmVVflFUkInLcwFi/WGfi
         JrSsf22hoYStFwsEa4P4tzdLhDBbpQn9PLfaGHWr78OaHRbZvGFlV2/7N+VAuNBgzNzY
         SHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o/0mDcIFSqHQ/My738bTZT2mjhpWfk/KnpoBd1WgU1c=;
        b=rZeHNHMoN+qSDy2sLo3NzLNEwIO0wle6OZIALSoXRZjb4Y5lR8KCJjcNPLBc+bxdZ3
         eNchx+J5xzM5yBzCYLMa2dfxPR1Ol+Can2l5MMj88dG3yOBnd6RF1x9Ucbf8UQA8XHXg
         o2OgnaYyeZYyq461RFYzn35uQPRkSM2fe6QxqriWUTNFwkKm6jyWle+EaCjLvr+dHYDr
         XCQ1V+lKpz83xwodTaIuhizPTVThuFjz8KMe/xulceRdJgHYpL8ym+mOSq3Czch7n5H0
         NSQhST3wvnNRbB37+hbiQmF1smbm9Un4r/Jp5ZX0sk2I8j6FdicjznyFTtIDA8F51xu1
         yXrQ==
X-Gm-Message-State: AJIora8yrpHlndEXCVDuGyDd213PYx4r5jTuv0RWU9lspB7Bbhj3C6Tw
	GfdelW52/yhvQu0j1TiDDK0=
X-Google-Smtp-Source: AGRyM1vQCHbGNsNTZ28s2YR1fjPVRB8ztyhZ6H2QaXGbiVCH22jD5I467k/8uSrhKWH3FoPIeIx2hA==
X-Received: by 2002:a05:6000:2a9:b0:218:4bf5:a43 with SMTP id l9-20020a05600002a900b002184bf50a43mr8481741wry.154.1655456720070;
        Fri, 17 Jun 2022 02:05:20 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d614e000000b0020d09f0b766sm4004776wrt.71.2022.06.17.02.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 02:05:19 -0700 (PDT)
Message-ID: <0a01e2e2-b188-d670-7063-2e35fc3cc350@gmail.com>
Date: Fri, 17 Jun 2022 11:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: adjust whitespace around '='
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, arm@kernel.org
References: <20220526204402.832393-1-krzysztof.kozlowski@linaro.org>
 <1338cf79-d57d-d13b-896b-abc0c726a238@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1338cf79-d57d-d13b-896b-abc0c726a238@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2022 22:36, Krzysztof Kozlowski wrote:
> On 26/05/2022 13:44, Krzysztof Kozlowski wrote:
>> Fix whitespace coding style: use single space instead of tabs or
>> multiple spaces around '=' sign in property assignment.  No functional
>> changes (same DTB).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Output compared with dtx_diff and fdtdump.
> 
> Matthias,
> 
> Are you ok with the patches? Any comments?
> 

Both applied now.

Thanks!

> 
> Best regards,
> Krzysztof
