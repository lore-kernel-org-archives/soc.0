Return-Path: <SRS0=nHWs=LU=linaro.org=konrad.dybcio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F70DC4345F
	for <soc@archiver.kernel.org>; Mon, 15 Apr 2024 20:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9739C4AF0C; Mon, 15 Apr 2024 20:00:19 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86071C4AF07
	for <soc@kernel.org>; Mon, 15 Apr 2024 20:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86071C4AF07
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d0162fa1so4540520e87.3
        for <soc@kernel.org>; Mon, 15 Apr 2024 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713211216; x=1713816016; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iu4TsmsR0yr+hZlSUf3nbeWPU6VyzUbHeXgBs5JQM8I=;
        b=fO3JaSCEZyeRmisHX8majijM+BWd/6/Zi/NUFd9BX0KnRu9OFaDUu6B5sSOHWuRrTe
         3zjDomnQWsjHMWfY7SIIZbkEKi0dFSZQuBmbZIDBnFW3S9gGuCGa7XgibXNPQidmVirp
         O1O5h9ZVfWPwdsVKrIPITUYadK3d9KMFnkn53724lACZLdbDQ3wgMaA7jzvM0lqy/YXd
         RXtKm7qU9E/eAeXQQTq70xa2pFvm2vcYAeOIy5B3071mip/I7XsPqGuEVUHtaYjetYK2
         JhuEN8E8sr/NbrBZvPb80zZdcI3ENhyPA0zoFUWRXZxcBQa3VzQX/M6CtJU6DXZmGADp
         zdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713211216; x=1713816016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iu4TsmsR0yr+hZlSUf3nbeWPU6VyzUbHeXgBs5JQM8I=;
        b=Zg5DZ3wn3rKs3E+d7SI+Ik1QNfYzPH8nEcVxC0Wd00+yJse6oR89bkR4xJ8jHw/JC0
         cVj30kS7pwQnUlPLA+yEJMiy10dRvIqY0Zvz0Bu037ojJJiF69k0ZN7aNIIvdmpbCo2u
         TnmBr394prXS1Rekj96TMezTybIHVrki8uM+P0I/1awRv9Hy087Fa4Txpv8CVHkQjj0R
         ydjDpBk0JJPz8BuzKcK3tFqr1QnQnVUwNI4a5tYG0CjEAuOy+B9ARiwvnnaPap/7+M08
         U/TWDaxrsS+f3ytefyE3D8OMNGpXe2vIv2jfcvuhBXtBkl4H8KVbCt0nHt9f2yXF0vZr
         ZWCg==
X-Forwarded-Encrypted: i=1; AJvYcCW/2eASylhPmJFQXqNYm96wNuSQIHyuU1h1zFNRsM9bfkbkcJ5b9ZeJ453qgrMjq/CysYQNJl3HR921iafikQ==
X-Gm-Message-State: AOJu0YyGlyED4DTAK3EUTY/S2StopO6daBpmYGIDGjY0h0SMzDCTObnJ
	m0j39gcFbyNz+EOOnh736lVg2sBQwT6DmnWiW4G+/5UAYZdyD7Is+C9ljYFa424=
X-Google-Smtp-Source: AGHT+IEg2HPeaum23ALkOp0qFvulXUMO+CauhwOhhqKEHowUZVDqwmA6Yvnmjzgd6CxVDLPgd6HQRg==
X-Received: by 2002:a19:7409:0:b0:519:3ce:a12b with SMTP id v9-20020a197409000000b0051903cea12bmr1612742lfe.23.1713211215573;
        Mon, 15 Apr 2024 13:00:15 -0700 (PDT)
Received: from [172.30.205.18] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id g33-20020a0565123ba100b00518b0fdbf60sm706180lfv.258.2024.04.15.13.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 13:00:14 -0700 (PDT)
Message-ID: <b1462fb5-df86-45d9-9f67-697321e2b7dc@linaro.org>
Date: Mon, 15 Apr 2024 22:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 Antoine Tenart <atenart@kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Robert Richter <rric@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "Paul J. Murphy"
 <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-fsd@tesla.com, Michal Simek <michal.simek@amd.com>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-realtek-soc@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20240412222857.3873079-1-robh@kernel.org>
 <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
 <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com>
 <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
 <CAA8EJporYZBfDoN6m0Wu2wGqq=Y+TskNCguMOHtDAz05eXS6LA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJporYZBfDoN6m0Wu2wGqq=Y+TskNCguMOHtDAz05eXS6LA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/15/24 19:41, Dmitry Baryshkov wrote:
> On Mon, 15 Apr 2024 at 20:15, Rob Herring <robh@kernel.org> wrote:
>>
>> On Mon, Apr 15, 2024 at 12:05 PM Rob Herring <robh@kernel.org> wrote:
>>>
>>> On Mon, Apr 15, 2024 at 11:52 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>>>>>
>>>>> On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
>>>>> [..]
>>>>>>   arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
>>>>>>   arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
>>>>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
>>>>>>   arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
>>>>>
>>>>> Acked-by: Bjorn Andersson <andersson@kernel.org>
>>>>
>>>> Note, we'd need to override PMU compatibles in sdm636.dtsi and
>>>> sdm660.dtsi. Ideally it should come as the same patch.
>>>
>>> Uh, that's an A for reuse, but an F for readability... It's sdm632 as
>>> well. Will drop sdm630.
>>
>> Actually, aren't those Kryo cores just Cortex-A53 derivatives? So the
>> A53 PMU compatible is an improvement over the generic one still. We
>> can't just add kryo260-pmu compatibles because that breaks
>> compatibility. We could have a fallback, but then that introduces a
>> pattern we don't want.
> 
> I think it is believed that Gold cores are A73-derivatives.

8xA53 on 630
4xA53+4xA73 on 636/660

Konrad
