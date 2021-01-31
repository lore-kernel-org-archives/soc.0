Return-Path: <SRS0=275N=HC=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E96BC433DB
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 15:07:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7498664E04; Sun, 31 Jan 2021 15:07:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 099E364E1F;
	Sun, 31 Jan 2021 15:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 099E364E1F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-wm1-f51.google.com with SMTP id y187so11036159wmd.3;
        Sun, 31 Jan 2021 07:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vpo/YLEC9aCyTz6KjobMCzq+82sKuMKIXEWEt+YC14E=;
        b=OlJOa4jS477uJ7EGNMHHHo06AzD3gWf9Ggn7Yl+4kMCxOZ7sarG+gnPbqG65bMLpAy
         zrIecsk0tUiZrEkUOX33tjVsDNJFOE2RPNNe0lYaScEgAfTYu/X3H1eva4HZEVd2373c
         3crbm9ObgLuScp0cS2kd3jwhW5fWuqLtXITjCGrcTPHIIniDwiQcf8dRcsBtQbufrZsH
         EDjobqXEZ7SR44KDq4C0UdS7IPqWzqQm9e1zyy2Hh+nEmthY139EssNDTr3eP1+J4lMu
         kD+bg/qn7U2xEUARVLR61rT/P4S7tGL1hrRGDW1g27y96lfPfkzLWBszO7tt8pXN9GNr
         TN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vpo/YLEC9aCyTz6KjobMCzq+82sKuMKIXEWEt+YC14E=;
        b=SqEffqYxwrl8iB4sTcUJGptzSeKT403xAMiDMqns/dNlva6H3ZClgvrtHji154AYrO
         1594vwvIv0Z0a9MHCzXBYuael+l5B6bR9ox0SUsAfMez1Sk54w/WNpOExm5jLZ8DQkFy
         uqpk1xxrUPEyhvEVfnkR9gSBWEXJQ+JLXLQ2immIq5ANS8/Wi6W5dqvrQsSZz3FenO/2
         5I7bs3Q6AdCmyzfXdXU8MQW+8EDzihWAJd+5ux3GYKtEsOjvNx8LJD2vU6BSPB7wgDp6
         H0tVIhEqz1uDyNQjsp7wWYOtRectNTGrRJZp9SAEkayFoQdkDNzUKa9Ru3LSP6MoXRNE
         HQJA==
X-Gm-Message-State: AOAM531hv5ZtB4IydEk49yCnue6bVemYepEekuC25Py4NrOD311YsKlH
	+/GIyN1mAO4cXjKW1jRvnrp3gf1BrOFJqkj6
X-Google-Smtp-Source: ABdhPJyUzLGZ44ueTOjnLv5xrehDKINnxZ+xuSyonqd1VMxtcLkaGvmwKgpdsE5Q8iAy+4LLAe9/jw==
X-Received: by 2002:a05:600c:4f50:: with SMTP id m16mr11148122wmq.175.1612102048930;
        Sun, 31 Jan 2021 06:07:28 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id r16sm23529682wrx.36.2021.01.31.06.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 06:07:28 -0800 (PST)
Subject: Re: [PATCH v1 2/2] arm64: configs: Support DEVAPC on MediaTek
 platforms
List-Id: <soc.lore.kernel.org>
To: Neal Liu <neal.liu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 SoC Team <soc@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>,
 Hanks Chen <Hanks.Chen@mediatek.com>,
 Jackson-kt Chang <Jackson-kt.Chang@mediatek.com>, wsd_upstream@mediatek.com
References: <1608713092-26952-1-git-send-email-neal.liu@mediatek.com>
 <1608713092-26952-3-git-send-email-neal.liu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <68442164-d649-aee0-cfe8-c9ebb868612d@gmail.com>
Date: Sun, 31 Jan 2021 15:07:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1608713092-26952-3-git-send-email-neal.liu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 23/12/2020 09:44, Neal Liu wrote:
> Support DEVAPC on MediaTek platforms by enabling CONFIG_MTK_DEVAPC.
> 
> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> ---
>  arch/arm64/configs/defconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 17a2df6..a373776 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -257,6 +257,7 @@ CONFIG_MTD_NAND_MARVELL=y
>  CONFIG_MTD_NAND_FSL_IFC=y
>  CONFIG_MTD_NAND_QCOM=y
>  CONFIG_MTD_SPI_NOR=y
> +CONFIG_MTK_DEVAPC=m
>  CONFIG_SPI_CADENCE_QUADSPI=y
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_BLK_DEV_NBD=m
> 

From my understanding, defconfig is for a minimal config that allows to boot a
machine. As MTK_DEVAPC is a rather exotic driver to detect bus access
violations, I think it's not a good candidate for inclusion in defconfig.

In any case, I added the SoC maintainer, so that they can correct me, if I'm
wrong :)

Regards,
Matthias
