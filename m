Return-Path: <SRS0=D9n6=MD=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D9CC4345F
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 21:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 271CAC4AF52; Tue, 30 Apr 2024 21:49:15 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D199C2BBFC;
	Tue, 30 Apr 2024 21:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D199C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ee12766586so229416b3a.0;
        Tue, 30 Apr 2024 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714513752; x=1715118552; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQ81DFkgmFb2qWSA0tT95p3yazTu3GOFFQ2uKG4zcqU=;
        b=lkPHYM/EtHFSaHER5F7xJN0P2JW+ONthLPkRFZ5hucEdQFJzq1txgFGxVnzH3t7Mqg
         bk73+y6hTcApPU/jUx8bflXdAeAexgjSoWkJtvoroIkLnxk5eYeHkJ6mzn0xqZaYPZec
         ldn88cz46T4S3ZtUCIuairbSLai87jLSb1+Vy21cFuS8TmUXljvkMxIK20Y9S0jl0JdM
         gDhs0/7OLBFM+tn90kmxfgh2U7DdlUIOY58rbgw+7QvqtqWJgpEyjOj4iQZ2dvewpO2q
         bQShqEXwe3e8dnfJGmZUHf4N5MjRRHLwOv1cpn9Put1q/lGciXNiCTAV34+PhiDwGdy6
         h+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714513752; x=1715118552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQ81DFkgmFb2qWSA0tT95p3yazTu3GOFFQ2uKG4zcqU=;
        b=MBwTeAeWA5ZIuEjuq0PXSHwc1GiwHHSO40BWR4+0yzMK9laYqZ6p2XlCODbpZrF0LL
         ItIqLEHqoafC6aMalE/crWNDHuEp0LE9C4L9gkQ3xo9evYB80nz9ZZnVv3XxYp03I5Wa
         zjiMKorvszrE3zs+zTq+TIXREg9vNHGOkMKCa549VGWFmzM4B1+q8BckzvW4XbTADJmk
         JsJ8ghVU2OHaemeZ4TQw7ABcFua4MiesfuOvMONTIKBrJ2YlQFOk3n2kBOF+g7J7f1/8
         WNZVc4Q3fcmNz6DJD7sg3ahItS/LKYN88aOnimJ/2PvX1VZcc2EnWkdoTfo2y/FuaFwN
         DKWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK30mvywulfHseajQmDOZ2H6AC0RP0Zm2b6sdLLtfXKJBJV03gZlHU49WWLeDUqnJdL+ZOBBWXP+NY9o2FPcP6o4ktDVaWfC/vYlvMrgPxTU0sKeCKKGwwsmdwNEfqAZPNl++75rPXrbJ4qNlvJzfOLnBIYZQSzp5Tww==
X-Gm-Message-State: AOJu0Yyz4uyQ9a+ZVBL2dqG0OaHKH3hWOJaWnzVfuuNoPAzsHfZDzGp+
	iQiU0pVk/FqEKVTymz31GoK4NTFl6vU97OlYqcYJndTalngwZvUJdRjL/w==
X-Google-Smtp-Source: AGHT+IHQGDfoheQSbpzkVLH56jhhZSeorElzvZNIjh/7FJfIYfrT1165Kn1yMHGcREJjEIUoAW8BJA==
X-Received: by 2002:a05:6a00:10c6:b0:6ea:f43b:b961 with SMTP id d6-20020a056a0010c600b006eaf43bb961mr5803046pfu.6.1714513752457;
        Tue, 30 Apr 2024 14:49:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id y5-20020a63fa05000000b005cf450e91d2sm21394224pgh.52.2024.04.30.14.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 14:49:11 -0700 (PDT)
Message-ID: <7d412e48-a58b-479d-9333-066359d52432@gmail.com>
Date: Tue, 30 Apr 2024 14:49:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: Add/fix /memory node unit-addresses
List-Id: <soc.lore.kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>, soc@kernel.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Robert Richter <rric@kernel.org>,
 Chanho Min <chanho.min@lge.com>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20240430191856.874600-2-robh@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240430191856.874600-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/24 12:18, Rob Herring (Arm) wrote:
> '/memory' nodes always have a 'reg' property, and therefore should have
> a unit-address with just plain hex (i.e. no commas). Fix all the arm64
> '/memory' nodes.
> 
> It's possible that some bootloader depends on /memory (arm32 ATAG to DT
> code does for example). If so, the memory node should be commented with
> that requirement.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> SoC maintainers, please take this directly.
> 
> arm32 is much worse, but the platforms using ATAG to DT code can't be
> changed and I don't know which ones those are.
> 
>   arch/arm64/boot/dts/actions/s700-cubieboard7.dts       | 2 +-
>   arch/arm64/boot/dts/apm/apm-merlin.dts                 | 2 +-
>   arch/arm64/boot/dts/apm/apm-mustang.dts                | 2 +-
>   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts    | 2 +-
>   arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts    | 2 +-

For the above two:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

