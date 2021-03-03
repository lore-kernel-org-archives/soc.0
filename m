Return-Path: <SRS0=2ol0=IB=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52563C433E0
	for <soc@archiver.kernel.org>; Wed,  3 Mar 2021 18:15:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1367064EF1; Wed,  3 Mar 2021 18:15:35 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9723F64EE4;
	Wed,  3 Mar 2021 18:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9723F64EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-ej1-f41.google.com with SMTP id ci14so25023924ejc.7;
        Wed, 03 Mar 2021 10:15:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L75O0W+60sA8PCw5vctCVfCnPFx9Df6RaLcl8AjpdUk=;
        b=PHnZB/2s4y5WXtCvYaFXXmfayH8cqcFCZY6L9eihCS5MhbkKf1tW/eq/SvNHHdGnoH
         wNCqPs+YfcSBTQhtbdgJeuz0IlFrQdVrjAD5ur404rE4y7phIZ4OiseqUirBjBRcJYyo
         Bn/rY29clQAak1E/TBEdGsIOZv4Z2JW/y5NZgLpdct9mTK+IPx6n11Yz0gMq1hRps4+L
         xIf4ns9FFzZMy4x4Ns0jTJwa/U4DI7fT0PVn2cXJQdnfA485JIe0NzaFKoTQOrFIjd3B
         gYxedcWJmCUE1S8TogDDCMF8IEF5Up4cjIsm0esFIxuK8CgZwsTEtMt9Q3bmYpTJiWUn
         es2g==
X-Gm-Message-State: AOAM5324y3uOasB8TtTKJUHUluR8KW4i38rplZyCIi4nGifN9MjfhbkI
	ADgmI1AKyJ1XoNmu7K2NADV+od4POA8=
X-Google-Smtp-Source: ABdhPJyv9ZHoKKrSfAYG3E0t2WiB0w2EQIFOB2iy2f5mHjXqT5rXzjkL15BWUuBoI/U9Tncs2D1Ixw==
X-Received: by 2002:a17:906:4c56:: with SMTP id d22mr110677ejw.426.1614795332589;
        Wed, 03 Mar 2021 10:15:32 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id t15sm19739654edc.34.2021.03.03.10.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 10:15:31 -0800 (PST)
Subject: Re: [PATCH 03/11] arm64: dts: intel: socfpga: override clocks by
 label
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
References: <20210210171823.333802-1-krzk@kernel.org>
 <20210210171823.333802-3-krzk@kernel.org>
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <e9a88bad-fb08-f028-bfe1-6d008dbfe1de@kernel.org>
Date: Wed, 3 Mar 2021 19:15:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210210171823.333802-3-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/02/2021 18:18, Krzysztof Kozlowski wrote:
> Using full paths to extend or override a device tree node is error
> prone.  If there was a typo error, a new node will be created instead of
> extending the existing node.  This will lead to run-time errors that
> could be hard to detect.
> 
> A mistyped label on the other hand, will cause a dtc compile error
> (during build time).
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts   | 12 ++++--------
>   .../boot/dts/intel/socfpga_agilex_socdk_nand.dts     | 12 ++++--------
>   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts      | 12 ++++--------
>   3 files changed, 12 insertions(+), 24 deletions(-)

Hi Arnd and Olof,

There was no response from Intel SoCFPGA maintainers for the DTS 
patches, so maybe you could take it directly? I can provide you pull 
request with these, if that's preferred. They apply cleanly.

You could also take the dt-bindings 2/11 or it could go via Rob.

About the defconfig patch (1/11) I will work on it more and resend it 
with your comments (you gave me review).

Best regards,
Krzysztof
