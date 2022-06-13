Return-Path: <SRS0=r9yq=WU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E4DC433EF
	for <soc@archiver.kernel.org>; Mon, 13 Jun 2022 17:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07B59C341C0; Mon, 13 Jun 2022 17:13:59 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D535C34114;
	Mon, 13 Jun 2022 17:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D535C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id gd1so6219922pjb.2;
        Mon, 13 Jun 2022 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vP2a/CCt7HshyUEbxtRkeXFVL2WuGiSYuvG6ycnh8y0=;
        b=QRxXmPyawmBy6y60a7KFnp7fUMASsoifDYKT+iEalt/zagbPhOnXVQEdBVe/Y3HHvO
         3VSogICEYC0XQaPBGttJ/Bop/xgzQlgJi0PBRXiiipHIqSRg53Q7sFzevYSnghNP1hFf
         B1HigkU/gNNt2M2B07iHIZaxcFTdj8lsgDppo3IMMk3MfudL70d5ms8/xEryb76aCYn8
         HGWckQmrIEE67rCVLdjgRTGaWGdkBPuSJAfdQMQ1DD3xvYwEEe150f/69w7TfdSWLbeF
         mj8QJDMYf/rcXX1ORbJ/lycjJCwwXWKfOjU4yfv2U4l9b6q6T6KaGGh/IsQkfhpEzL+d
         m9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vP2a/CCt7HshyUEbxtRkeXFVL2WuGiSYuvG6ycnh8y0=;
        b=drziUR7izJvzDTipOD2VppvGmdMp82QxCPw5POG0f17VXTTzuBpr9aMxZYZQxIIqA5
         dqpAVZL2U9Oevl512rPGVMGvhFz+biNOWCodEJyugGofECVIY6nDyTgMrnCqqdLp1ZJq
         ZWX2FNID3UtstQHALHjcDJOe0QviB+AD78vjglbaG2lziWE8aOq3dxJRMPVgo3DvIpL5
         cRctfivrCL9PoLFSpz7Gy/cycSvBljXiRyEyV16VqJZMnYHQyQrbjJYq1eSkkGHeYhD6
         MuvVF0shoFEafVXuvqzIK+dNQj5EKBaoPgnr04ezC2/G0MrCsdLtjSw/eeP0oOY1G/2t
         0qUw==
X-Gm-Message-State: AJIora8qESY0SqHPYIsnaSMcW0Gaxn2O5v+yJiJw9LlaQ/2IJ4/WSGBu
	AMSPa1TDviIYnPqw8KBiwMI=
X-Google-Smtp-Source: AGRyM1vMykkDHn0jeBqj2shRkDwy+j687E8Th6EKkaFkwCaU9m48ptBa2fy8+SgYlMK9fIXkrM7OMw==
X-Received: by 2002:a17:903:11c6:b0:167:90e5:59ac with SMTP id q6-20020a17090311c600b0016790e559acmr596604plh.143.1655140437815;
        Mon, 13 Jun 2022 10:13:57 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d20-20020a170902f15400b0015e8d4eb285sm5367110plb.207.2022.06.13.10.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 10:13:57 -0700 (PDT)
Message-ID: <5b677140-c395-f59c-e8e4-6f50cea2a529@gmail.com>
Date: Mon, 13 Jun 2022 10:13:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] ARM: dts: add dts files for bcmbca SoC bcm6855
Content-Language: en-US
To: William Zhang <william.zhang@broadcom.com>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
Cc: tomer.yacoby@broadcom.com, anand.gore@broadcom.com,
 dan.beygelman@broadcom.com, kursad.oney@broadcom.com,
 philippe.reynes@softathome.com, joel.peshkin@broadcom.com,
 f.fainelli@gmail.com,
 Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 samyon.furman@broadcom.com, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org
References: <20220607172646.32369-1-william.zhang@broadcom.com>
 <20220607172646.32369-3-william.zhang@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220607172646.32369-3-william.zhang@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/22 10:26, William Zhang wrote:
> Add dts for ARMv7 based broadband SoC BCM6855. bcm6855.dtsi is the SoC
> description dts header and bcm96855.dts is a simple dts file for
> Broadcom BCM96855 Reference board that only enable the UART port.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, 
thanks!
-- 
Florian
