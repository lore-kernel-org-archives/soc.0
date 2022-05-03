Return-Path: <SRS0=Fita=VL=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B80EC433F5
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 11:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B2B1C385B1; Tue,  3 May 2022 11:37:21 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10289C385A4
	for <soc@kernel.org>; Tue,  3 May 2022 11:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10289C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id k23so32896225ejd.3
        for <soc@kernel.org>; Tue, 03 May 2022 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=X1FUNuB7P3eW2ayDNUqILdNTj2LgjfmvS/GJDjAZwJ8=;
        b=m1lsa/lUBG13ARmSDKBacb1BxkHOLDYVNgdzx87jaByNzrYBqQjteQH9jkfbbdF0QO
         gVBjSQDRDw79CP7VbvuDmFkUQHW5Y/2HQOpqKUZd50/mRQE0HrMFgj8B66PmfYRy61kb
         8mQDe2M8M3SeuqAHv+CkuKeCTRxKJ8py6uI2LM1l0QxqNtLGG3TQ/E1drhj9elaMYM+Z
         xFA/t/PW27qFlRei0Or6PigQwyezhQQlkaMdEd86vK4ijPxTDPA3k4qBDuVAyd7WmywV
         UJb9Ji7I8Ftv+i2NiOVJKZ3oCXUG0kPPc9hYXimNdHyqsP34bD3r76D1aIy486doAtNa
         cl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=X1FUNuB7P3eW2ayDNUqILdNTj2LgjfmvS/GJDjAZwJ8=;
        b=cI1neb+ZFuRvpUvBg71yvCkiwquzmJvyHAenzTWqfeE9O2Z0b6GhW1CE3nAKOq0h5h
         viOmC/vq6D6vQIXyMkVAUiNO07j7zPIFLmn//wLAQ4SbaRgyIE1+7FGtCpbON4tqGGON
         neKn4auuPrP3msloWwoAvGh0QkYmM/GrFtfrsCwnB2gGXiAGRROghV6amKDBFrH/lVwO
         so9WYVqY2yP8sF9wkGv8fl57b16DNBW22YbCKJ5bInWsrecyqWbZGk4mU2K3eD0eRKzb
         9NU8N7K2A8yS82yn1PUHXGFAduJD1OA9kw3DRj8AUkhxmGMxU8Foad1uB+ZY4KKYFL/r
         WzXw==
X-Gm-Message-State: AOAM5331xz4jwNAKo3Kf2MuINgxTdS2BvyA/7KdT6/HW2A7YCUWnDVTA
	txNoI0eLQEH5wrqQZiB+HuYxvw==
X-Google-Smtp-Source: ABdhPJzQ+6Vtojorbgz03fnGzcETCdUI4hWoJhuVofseBZB8aIdh7DtxCNdBnYFVXj5i+orsRW9lFg==
X-Received: by 2002:a17:907:1c9c:b0:6f4:2918:5672 with SMTP id nb28-20020a1709071c9c00b006f429185672mr12582950ejc.439.1651577838380;
        Tue, 03 May 2022 04:37:18 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l24-20020a056402029800b0042617ba63a7sm7841464edv.49.2022.05.03.04.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 04:37:17 -0700 (PDT)
Message-ID: <b7bf8ab3-9680-6318-a575-bb1dfaeef405@linaro.org>
Date: Tue, 3 May 2022 13:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v2 0/2] Hi3521a support.
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: "Marty E. Plummer" <hanetzer@startmail.com>, arnd@arndb.de,
 cai.huoqing@linux.dev, christian.koenig@amd.com, devicetree@vger.kernel.org,
 gengdongjiu@huawei.com, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux@armlinux.org.uk, michael@walle.cc, miquel.raynal@bootlin.com,
 mturquette@baylibre.com, novikov@ispras.ru, olof@lixom.net, p.yadav@ti.com,
 rdunlap@infradead.org, richard@nod.at, robh+dt@kernel.org, sboyd@kernel.org,
 soc@kernel.org, sumit.semwal@linaro.org, tudor.ambarus@microchip.com,
 vigneshr@ti.com, xuwei5@hisilicon.com
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220501173423.2473093-1-hanetzer@startmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2022 19:34, Marty E. Plummer wrote:
> Resend RFC.
> 
> Changes in v2:
> - Actually include the dts files.
> - DT Bindings still missing, as the the driver is not quite complete
>   (need to add the reset controller bindings, have't quite figured that
>   out yet.)
> 
> Marty E. Plummer (2):
>   clk: hisilicon: add CRG driver Hi3521a SoC
>   arm: hisi: enable Hi3521a soc

Still no bindings for boards/SoC.



Best regards,
Krzysztof
